const express = require('express');
const sql = require('mssql');
const NodeCache = require('node-cache');
const cluster = require('cluster');
const numCPUs = require('os').cpus().length;

// Configuración para entorno de pruebas de carga
const isLoadTesting = process.env.LOAD_TEST === 'true';
const PORT = process.env.PORT || 3000;

if (cluster.isMaster && isLoadTesting) {
  console.log(`Master ${process.pid} is running`);
  
  // Fork workers igual al número de CPUs
  for (let i = 0; i < numCPUs; i++) {
    cluster.fork();
  }
  
  cluster.on('exit', (worker, code, signal) => {
    console.log(`worker ${worker.process.pid} died`);
    cluster.fork();
  });
} else {
  const app = express();
  app.use(express.json({ limit: '10mb' }));
  

  // Configuración agresiva de caché para pruebas de carga
  const myCache = new NodeCache({ 
    stdTTL: 10,         // Tiempo de vida en segundos
    checkperiod: 5,      // Frecuencia de limpieza
    maxKeys: 10000,      // Aumenta este valor (por defecto es 0 = ilimitado)
    useClones: false     // Mejor rendimiento
  });


  // Verificar periodicamente el estado del caché
  setInterval(() => {
    const stats = myCache.getStats();
    console.log(`Cache stats: ${stats.keys} keys, ${stats.hits} hits, ${stats.misses} misses`);
    
    if (stats.keys > 8000) { // Limpia al llegar al 80% de capacidad
      myCache.flushAll();
      console.log('Cache cleared automatically');
    }
  }, 30000); // Cada 30 segundos

  // Configuración optimizada para SQL Server bajo carga
  const sqlConfig = {
    user: 'UsuarioSQL',
    password: 'password2410',
    server: 'localhost',
    database: 'caipiIAdb',
    options: {
      encrypt: true,
      trustServerCertificate: true,
      enableArithAbort: true,
      connectionTimeout: 30000,
      requestTimeout: 5000 // Timeout más corto para pruebas
    },
    pool: {
      max: isLoadTesting ? 50 : 24, // Pool más grande para pruebas
      min: isLoadTesting ? 10 : 3,
      idleTimeoutMillis: 30000,
      acquireTimeoutMillis: 5000,
      createTimeoutMillis: 5000
    }
  };

  let pool;
  let poolReady = false;

  // Función de conexión con reintentos
  async function connectToSQL() {
    try {
      pool = await sql.connect(sqlConfig);
      poolReady = true;
      console.log(`Worker ${process.pid} conectado a SQL Server`);
    } catch (err) {
      console.error(`Worker ${process.pid} error al conectar:`, err);
      setTimeout(connectToSQL, 5000);
    }
  }

  connectToSQL();

  // Middleware para verificar conexión a BD
  app.use((req, res, next) => {
    if (!poolReady) {
      return res.status(503).json({ error: 'Servicio no disponible' });
    }
    next();
  });

  // Ruta optimizada para pruebas de carga
  app.post('/insert-redemption', async (req, res) => {
    const startTime = process.hrtime();
    
    try {
      const params = {
        numberTag: req.body.numberTag || `TEST_${Math.floor(Math.random() * 10000)}`,
        redemptionTransactionTypeId: req.body.redemptionTransactionTypeId || 1,
        idModule: req.body.idModule || 1,
        idSupplierBranch: req.body.idSupplierBranch || 0,
        quantity: req.body.quantity !== undefined ? req.body.quantity : null,
        amount: req.body.amount || Math.random() * 100,
        validation: req.body.validation !== undefined ? req.body.validation : null,
        agreementTermId: req.body.agreementTermId || 10,
        userACanjearId: req.body.userACanjearId || 15,
        idPerson: req.body.idPerson || 10
      };

      // Clave de caché más simple para pruebas
      const cacheKey = `RED_${params.numberTag}`;
      
      if (myCache.has(cacheKey)) {
        const duration = process.hrtime(startTime);
        return res.status(200).json({
          success: true,
          fromCache: true,
          durationMs: duration[0] * 1000 + duration[1] / 1e6
        });
      }

      const request = pool.request();
      Object.entries(params).forEach(([key, value]) => {
        const paramType = key === 'amount' ? sql.Decimal : 
                        key === 'validation' ? sql.Bit : 
                        value === null ? sql.Int : 
                        typeof value === 'number' ? sql.Int : sql.VarChar;
        request.input(key, paramType, value);
      });

      const result = await request.execute('dbo.CaipiSP_InsertRedemptionTransaction');
      
      myCache.set(cacheKey, true, 5); // Cache muy corto para pruebas
      
      const duration = process.hrtime(startTime);
      res.status(200).json({
        success: true,
        fromCache: false,
        durationMs: duration[0] * 1000 + duration[1] / 1e6,
        data: result.recordset
      });
      
    } catch (err) {
      const duration = process.hrtime(startTime);
      console.error(`Error en worker ${process.pid}:`, err);
      res.status(500).json({
        success: false,
        error: 'Error en el servidor',
        durationMs: duration[0] * 1000 + duration[1] / 1e6
      });
    }
  });

  // Endpoint de salud para JMeter
  app.get('/health', (req, res) => {
    res.json({
      status: 'OK',
      worker: process.pid,
      cacheStats: myCache.getStats(),
      poolReady: poolReady
    });
  });

  app.listen(PORT, () => {
    console.log(`Worker ${process.pid} iniciado en puerto ${PORT}`);
  });
}