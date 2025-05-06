// Importa las dependencias
const express = require('express');
const sql = require('mssql');  // Paquete para la conexión con SQL Server

const app = express();
const port = 3000;
app.use(express.json());

// Configuración de la conexión a SQL Server
const config = {
  user: 'UsuarioSQL',  // Reemplaza con tu usuario de SQL Server
  password: 'password2410',  // Reemplaza con tu contraseña
  server: 'localhost',  // Dirección del servidor (localhost si es local)
  database: 'caipiIAdb',  // Nombre de tu base de datos
  options: {
    encrypt: true,  // Habilita la encriptación de la conexión (si es necesario)
    trustServerCertificate: true  // Si no confías en el certificado, ponlo en true
  }
};

// Middleware para parsear el cuerpo de las solicitudes
app.use(express.json());

app.post('/insert-redemption', async (req, res) => {
  console.log('entro')
  try {
    const numberTag = '1234';
    const redemptionTransactionTypeId = 1;
    const idModule = 1;
    const idSupplierBranch = 0;
    const quantity = null; // O undefined si prefieres omitirlo del query
    const amount = 13;
    const validation = null;
    const agreementTermId = 10;
    const userACanjearId = 15;
    const idPerson = 10;
    // Mostrar todo
    console.log({
      numberTag,
      redemptionTransactionTypeId,
      idModule,
      idSupplierBranch,
      quantity,
      amount,
      validation,
      agreementTermId,
      userACanjearId,
      idPerson
    });

    // Conectarse a la base de datos
    await sql.connect(config);

    // Preparar la consulta con parámetros
    const request = new sql.Request();
    request.input('numberTag', sql.VarChar, numberTag);
    request.input('redemptionTransactionTypeId', sql.Int, redemptionTransactionTypeId);
    request.input('idModule', sql.Int, idModule);
    request.input('idSupplierBranch', sql.Int, idSupplierBranch);
    request.input('quantity', sql.Int, quantity);
    request.input('amount', sql.Decimal, amount);
    request.input('validation', sql.Bit, validation);
    request.input('agreementTermId', sql.Int, agreementTermId);
    request.input('userACanjearId', sql.Int, userACanjearId);
    request.input('idPerson', sql.Int, idPerson);

    // Ejecutar el SP
    const result = await request.execute('dbo.CaipiSP_InsertRedemptionTransaction');
    res.status(200).json({ success: true, data: result.recordset });
    
  } catch (err) {
    console.error('Error al insertar datos:', err);
    res.status(500).json({ success: false, error: err.message });
  }
});


// Inicia el servidor
app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});