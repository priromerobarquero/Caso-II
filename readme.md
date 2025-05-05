# 🎓 Caso #2 - 35%

### 🛠️ Temas Abordados:
- T-SQL
- Seguridad
- Concurrencia
- Performance
- Transacciones
- Migrado de datos

---

## 👨‍🏫 Curso: Bases de Datos I  
**Ciclo:** I Semestre, 2025  
**Profesor:** Rodrigo Núñez  

---

## 👥 Estudiantes

| Nombre                     | Carné       |
|---------------------------|-------------|
|  Priscilla Romero Barquero | `2023332718` |
|  Carol Araya Conejo       | `2024089174` |
|  Daniel Sequeira Requenes | `2023282470` |
|  Carlos Abarca Mora       | `2024138701` |

---
# Índice
🧩 1. [Ir al Diseño de la Base de Datos](#-diseño-de-la-base-de-datos---20-pts)

🧩 2. [Ir a la Población de Datos](#-población-de-datos)

🧩 3. [Ir a Demostraciones T-SQL](#-demostraciones-t-sql-uso-de-instrucciones-específicas)

🧩 4. [Ir al Mantenimiento de Seguridad](#mantenimiento-de-la-Seguridad)

🧩 5. [Ir a Consultas Miscelaneas](#consultas-misceláneas)

🧩 6. [Ir a Concurrencia](#concurrencia)

🧩 7. [Ir a la Migracion de los usuarios de Payment Assistant](#migracion-de-los-usuarios-de-payment-assistant)




---
## 🧱 Diseño de la Base de Datos - 20 pts
- **MongoDB:**
##### Paquetes informativos

 <details>
   <summary>Haz clic para expandir</summary>

```json
{
    "paquete": [
      {
        "paquete_id": "001",
        "titulo": "Paquete Profesional Joven",
        "descripcion": "Paquete dirigido a profesionales jovenes.",
        "moneda": "CRC",
        "precio": "₡200,000 colones",
        "limitePersonas": 2,
        "imagenURL": "https://img.com/1",
        "creacion": "2025-04-02T12:30:00Z",
        "tiempoValido": "1 mes",
        "beneficios": [
          { 
            "proveedor": "01",
            "beneficio": "Gimnasio", 
            "cantidad": "6 horas por semana" 
          },
          { 
            "proveedor": "02",
            "beneficio": "Lavandería y aplanchado",
            "cantidad": "1 servicio" 
          },
          { 
            "proveedor": "03",
            "beneficio": "Limpieza básica de hogar",
            "cantidad": "2 días" 
          },
          { 
            "proveedor": "Petroleos Delta",
            "beneficio": "Combustible (gas o diésel)", 
            "cantidad": "₡50,000 colones" 
          },
          { 
            "proveedor": "05",
            "beneficio": "Corte de pelo",
            "cantidad": "1 corte" 
          },
          { 
            "proveedor": "06",
            "beneficio": "Cenas seleccionadas",
            "cantidad": "2 cenas" 
          },
          { 
            "proveedor": "07",
            "beneficio": "Almuerzos seleccionados",
            "cantidad": "4 almuerzos" 
          },
          { 
            "proveedor": "08",
            "beneficio": "Plan móvil",
            "cantidad": "Ilimitado" 
          },
          { 
            "proveedor": "09",
            "beneficio": "Parqueo", 
            "cantidad": "10 horas" 
          }
        ],
        "estado": "activo"
      },
      {
        "paquete_id": "002",
        "titulo": "Paquete Full Modern Family",
        "descripcion": "Paquete ideal para familias modernas.",
        "moneda": "CRC",
        "precio": "₡170,000 colones",
        "limitePersonas": 4,
        "imagenURL": "https://img.com/2",
        "creacion": "2025-04-02T12:30:00Z",
        "tiempoValido": "2 meses",
        "beneficios": [
          { 
            "proveedor": "01",
            "beneficio": "Gimnasio (4 personas)", 
            "cantidad": "4 horas por semana" 
          },
          { "proveedor": "10",
            "beneficio": "Yoga o Pilates (familiar)",
            "cantidad": "4 horas" 
          },
          {
            "proveedor": "11",
            "beneficio": "Grooming para mascota", 
            "cantidad": "1 servicio" 
          },
          { 
            "proveedor": "12",
            "beneficio": "Revisión veterinaria",
            "cantidad": "1 consulta" 
          },
          { 
            "proveedor": "13",
            "beneficio": "Clases de natación o fútbol (niños)", 
            "cantidad": "3 clases" 
          },
          { 
            "proveedor": "04",
            "beneficio": "Combustible (gas o diésel)", 
            "cantidad": "₡100,000 colones" 
          },
          { 
            "proveedor": "14",
            "beneficio": "Comida en casa", 
            "cantidad": "10 pedidos (envío gratis + 20% dto.)" 
          },
          { 
            "proveedor": "15",
            "beneficio": "Uber Rides", 
            "cantidad": "₡7,000 colones en viajes" 
          }
        ],
        "estado": "inactivo"
      },
      {
        "paquete_id": "003",
        "titulo": "Paquete Relax & Wellness",
        "descripcion": "Paquete perfecto para relajarse y recargar energías en pareja.",
        "moneda": "CRC",
        "precio": "₡155,000 colones",
        "limitePersonas": 5,
        "imagenURL": "https://img.com/3",
        "creacion": "2025-04-10T10:00:00Z",
        "tiempoValido": "1 mes",
        "beneficios": [
          {
            "proveedor": "16",
            "beneficio": "Masaje relajante para 2 personas",
            "cantidad": "1 sesión de 45 minutos"
          },
          {
            "proveedor": "10",
            "beneficio": "Clases de yoga o meditación",
            "cantidad": "4 clases"
          },
          {
            "proveedor": "17",
            "beneficio": "Canasta saludable",
            "cantidad": "1 canasta de snacks y jugos"
          },
          {
            "proveedor": "18",
            "beneficio": "Desayuno gourmet",
            "cantidad": "2 desayunos"
          },
          {
            "proveedor": "19",
            "beneficio": "Entradas al cine",
            "cantidad": "2 entradas + palomitas"
          },
          {
            "proveedor": "15",
            "beneficio": "Transporte incluido",
            "cantidad": "₡5,000 colones en viajes"
          },
          {
            "proveedor": "08",
            "beneficio": "Plan de datos temporal",
            "cantidad": "Internet ilimitado por 1 semana"
          }
        ],
        "estado": "activo"
      }
      
    ]
  }
```
</details>

##### Proveedores

 <details>
   <summary>Haz clic para expandir</summary>

```json
{
    "proveedores": [
      {
        "id": "01",
        "nombre": "SmartFit",
        "url": "https://www.smartfit.com",
        "logo": "https://logo.clearbit.com/smartfit.com"
      },
      {
        "id": "02",
        "nombre": "Lavadería Pressto",
        "url": "https://www.pressto.com",
        "logo": "https://logo.clearbit.com/pressto.com"
      },
      {
        "id": "03",
        "nombre": "Broomday",
        "url": "https://broomday.cr",
        "logo": "https://imgur.com/broomday_logo.png"
      },
      {
        "id": "04",
        "nombre": "Petroleos Delta",
        "url": "https://www.deltacr.com",
        "logo": "https://logo.clearbit.com/deltacr.com"
      },
      {
        "id": "05",
        "nombre": "Vainilla beauty",
        "url": "https://www.instagram.com/vainillabeautycr/",
        "logo": "https://imgur.com/vainilla_logo.png"
      },
      {
        "id": "06",
        "nombre": "El novillo alegre",
        "url": "https://www.elnovilloalegre.com",
        "logo": "https://logo.clearbit.com/elnovilloalegre.com"
      },
      {
        "id": "07",
        "nombre": "Rostipollos",
        "url": "https://www.rostipollos.com",
        "logo": "https://logo.clearbit.com/rostipollos.com"
      },
      {
        "id": "08",
        "nombre": "Kolbi",
        "url": "https://www.kolbi.cr",
        "logo": "https://logo.clearbit.com/kolbi.cr"
      },
      {
        "id": "09",
        "nombre": "Valet Parking",
        "url": "https://valetparking.cr",
        "logo": "https://imgur.com/valetparking_logo.png"
      },
      {
        "id": "10",
        "nombre": "Gym Tec",
        "url": "https://gymtec.cr",
        "logo": "https://imgur.com/gymtec_logo.png"
      },
      {
        "id": "11",
        "nombre": "Hipermascotas",
        "url": "https://hipermascotas.cr",
        "logo": "https://imgur.com/hipermascotas_logo.png"
      },
      {
        "id": "12",
        "nombre": "La Vete",
        "url": "https://lavete.cr",
        "logo": "https://imgur.com/lavete_logo.png"
      },
      {
        "id": "13",
        "nombre": "Crol Swimming",
        "url": "https://www.crolswimming.com",
        "logo": "https://logo.clearbit.com/crolswimming.com"
      },
      {
        "id": "14",
        "nombre": "Uber Eats",
        "url": "https://www.ubereats.com",
        "logo": "https://logo.clearbit.com/ubereats.com"
      },
      {
        "id": "15",
        "nombre": "Uber",
        "url": "https://www.uber.com",
        "logo": "https://logo.clearbit.com/uber.com"
      },
      {
        "id": "16",
        "nombre": "Spa Vida Zen",
        "url": "https://www.spavidazen.com",
        "logo": "https://logo.clearbit.com/spavidazen.com"
      },
      {
        "id": "17",
        "nombre": "Fresh Market",
        "url": "https://www.freshmarket.cr",
        "logo": "https://logo.clearbit.com/freshmarket.cr"
      },
      {
        "id": "18",
        "nombre": "Café Arte",
        "url": "https://cafearte.cr",
        "logo": "https://imgur.com/cafearte_logo.png"
      },
      {
        "id": "19",
        "nombre": "Cinemark",
        "url": "https://www.cinemarkca.com",
        "logo": "https://logo.clearbit.com/cinemarkca.com"
      }
    ]
  }
```
</details>

##### Promociones

 <details>
   <summary>Haz clic para expandir</summary>

```json
{
    "promociones": [
      {
        "promo_id": "001",
        "titulo": "Descuento en gimnasio con SmartFit",
        "descripcion": "Obtén un 25% de descuento en membresías mensuales con SmartFit al adquirir el Paquete Profesional Joven.",
        "creado_el": "2025-04-10T09:00:00Z",
        "valido_hasta": "2025-05-10T23:59:59Z",
        "imagenURL": "https://imgpromo.com/smartfit25.png",
        "promoURL": "https://soltura.cr/promociones/001",
        "codigoBarras": "1234567890123",
        "condiciones": [
          "Válido solo para nuevas membresías.",
          "No acumulable con otras promociones.",
          "Aplicable únicamente en gimnasios SmartFit participantes."
        ],
        "tipoPromocion": "descuento",
        "estado": "inactivo"
      },
      {
        "promo_id": "002",
        "titulo": "10% de descuento en tu primer plan Soltura personalizado",
        "descripcion": "Arma tu propio paquete con los servicios que más usás: gimnasio, comida, belleza, transporte y más. ¡Y obtené un 10% de descuento en tu primer mes!",
        "creado_el": "2025-04-14T08:00:00Z",
        "valido_hasta": "2025-05-31T23:59:59Z",
        "imagenURL": "https://soltura.cr/media/promo-soltu-personal.png",
        "promoURL": "https://soltura.cr/promociones/002",
        "codigoBarras": "7894561230123",
        "condiciones": [
            "Válido solo para nuevos usuarios de planes personalizados.",
            "El descuento se aplica únicamente al primer mes del plan.",
            "No acumulable con otras promociones activas.",
            "Promoción válida únicamente en planes creados desde la app oficial de Soltura."
        ],
        "tipoPromocion": "descuento",
        "estado": "activo"
      },
      {
        "promo_id": "003",
        "titulo": "¡Invitá a un amigo y ambos obtienen 1 mes gratis!",
        "descripcion": "Recomendá Soltura a tus amigos y por cada uno que se registre y active su primer plan, ambos recibirán un mes completamente gratis en su membresía.",
        "creado_el": "2025-04-14T08:00:00Z",
        "valido_hasta": "2025-06-30T23:59:59Z",
        "imagenURL": "https://soltura.cr/media/promo-amigos.png",
        "promoURL": "https://soltura.cr/promociones/003",
        "codigoBarras": "998877665544",
        "condiciones": [
          "La persona referido debe activar un plan Soltura en los primeros 7 días tras registrarse.",
          "La promoción aplica únicamente si ambos usuarios completan el proceso de verificación.",
          "Solo se otorga 1 mes gratuito por cada referido.",
          "Promoción válida hasta agotar existencias de meses gratuitos o hasta la fecha de finalización."
        ],
        "tipoPromocion": "referido",
        "estado": "activo"
      }    
    ]
  }
```
</details>


##### Mercadeo y Media

 <details>
   <summary>Haz clic para expandir</summary>


```json
{
    "marketing_media": [
      {
        "media_id": "001",
        "tipo": "video",
        "titulo": "Soltura: Lo que tu rutina necesitaba",
        "descripcion": "Historias reales de usuarios que transformaron su día a día con Soltura.",
        "videourl": "https://soltura.cr/media/vida-simplificada.mp4",
        "url_thumbnail": "https://soltura.cr/media/thumb-vida.jpg",
        "duracion": "03:02",
        "formato": "mp4",
        "etiquetas": ["vida real", "usuarios", "transformación", "ahorro"],
        "fecha_publicacion": "2025-04-10T10:00:00Z",
        "estadisticas": {
            "vistas": 3200,
            "comentarios": 15
        },
        "estado": "activo"
      },
      {
        "media_id": "002",
        "tipo": "imagen",
        "titulo": "Una vida más ligera empieza con Soltura",
        "descripcion": "Historias visuales: día relajado, cero trámites, todo resuelto. Soltura es la libertad en acción.",
        "imagenURL": "https://soltura.cr/media/vida-ligera.jpg",
        "formato": "jpg",
        "resolucion": "2480x3508 px",
        "dimensiones": {
          "ancho": 1080,
          "alto": 1080
        },
        "etiquetas": ["vida ligera", "beneficios"],
        "fecha_publicacion": "2025-04-13T12:00:00Z",
        "estadisticas": {
            "vistas": 5200,
            "comentarios": 12
        },
        "estado": "activo"
      },
      {
        "media_id": "003",
        "tipo": "video",
        "titulo": "Soltura ahora en todo el país",
        "descripcion": "Ahora puedes simplificar tu vida desde cualquier lugar. Ampliamos cobertura a 5 ciudades nuevas.",
        "videourl": "https://soltura.cr/media/ampliacion.mp4",
        "url_thumbnail": "https://soltura.cr/media/thumb-ampliacion.jpg",
        "duracion": "01:10",
        "formato": "mp4",
        "etiquetas": ["Costa Rica", "beneficios", "ahorro"],
        "fecha_publicacion": "2025-05-13T12:00:00Z",
        "estadisticas": {
            "vistas": 200,
            "comentarios": 2
        },
        "estado": "activo"
      },
      {
        "media_id": "004",
        "tipo": "imagen",
        "titulo": "Soltura ahora se hace uno con Payment Assistant, la app #1 para tus pagos recurrentes",
        "descripcion": "A partir del 1 de Mayo del 2025 podrás acceder a todos los beneficios que Payment Assistant tiene para ti. Visista el link para saber como puedes acceder a ella",
        "url_masInfo": "https://soltura.cr/informacion/appAssis",
        "imagenURL": "https://soltura.cr/media/appAssistant.jpg",
        "formato": "jpg",
        "resolucion": "2470x3510 px",
        "dimensiones": {
          "ancho": 1080,
          "alto": 1080
        },
        "etiquetas": ["pagos ", "beneficios"],
        "fecha_publicacion": "2025-05-01T12:00:00Z",
        "estadisticas": {
            "vistas": 5200,
            "comentarios": 40
        },
        "estado": "activo"
      }

    ]
  }
```

</details>


##### Servicio al cliente - Seguimento de casos - Reviews - Resolución de quejas

 <details>
   <summary>Haz clic para expandir</summary>

```json
{
  "casos": [
    {
      "id_caso": "CASO-2024-001",
      "fecha_apertura": "2024-05-15T09:30:00-06:00",
      "agente_asignado": "Carol Araya",  
      "cliente": {
        "nombre": "Carlos Abarca",
        "identificacion": "1-1923-0668",
        "contacto": {
          "medio": "WhatsApp Business",
          "detalle": "+506 8888-1234"
        }
      },
      "asunto": {
        "tipo": "Reclamo",
        "subtipo": "Facturación incorrecta",
        "descripcion": "Cobro duplicado en factura #45678 del servicio Premium."
      },
      "atencion": [
        {
          "fecha": "2024-05-15T09:35:00-06:00",
          "accion": "Verificación de factura en sistema",
          "comentario": "Se confirma cobro duplicado por error de sistema."
        },
        {
          "fecha": "2024-05-15T10:00:00-06:00",
          "accion": "Solución propuesta",
          "comentario": "Se programa reembolso automático en 3 días hábiles.",
          "respuesta_cliente": "Cliente conforme con la solución."
        }
      ],
      "estado": "resuelto",
      "fecha_cierre": "2024-05-15T10:15:00-06:00"
    },
    {
      "id_caso": "CASO-2024-002",
      "fecha_apertura": "2024-05-16T14:20:00-06:00",
      "agente_asignado": "Priscilla Barquero",  
      "cliente": {
        "nombre": "Daniel Sequeira",
        "identificacion": "2-3456-7890",
        "contacto": {
          "medio": "Llamada telefónica",
          "detalle": "+506 7000-5678"
        }
      },
      "asunto": {
        "tipo": "Consulta",
        "subtipo": "Cobertura de servicios",
        "descripcion": "¿Incluye el Plan Básico consultas médicas urgentes?"
      },
      "atencion": [
        {
          "fecha": "2024-05-16T14:25:00-06:00",
          "accion": "Revisión de cobertura",
          "comentario": "Se explica que solo cubre consultas no urgentes."
        },
        {
          "fecha": "2024-05-16T14:28:00-06:00",
          "accion": "Solución propuesta",
          "comentario": "Se explican los planes que sí incluyen consultas médicas urgentes.",
          "respuesta_cliente": "Cliente conforme con la solución."
        }
      ]
    }
  ]
}
```
</details>

- **SQL Server:**  
  > 

## 🧪 Test de la Base de Datos - 65 pts

Ahora que ya Soltura cuenta con un diseño de base de datos aprobados por los ingenieros, CTO, contrapartes ingenieros de Soltura, se les ha pedido que realicen pruebas contextuales para medir el comportamiento, técnicas, rendimiento y semántica de la base de datos diseñada en SQL Server. A continuación se detallan todos los test requeridos.

### 📊 Población de Datos

Crear scripts de llenado utilizando exclusivamente T-SQL, cumpliendo los siguientes requisitos:

- El sistema debe operar con al menos dos monedas (ej. CRC y USD).
- Crear al menos 25 usuarios con suscripciones activas y 5 usuarios sin suscripción, distribuidos entre diferentes regiones o afiliaciones.
- Cargar los catálogos base del sistema:
  - Tipos de servicios (gimnasios, salud, parqueos, etc.)
  - Tipos de planes
  - Métodos de pago
  - Monedas
  - Estados de suscripción
- Llenar la tabla de planes de suscripción, con variaciones como:
  - Joven Deportista
  - Familia de Verano
  - Viajero Frecuente
  - Nómada Digital
- Incluir al menos 7 empresas proveedoras de servicios, cada una ofreciendo entre 2 y 4 combinaciones de servicios. Estas combinaciones deben utilizarse para definir entre 7 y 9 planes distintos.
- Para cada plan de servicios, deben existir entre 3 y 6 suscripciones, cada una asignada a usuarios únicos que no estén repetidos en otras combinaciones.

---
### Catalogo Base del sistema
El siguiente script corresponde a la carga de catálogos base del sistema, desarrollado en T-SQL:
#### Tipos de Recordatorios (`caipi_remindertypes`)
```sql
INSERT INTO [dbo].[caipi_remindertypes] ([name], [description])
VALUES
    ('SMS', 'Envío de notificaciones por mensaje de texto'),
    ('Email', 'Envío de notificaciones por correo electrónico'),
    ('Push', 'Notificación dentro de la aplicación móvil'),
    ('WhatsApp', 'Notificación enviada por WhatsApp'),
    ('Popup', 'Ventana emergente dentro del sistema');
```

#### Subscription Status

```sql
INSERT INTO [dbo].[caipi_subscription_status] ([name], [description], [enable])
VALUES
    ('Activa', 'La suscripción está activa y operativa', 1),
    ('Pendiente', 'La suscripción está en proceso de activación o aprobación', 1),
    ('Suspendida', 'La suscripción ha sido pausada temporalmente', 1),
    ('Cancelada', 'La suscripción fue cancelada por el usuario o el sistema', 1),
    ('Expirada', 'La suscripción ha llegado a su fecha de expiración', 1);
```

---

#### Subscription Types

```sql
INSERT INTO [dbo].[caipi_subscription_types] ([name], [description], [customizable])
VALUES
    ('Mensual', 'Plan mensual con beneficios fijos', 0),
    ('Mensual Personalizable', 'Plan mensual con beneficios modificables por el usuario', 1),
    ('Anual', 'Plan anual con beneficios fijos', 0),
    ('Anual Personalizable', 'Plan anual con beneficios modificables por el usuario', 1),
    ('Trimestral', 'Plan trimestral con beneficios fijos', 0),
    ('Trimestral Personalizable', 'Plan trimestral con beneficios modificables por el usuario', 1),
    ('Semestral', 'Plan semestral con beneficios fijos', 0),
    ('Semestral Personalizable', 'Plan semestral con beneficios modificables por el usuario', 1);
```

---

#### Subscription Settings Types

```sql
INSERT INTO [dbo].[caipi_suscriptionSettingTypes] ([sucriptionSettingTypeId], [name], [description], [enable])
VALUES
    (1, 'Cantidad de beneficiarios', 'Número máximo de personas que pueden usar la suscripción', 1),
    (2, 'Acceso a servicios adicionales', 'Permite acceso a beneficios o servicios complementarios', 1),
    (3, 'Frecuencia de uso', 'Cantidad de veces que se puede utilizar el servicio en un periodo', 1),
    (4, 'Periodo de validez', 'Duración total del plan o suscripción', 1),
    (5, 'Cobertura geográfica', 'Zonas o ubicaciones donde es válido el plan', 1),
    (6, 'Soporte incluido', 'Tipo de asistencia disponible dentro del plan', 1),
    (7, 'Capacidad de uso', 'Límite en volumen, cantidad o tiempo de uso permitido', 1),
    (8, 'Acceso a contenido exclusivo', 'Permite acceso a beneficios especiales no estándar', 1),
    (9, 'Renovación automática', 'Indica si la suscripción se renueva sin intervención del usuario', 1),
    (10, 'Nivel de personalización', 'Grado en el que el usuario puede modificar los beneficios del plan', 1);
```

---

#### Payment Methods

```sql
INSERT INTO [dbo].[caipi_paymentMethods] ([name], [apiURL], [secretKey], [key], [enable])
VALUES
    ('PayPal', 'https://api.paypal.com/v1/', 0x5A3D4C6F2A7B9C5F1234567890ABCDE1234567890ABCDEF0123456789ABCDEF, 0x7F5A9B6C5D7E1F23334567890ABCDE1234567890ABCDEF0123456789ABCDE, 1),
    ('Stripe', 'https://api.stripe.com/v1/', 0x8F3A7B9C1D2E3F9A1234567890ABCDE1234567890ABCDEF0123456789ABCDE, 0x9B3D6C2F1D8E7A234567890ABCDE1234567890ABCDEF0123456789ABCDE, 1),
    ('MercadoPago', 'https://api.mercadopago.com/v1/', 0x2D3A5F9B1C7E9D3A567890ABCDE1234567890ABCDEF0123456789ABCDE, 0x4F2A8D6E3B9F0A234567890ABCDE1234567890ABCDEF0123456789ABCDE, 1),
    ('RappiPay', 'https://api.rappipay.com/v1/', 0x1A3D4E5F2B8C9D3A567890ABCDE1234567890ABCDEF0123456789ABCDE, 0x5E7A9D2B6C3F4A1234567890ABCDE1234567890ABCDEF0123456789ABCDE, 1),
    ('Apple Pay', 'https://api.apple.com/v1/', 0x0B5D6F3A2C8E9D234567890ABCDE1234567890ABCDEF0123456789ABCDE, 0x9C7F2A3D8B5E1F9A234567890ABCDE1234567890ABCDEF0123456789ABCDE, 1);
```

#### InsertarPaymentMethods Procedure
```sql
CREATE OR ALTER PROCEDURE InsertarPaymentMethods
	--no hay parametros
AS
BEGIN
    -- Declaración de variables
    DECLARE @i INT = 1;
    DECLARE @name NVARCHAR(50);
    DECLARE @methodId INT;
    DECLARE @token NVARCHAR(100);
    DECLARE @expTokenDate DATETIME;
    DECLARE @maskAccount VARCHAR(10);
    DECLARE @callbackURL NVARCHAR(100);
    DECLARE @configurationDetails NVARCHAR(MAX);
    DECLARE @refreshToken VARBINARY(MAX);

    -- Cursor para recorrer los métodos de pago existentes, recibiendo loda daros de la consulta select de la tabla que contiene los metodos de pago
    DECLARE method_cursor CURSOR FOR
        SELECT [name],[methodId]
        FROM [dbo].[caipi_paymentMethods];

    OPEN method_cursor;
    FETCH NEXT FROM method_cursor INTO @name, @methodId; --Recorre el primerregistro, almacena el nombre y el id del metodo que sera utilizado en la insercion

    -- Ciclo para insertar datos en la tabla de métodos de pago
    WHILE @i <= 15
    BEGIN
		-- Asignar valores dinámicos a las variables
        SET @token = CONVERT(NVARCHAR(100), NEWID());
        SET @expTokenDate = DATEADD(DAY, @i * 30, GETDATE());  -- Asignación de fechas, incrementa cada 30 días
        SET @maskAccount = CONCAT('****', RIGHT('000' + CAST((1000 + @i * 7) AS VARCHAR), 4));  -- Cuenta enmascarada con incremento
        SET @callbackURL = CONCAT('https://example.com/callback/method', @i);
        SET @configurationDetails = CONCAT('{"currency":"USD", "method":"', @name, '"}');
        SET @refreshToken = CAST(HASHBYTES('SHA2_256', @token) AS VARBINARY(MAX));  -- Encriptación del token

        -- Insertar el registro en la tabla
        INSERT INTO [dbo].[caipi_availablePaymentMethods]
           ([name], [token], [expTokenDate], [maskAccount], [callbackURL], [configurationDetails], [refreshToken], [methodId])
        VALUES
           (@name, @token, @expTokenDate, @maskAccount, @callbackURL, @configurationDetails, @refreshToken, @methodId);  -- Usa @methodId como ID del método QUE ES APUNTADO POR EL CURSOR

        SET @i += 1;  -- Incrementar el contador para el siguiente ciclo
        -- Obtener el siguiente método de pago
        FETCH NEXT FROM method_cursor INTO @name, @methodId;

		-- Si ya se recorrio hasta último registro, vuelve al inicio para volver a recorrer la consulta
		IF @@FETCH_STATUS <> 0 -- Ya no hay más registros
		BEGIN
			-- Reinicia el cursor a la primera fila
			CLOSE method_cursor;

			-- Reabriendo el cursor
			OPEN method_cursor;
			FETCH NEXT FROM method_cursor INTO @name, @methodId; -- Vuelve al primer registro
		END
    END

    -- Cerrar y liberar el cursor
    CLOSE method_cursor;
    DEALLOCATE method_cursor;
END
```

#### AddPaymentMethodsPerSupplier Procedure
```sql
/*

	Crea la relacion de los metodos de pago existentes y disponibles para cada proveedor, asigna solo 1 y diferente para el mismo.

*/
CREATE OR ALTER PROCEDURE AddPaymentMethodsPerSupplier
	--SIN PARAMETROS
AS
BEGIN
	--Declare local variables
	DECLARE @SupplierQuantity INT = 15 --cantidad de proveedores
	DECLARE @MethodsQuantity INT = 5 --cantidad de metodos disponibles
	DECLARE @MethodId INT --Id del metodo seleccionado de forma aleatoria
	DECLARE @SupplierCount INT = 1 --Contador de ciclo que recorre los registros de proveedores el cual funciona tambien como ID del supplier


	WHILE @SupplierCount <= @SupplierQuantity
    BEGIN
		--Escoge un metodo de pago disponible entre los id registrados con el checkscum obtengo distintos valores en cada interacion de RAND
		SET @MethodId = FLOOR(1 + RAND(CHECKSUM(NEWID())) * @MethodsQuantity);

		INSERT INTO [dbo].[caipi_AvailablePaymentMethodsPerSuppliers]
			   ([enable]
			   ,[paymentMethodId]
			   ,[supplierId])
		 VALUES
			   (1
			   ,@MethodId
			   ,@SupplierCount)

		SET @SupplierCount +=1;
	END
END
```

#### Insert Transaction Types
```sql
INSERT INTO [dbo].[caipi_transTypes] ([transactionTypeId], [name], [deleted], [transTypeId])
VALUES
    (1, 'Credit', 0, 101),            
    (2, 'Debit', 0, 102),              
    (3, 'Refund', 0, 103),           
    (4, 'Manual Adjustment', 0, 104),  
    (5, 'Chargeback', 0, 105),            
    (6, 'Deposit', 0, 106),               
    (7, 'Withdrawal', 0, 107),            
    (8, 'Transfer', 0, 108);         
```

#### Insert Transaction Sub Types
```sql
INSERT INTO [dbo].[caipi_transSubTypes] ([name], [deleted])
VALUES
    ('Prize Awarded', 0),
    ('Product Purchase', 0),
    ('Refund Claim', 0),
    ('Transaction Approval', 0),
    ('Subscription Payment', 0),
    ('Service Activation', 0),
    ('Account Credit', 0),
    ('Service Cancellation', 0),
    ('Balance Adjustment', 0),
    ('Interest Payment', 0);
```

#### Insert Log Severity Levels
```sql
INSERT INTO [dbo].[caipi_logSeverity] ([name])
VALUES
    ('Low'),
    ('Medium'),
    ('High'),
    ('Critical'),
    ('Informational');
```

#### Insert Log Sources
```sql
INSERT INTO [dbo].[caipi_logsSources] ([name])
VALUES
    ('System'),
    ('Application'),
    ('Database'),
    ('Security'),
    ('User Activity'),
	('Network'),
    ('API'),
    ('Payment Gateway'),
    ('Error Handler'),
    ('Authentication'),
    ('File System');
```

#### Insert Log Types
```sql
INSERT INTO [dbo].[caipi_logTypes] ([name])
VALUES
    ('Error'),
    ('Warning'),
    ('Info'),
    ('Debug'),
    ('Critical'),
    ('Audit'),
    ('Security'),
    ('Transaction'),
    ('Performance'),
    ('Access');
```

#### Insert Unit Measures
```sql
INSERT INTO [dbo].[caipi_measureUnits] ([name], [enable], [deleted], [dataType])
VALUES
    ('Hora', 1, 0, 'Decimal'),
    ('Pieza', 1, 0, 'Integer'),
    ('Colones', 1, 0, 'Decimal'),
    ('Kilogramo', 1, 0, 'Decimal'),
    ('Litro', 1, 0, 'Decimal'),
    ('Clase', 1, 0, 'Integer'),
    ('Consulta', 1, 0, 'Integer'),
    ('Servicio', 1, 0, 'Integer'),
	('Descuento', 1, 0, 'Integer'),
	('Almuerzo', 1, 0, 'Integer'),
	('Dias', 1, 0, 'Integer');
```
#### Services Types
```sql
INSERT INTO [dbo].[caipi_serviceTypes] ([idServiceType], [name], [description], [enable])
VALUES
    (1, 'Gimnasios', 'Servicios de entrenamiento físico y bienestar', 1),
    (2, 'Salud', 'Centros médicos, clínicas y servicios de salud', 1),
    (3, 'Parqueos', 'Zonas de estacionamiento para vehículos', 1),
    (4, 'Comedores', 'Servicios de alimentación y comedores comunitarios', 1),
    (5, 'Educación', 'Escuelas, guarderías y centros de aprendizaje', 1),
    (6, 'Transporte', 'Servicios de transporte público o privado', 1),
    (7, 'Cultura', 'Centros culturales, bibliotecas y museos', 1),
    (8, 'Recreación', 'Áreas recreativas y de esparcimiento', 1),
    (9, 'Deporte', 'Instalaciones deportivas y clubes atléticos', 1),
    (10, 'Tecnología', 'Acceso a servicios tecnológicos y digitales', 1);
```

#### Services
```sql
INSERT INTO [dbo].[caipi_services] ([name], [description], [enable], [image], [idServiceType])
VALUES
    ('Membresía de Gimnasio', 'Acceso a instalaciones de gimnasio', 1, 1, 1),
    ('Clases de Yoga', 'Sesiones de yoga para principiantes y avanzados, con enfoque en bienestar y flexibilidad', 1, 2, 1),
    ('Corte y Cuidado de Mascotas', 'Servicio profesional de grooming', 1, 3, 2),
    ('Consultas Veterinarias', 'Consultas médicas para mascotas', 1, 4, 2),
    ('Clases de Natación', 'Clases de natación para personas de todas las edades, desde principiantes hasta avanzados', 1, 5, 9),
    ('Descuento en Combustible', 'Descuento mensual en combustible, aplicable en estaciones de servicio seleccionadas', 1, 6, 6),
    ('Pedidos de Comida a Domicilio', 'Descuento y promociones en pedidos de comida a través de plataformas de entrega', 1, 7, 4),
    ('Descuentos en Viajes', 'Descuentos en viajes realizados', 1, 8, 6),
    ('Mantenimiento para Mascotas', 'Paquete completo de salud preventiva y cuidado para mascotas', 1, 9, 2),
    ('Entrenamiento Deportivo', 'Clases de fútbol', 1, 10, 9),
    ('Servicios de Belleza', 'Corte de cabello, tratamientos faciales y corporales, manicura y pedicura', 1, 11, 2),
    ('Asesoría Nutricional', 'Consultas con nutricionistas para mejorar la dieta y el estilo de vida saludable', 1, 12, 2),
    ('Estacionamiento Privado', 'Acceso a espacios de estacionamiento privado en zonas estratégicas', 1, 13, 3),
    ('Entrenamiento Personalizado', 'Entrenamiento físico y nutricional a medida, con seguimiento personalizado', 1, 14, 1);
```

#### Modules
```sql
INSERT INTO [dbo].[caipi_modules]
           ([name], [enable], [deleted])
     VALUES
           ('Gestión de Planes', 1, 0),
           ('Módulo de Membresías', 1, 0),
           ('Módulo de Pagos y Facturación', 1, 0),
           ('Módulo de Notificaciones', 1, 0),
           ('Módulo de Servicios', 1, 0),
           ('Módulo de Proveedores', 1, 0),
           ('Módulo de Suscripciones', 1, 0),
           ('Módulo de Reportes', 1, 0),
           ('Módulo de Usuarios', 1, 0),
           ('Módulo de Seguridad', 1, 0);
```

#### Redemption Transaction Types
```sql
INSERT INTO [dbo].[caipi_RedemptionTransactionTypes]
           ([name], [enable], [deleted])
     VALUES
           ('Cupon', 1, 0),
           ('NFC', 1, 0),
           ('QR', 1, 0);
```

#### Redemption Sub Types
```sql
INSERT INTO [dbo].[caipi_redemptionSubType]
           ([name], [enable], [deleted])
     VALUES
           ('Proveedor',1,0),
           ('Usuario',1,0),
           ('Servicio',1,0);
```

#### Notification Methods
```sql
INSERT INTO [dbo].[caipi_notificationmethods]
           ([name], [lastupdate], [createddate], [enabled], [callbackurlget], [callbackurlpost], [callbackurlredirect], [messagingserviceid], [authtoken])
     VALUES
           ('SendGrid Email', GETDATE(), GETDATE(), 1, 'https://api.sendgrid.com/get', 'https://api.sendgrid.com/post', 'https://api.sendgrid.com/redirect', 'SENDGRID_SERVICE_ID', 'SENDGRID_API_KEY'),
           ('Mailgun Email', GETDATE(), GETDATE(), 1, 'https://api.mailgun.com/get', 'https://api.mailgun.com/post', 'https://api.mailgun.com/redirect', 'MAILGUN_SERVICE_ID', 'MAILGUN_API_KEY'),
           ('Twilio SMS', GETDATE(), GETDATE(), 1, 'https://api.twilio.com/get', 'https://api.twilio.com/post', 'https://api.twilio.com/redirect', 'SMXXXXXX', 'twilio_auth_token');
```

#### Contact Info Type
```sql
INSERT INTO [dbo].[caipi_contactInfoType]
           ([name], [enable])
     VALUES
           ('Email',1),
           ('Numero Telefonico',1),
           ('Fax',1),
           ('Sitio Web',1),
           ('Numero Movil',1);
```

#### Contact Info Per Supplier
```sql
INSERT INTO [dbo].[caipi_contactInfoPerSupplier]
           ([enable], [value], [contactInfoTypeId], [idSupplier])
     VALUES
           (1, 'info@theretreatcr.com', 1, 1),
           (1, '+506 4000 1234', 2, 1),
           (1, 'contacto@vidamia.com', 1, 2),
           (1, '+506 4000 5678', 5, 2),
           (1, 'www.agromedica.cr', 4, 3),
           (1, '+506 2222 3333', 2, 3),
           (1, 'pawsco@vetservices.com', 1, 4),
           (1, '+506 8888 7777', 5, 4),
           (1, 'www.thepetsclub.cr', 4, 5),
           (1, '+506 6000 9000', 2, 5),
           (1, 'info@volairstudio.com', 1, 6),
           (1, '+506 7000 8000', 5, 6),
           (1, 'smartfit@fitness.com', 1, 7),
           (1, 'www.smartfit.cr', 4, 7),
           (1, 'amamaser@wellness.com', 1, 8);
```

#### Countries
```sql
INSERT INTO [dbo].[caipi_countries]
           ([countryId], [name], [phoneCode])
     VALUES
           (1, 'Costa Rica', '+506'),
           (3, 'México', '+52'),
           (5, 'Colombia', '+57'),
           (6, 'Argentina', '+54'),
           (7, 'Chile', '+56'),
           (8, 'Perú', '+51'),
           (9, 'Brasil', '+55');
```

#### States
```sql
INSERT INTO [dbo].[caipi_states]
           ([name], [enable], [countryId])
     VALUES
           ('Cartago', 1, 1),
           ('San José', 1, 1),
           ('Puntarenas', 1, 1), 
           ('Guerrero', 1, 3), 
           ('Jalisco', 1, 3),
           ('California', 1, 5), 
           ('Antioquia', 1, 5), 
           ('Valle del Cauca', 1, 5), 
           ('Buenos Aires', 1, 6), 
           ('Mendoza', 1, 6), 
           ('Santa Fe', 1, 6),
           ('Santiago', 1, 7),
           ('Lima', 1, 8);
```

#### Cities
```sql
INSERT INTO [dbo].[caipi_cities]
           ([name], [enable], [stateId])
     VALUES
           ('Guadalupe', 1, 1), 
           ('Cartago', 1, 1), 
           ('Turrialba', 1, 1), 
           ('Guadalajara', 1, 5), 
           ('Tlaquepaque', 1, 5), 
           ('Zapopan', 1, 7), 
           ('Medellín', 1, 7), 
           ('Envigado', 1, 7), 
           ('Itagüí', 1, 5), 
           ('Buenos Aires', 1, 9),
           ('La Plata', 1, 9), 
           ('Mar del Plata', 1, 9), 
           ('Santiago', 1, 12),
           ('Providencia', 1, 12), 
           ('Las Condes', 1, 12), 
           ('Lima', 1, 13),
           ('Miraflores', 1, 13), 
           ('San Isidro', 1, 13);
```

#### Types Branch
```sql
INSERT INTO [dbo].[caipi_typesBranch]
           ([name], [enable], [deleted])
     VALUES
           ('Fisica', 1, 0),
           ('Ecommerce', 1, 0),
           ('Distribución', 1, 0),
           ('Móvil', 1, 0),
           ('Atención al Cliente', 1, 0),
           ('Corporativa', 1, 0),
           ('Atención Especializada', 1, 0),
           ('Soporte Técnico', 1, 0);
```

#### Plan Types
```sql
INSERT INTO caipi_planTypes (name, enable, deleted)
VALUES 
('Básico', 1, 0),
('Personalizado', 1, 0),
('Familiar', 1, 0),
('Corporativo', 1, 0),
('Estudiantil', 1, 0),
('Salud y Bienestar', 1, 0);
```

#### Plans
```sql
CREATE PROCEDURE LlenarPlanes
AS
BEGIN
    DECLARE @countPlanes INT = 15;
    DECLARE @planesID INT;
    DECLARE @Name VARCHAR(30);
    DECLARE @planType INT;
    DECLARE @checkSum VARBINARY(255); -- HASHBYTES devuelve VARBINARY
    DECLARE @fecha DATETIME;
    DECLARE @total DECIMAL(5,2);
    DECLARE @mensual DECIMAL(5,2);

    DECLARE @nombres TABLE (nombre VARCHAR(30));
    
    -- Se insertan los 15 planes disponibles 
    INSERT INTO @nombres(nombre)
    VALUES 
        ('Joven Deportista'), ('Familia de Verano'), ('Viajero Frecuente'), ('Nómada Digital'),
        ('Profesional en Movimiento'), ('Estudiante Proactivo'), ('Creativo Freelance'), ('Full Wellness'),
        ('Tiempo en Familia'), ('Explorador Urbano'), ('Hogar Equilibrado'), ('Fit & Chill'),
        ('EcoVida'), ('Combo Soltura'), ('Zen Diario');

    DECLARE @i INT = 1;

 -- Se inicia el ciclo para insertar los 15 planes
    WHILE @i <= 15
    BEGIN
        SET @planesID = @i;

        SELECT @Name = nombre FROM (
            SELECT nombre, ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn FROM @nombres
        ) AS nombres_ordenados
        WHERE rn = @i;

        -- Tipo de plan entre 1 y 6
        SET @planType = FLOOR(1 + RAND() * 6);

        -- Fecha aleatoria entre 2024-06-01 y hoy
        DECLARE @startDate DATETIME = '2024-06-01 00:00:00';
        DECLARE @secondsRange INT = DATEDIFF(SECOND, @startDate, GETDATE());
        SET @fecha = DATEADD(SECOND, FLOOR(RAND(CHECKSUM(NEWID())) * @secondsRange), @startDate);

        -- Monto total entre 100 y 200
        SET @total = ROUND(100 + (RAND() * 100), 2); 
        -- Monto Mensual entre 50 y 60
        SET @mensual = ROUND(50 + (RAND() * 10), 2);

        -- Checksum
        SET @checkSum = HASHBYTES('SHA2_512', CONCAT(@planesID, @Name, 'fbsdinaldkna3193'));

        -- Insertamos en la tabla
        INSERT INTO caipi_plans(name, description, enable, deleted, checkSum, idplanTypes, effectiveDate, totalAmount, monthlyAmount)
        VALUES (
            @Name, 'Esta es la descripción', 1, 0, @checkSum, @planType, @fecha, @total, @mensual
        );

        SET @i += 1;
    END
END
```

#### Media File Types
```sql
INSERT INTO caipi_mediaFileType (name, enable, deleted)
VALUES
('imagen', 1, 0),
('video', 1, 0);
```

#### Media Files
```sql
INSERT INTO caipi_mediaFiles (idmediaFiles, mediaURL, filename, lastUpdate, idmediaFileType)
VALUES
    (1, 'https://media.soltura.com/plan_fitness_4_personas.mp4', 'Plan de Gimnasio 4 Personas', GETDATE(), 2),
    (2, 'https://media.soltura.com/plan_yoga_familiar.mp4', 'Plan Yoga Familiar', GETDATE(), 2),
    (3, 'https://media.soltura.com/plan_grooming_mascota.jpg', 'Plan Grooming para Mascota', GETDATE(), 1),
    (4, 'https://media.soltura.com/plan_revision_veterinaria.jpg', 'Plan Revisión Veterinaria', GETDATE(), 1),
    (5, 'https://media.soltura.com/plan_clases_natacion_futbol.jpg', 'Plan Clases de Natación y Fútbol Niños', GETDATE(), 1),
    (6, 'https://media.soltura.com/servicio_combustible_gas_diesel.jpg', 'Servicio de Combustible Gas o Diésel', GETDATE(), 1),
    (7, 'https://media.soltura.com/servicio_uber_eats.jpg', 'Servicio Uber Eats', GETDATE(), 1),
    (8, 'https://media.soltura.com/servicio_uber_rides.jpg', 'Servicio Uber Rides', GETDATE(), 1),
    (9, 'https://media.soltura.com/servicio_mantenimiento_mascota.jpg', 'Servicio de Mantenimiento de Mascotas', GETDATE(), 1),
    (10, 'https://media.soltura.com/servicio_plan_clases_futbol.jpg', 'Plan de Clases de Fútbol', GETDATE(), 1),
    (11, 'https://media.soltura.com/servicio_grooming_mascota.jpg', 'Grooming para Mascotas', GETDATE(), 1),
    (12, 'https://media.soltura.com/servicio_revision_salud.jpg', 'Revisión de Salud', GETDATE(), 1),
    (13, 'https://media.soltura.com/servicio_activacion_plan.jpg', 'Activación de Plan', GETDATE(), 1),
    (14, 'https://media.soltura.com/servicio_subscripcion_plan.jpg', 'Suscripción a Planes', GETDATE(), 1),
    (15, 'https://media.soltura.com/servicio_pagos_suscripcion.jpg', 'Pagos de Suscripción', GETDATE(), 1);
```

#### Schedules
```sql
CREATE PROCEDURE llenadoSchedules
AS
BEGIN

    DECLARE @horarios TABLE (
        name VARCHAR(50),
        recurrencyType VARCHAR(20),
        repetition INT
    );
-- Se realiza una inserción en tabla temporal 
    INSERT INTO @horarios (name, recurrencyType, repetition)
    VALUES 
        ('Cada semana', 'semanal', 1),
        ('Cada mes', 'mensual', 1),
        ('Cada 15 días', 'semanal', 2);

    DECLARE @i INT = 1;
    DECLARE @mes INT;
    DECLARE @dia INT;
    DECLARE @endDate DATE;
-- Se insertan en bloques de 13
    WHILE @i <= 13
    BEGIN
        
        SET @mes = FLOOR(RAND(CHECKSUM(NEWID())) * 8) + 5; -- Mes aleatorio

        SET @dia = FLOOR(RAND(CHECKSUM(NEWID())) * 28) + 1; -- Dia aleatorio

        SET @endDate = DATEFROMPARTS(2025, @mes, @dia);

        -- Insertar 3 registros por vuelta
        INSERT INTO caipi_schedules (name, recurrencyType, repetition, endType, endDate)
        SELECT name, recurrencyType, repetition, 'NA', @endDate
        FROM @horarios;

        SET @i += 1;
    END
END;
```

#### Supplier Categories
```sql
INSERT INTO caipi_supplierCategories(name, enable, deleted)
VALUES
('Gimnasios y Fitness', 1, 0),
('Estudios de Yoga', 1, 0),
('Grooming para Mascotas', 1, 0),
('Clínicas Veterinarias', 1, 0),
('Escuelas de Natación', 1, 0),
('Estaciones de Combustible', 1, 0),
('Restaurantes y Comida Rápida', 1, 0),
('Agencias de Viajes', 1, 0),
('Centros de Cuidado Animal', 1, 0),
('Clubes Deportivos', 1, 0),
('Centros de Estética', 1, 0),
('Consultorios Nutricionales', 1, 0),
('Parqueos Privados', 1, 0),
('Entrenadores Personales', 1, 0),
('Proveedores Varios', 1, 0);
```

#### Suppliers 
```sql
INSERT INTO [dbo].[caipi_suppliers] ([name], [enable], [idsupplierCategories], [idmediaFiles], [idagreementTerms], [deleted])
VALUES
('The Retreat Costa Rica', 1, 1, 1, 1, 0), 
('Vida Mia Healing Center', 1, 2, 2, 2, 0),
('Agromédica Veterinaria', 1, 4, 4, 4, 0), 
('Paws & Co.', 1, 3, 3, 3, 0), 
('The Pets Club', 1, 9, 9, 9, 0), 
('VolAir Studio', 1, 2, 2, 2, 0), 
('Smart Fit', 1, 1, 1, 1, 0), 
('AmaSer', 1, 2, 2, 2, 0), 
('Pure Jungle Spa', 1, 11, 11, 11, 0), 
('Aloha Skincare and Wellness', 1, 11, 11, 11, 0), 
('Central de Mascotas', 1, 9, 9, 9, 0), 
('Veterinaria Arroyo y Solano', 1, 4, 4, 4, 0),
('Spoon', 1, 7, 7, 7, 0), 
('Rostipollos', 1, 7, 7, 7, 0), 
('KOKi Beach', 1, 7, 7, 7, 0); 
```

#### Users

 <details>
   <summary>Haz clic para expandir</summary>

```sql
/*
 procedimiento almacenado: dbo.sp_crearusuarios
 descripcion: inserta 100 usuarios de ejemplo en dbo.caipi_users
*/
GO
CREATE OR ALTER PROCEDURE dbo.sp_crearusuarios
AS
BEGIN
    -- este bloque desactiva mensajes de conteo de filas
    SET NOCOUNT ON;

    -- este bloque crea una tabla temporal con nombres comunes
    DECLARE @FirstNames TABLE (Name NVARCHAR(50));
    INSERT INTO @FirstNames (Name)
    VALUES ('Jose'),('Maria'),('Juan'),('Ana'),('Luis'),('Carmen'),('Miguel'),('Laura'),('Carlos'),('Lucia');

    -- este bloque crea una tabla temporal con apellidos comunes
    DECLARE @LastNames TABLE (Lastname NVARCHAR(50));
    INSERT INTO @LastNames (Lastname)
    VALUES ('Garcia'),('Rodriguez'),('Martinez'),('Hernandez'),('Lopez'),('Gonzalez'),('Perez'),('Sanchez'),('Ramirez'),('Torres');

    -- este bloque inicia el contador para insertar 100 usuarios
    DECLARE @i INT = 1;
    WHILE @i <= 100
    BEGIN
        -- este bloque elige un nombre aleatorio
        DECLARE @FirstName NVARCHAR(50) = (
            SELECT TOP 1 Name FROM @FirstNames ORDER BY NEWID()
        );
        -- este bloque elige un apellido aleatorio
        DECLARE @LastName NVARCHAR(50) = (
            SELECT TOP 1 Lastname FROM @LastNames ORDER BY NEWID()
        );

        -- este bloque crea el username usando inicial del nombre, apellido y contador
        DECLARE @Username NVARCHAR(50) = LOWER(
            LEFT(@FirstName,1) + @LastName + RIGHT('00' + CAST(@i AS VARCHAR),3)
        );

        -- este bloque genera fecha de nacimiento entre 18 y 65 anos
        DECLARE @Birth DATE = DATEADD(
            DAY,
            - (ABS(CHECKSUM(NEWID())) % (47 * 365) + (18 * 365)),
            CAST(GETDATE() AS DATE)
        );

        -- este bloque genera contrasena como hash sha2_256 de pass + contador
        DECLARE @Password VARBINARY(255) = HASHBYTES('SHA2_256', 'pass' + CAST(@i AS NVARCHAR));

        -- este bloque define flags de estado eliminacion y activo
        DECLARE @Deleted BIT = 0;
        DECLARE @Active BIT = 1;

        -- este bloque crea fecha de registro aleatoria en el ultimo ano
        DECLARE @RegisterDate DATE = DATEADD(
            DAY,
            - (ABS(CHECKSUM(NEWID())) % 365),
            CAST(GETDATE() AS DATE)
        );
        -- este bloque asigna la fecha y hora actual como ultima actualizacion
        DECLARE @LastUpdate DATETIME = GETDATE();

        -- este bloque asigna un rol aleatorio entre 1 y 3
        DECLARE @Role TINYINT = CAST((ABS(CHECKSUM(NEWID())) % 3 + 1) AS TINYINT);

        -- este bloque crea urls de perfil e imagen usando el username
        DECLARE @ProfileUrl NVARCHAR(200) = 'https://example.com/users/' + @Username;
        DECLARE @ImgProfileUrl NVARCHAR(200) = 'https://example.com/images/' + @Username + '.jpg';

        -- este bloque inserta el usuario generado en la tabla principal
        INSERT INTO dbo.caipi_users
            (username, [name], lastname, birth, [password], deleted, active, last_update, role, registerdate, profile_url, img_profile_url)
        VALUES
            (@Username, @FirstName, @LastName, @Birth, @Password, @Deleted, @Active, @LastUpdate, @Role, @RegisterDate, @ProfileUrl, @ImgProfileUrl);

        -- este bloque incrementa el contador
        SET @i = @i + 1;
    END
END
GO

```

 </details>

#### Adresses para usuarios

 <details>
   <summary>Haz clic para expandir</summary>

```sql
/*
 procedimiento almacenado: dbo.sp_insertsampleaddresses
 descripcion: inserta 100 direcciones de ejemplo en dbo.caipi_Adresses
*/
go
CREATE OR ALTER procedure dbo.sp_insertardireccionesparausuarios
as
begin
    set nocount on;

    -- contador para crear 100 direcciones
    declare @i int = 1;
    while @i <= 100
    begin
        -- linea 1: calle + numero
        declare @line1 varchar(200) = 'calle ' + cast((abs(checksum(newid())) % 200 + 1) as varchar) + ' #' + cast((abs(checksum(newid())) % 1000 + 1) as varchar);
        
        -- linea 2: apto o null
        declare @line2 varchar(200);
        if (abs(checksum(newid())) % 2) = 0
            set @line2 = 'apto ' + cast((abs(checksum(newid())) % 100 + 1) as varchar);
        else
            set @line2 = null;

        -- codigo postal formato 5 digitos[-4]
        declare @zip varchar(9) = right('00000' + cast(abs(checksum(newid())) % 100000 as varchar),5)
                                 + '-' + right('0000' + cast(abs(checksum(newid())) % 10000 as varchar),4);

        -- generar punto geometrico con lat/lon en costa rica aproximado
        declare @rand float = rand(checksum(newid()));
        declare @lat float = 8 + @rand * 3;      -- entre 8 y 11 grados
        declare @lon float = -85 + @rand * 3;    -- entre -85 y -82 grados
        declare @location geometry = geometry::Point(@lon, @lat, 4326);

        -- habilitado aleatorio
        declare @enable bit = cast((abs(checksum(newid())) % 2) as bit);

        -- id de direccion secuencial
        declare @adressId int = @i;

        -- id de ciudad aleatorio entre 1 y 18
        declare @cityId int = abs(checksum(newid())) % 18 + 1;

        -- insertar registro
        insert into dbo.caipi_Adresses
            (line1, line2, zipcode, location, enable, adressId, cityId)
        values
            (@line1, @line2, @zip, @location, @enable, @adressId, @cityId);

        -- siguiente contador
        set @i = @i + 1;
    end
end
go

```

 </details>

#### AdressessPerUser

 <details>
   <summary>Haz clic para expandir</summary>

```sql
/*
 procedimiento almacenado: dbo.sp_insertsampleaddressesperuser
 descripcion: asigna direcciones a usuarios en dbo.caipi_AdressessPerUser
*/
GO
CREATE OR ALTER PROCEDURE dbo.sp_insertardireccionesparausuariosporusuario
AS
BEGIN
    -- este bloque evita mensajes de conteo de filas
    SET NOCOUNT ON;

    -- contador para crear 200 registros (direcciones por usuario)
    DECLARE @i INT = 1;
    WHILE @i <= 100
    BEGIN
        -- id secuencial de la relacion
        DECLARE @addressPerUserId INT = @i;

        -- flag habilitado aleatorio
        DECLARE @enable BIT = CAST((ABS(CHECKSUM(NEWID())) % 2) AS BIT);

        -- direccion id de 1 a 200
        DECLARE @adressId INT = @i;

        -- usuario id de 1 A 100
        DECLARE @userid INT = @i;

        -- insertar registro en la tabla de relacion
        INSERT INTO dbo.caipi_AdressessPerUser
            (adressPerUserId, enable, adressId, userid)
        VALUES
            (@addressPerUserId, @enable, @adressId, @userid);

        -- incrementar contador
        SET @i = @i + 1;
    END
END
GO
```

 </details>

#### contactInfoPerUsers

  <details>
   <summary>Haz clic para expandir</summary>

```sql
GO
CREATE OR ALTER PROCEDURE dbo.sp_insertarInfoContactoUsuarios
AS
BEGIN
    SET NOCOUNT ON;

    -- declaramos las variables
    DECLARE @userid INT = 1;
    DECLARE @contactTypeId INT;
    DECLARE @email VARCHAR(100);
    DECLARE @phone VARCHAR(100);
    DECLARE @mobile VARCHAR(100);
    DECLARE @fax VARCHAR(100);
    DECLARE @web VARCHAR(100);
    DECLARE @fecha DATETIME;

    -- recorremos los usuarios del 101 al 300
    WHILE @userid <= 100
    BEGIN
        -- generamos una fecha aleatoria
        SET @fecha = DATEADD(DAY, ABS(CHECKSUM(NEWID())) % 365, '2024-04-01');

        -- generamos un correo electronico
        SET @email = 'user' + CAST(@userid AS VARCHAR) + '@correo.com';
        INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
        VALUES (1, @fecha, @email, @userid, 1); -- 1 es email

        -- generamos un numero telefonico fijo
        SET @phone = '+506 2222' + RIGHT('000' + CAST(@userid AS VARCHAR), 4);
        INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
        VALUES (1, @fecha, @phone, @userid, 2); -- 2 es telefono fijo

        -- generamos un numero movil
        SET @mobile = '+506 88' + RIGHT('000000' + CAST(@userid AS VARCHAR), 6);
        INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
        VALUES (1, @fecha, @mobile, @userid, 5); -- 5 es numero movil

        -- generamos un fax (opcional, no todos tendran)
        IF @userid % 3 = 0
        BEGIN
            SET @fax = '+506 2288' + RIGHT('000' + CAST(@userid AS VARCHAR), 4);
            INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
            VALUES (1, @fecha, @fax, @userid, 3); -- 3 es fax
        END

        -- generamos un sitio web (opcional, algunos tendran)
        IF @userid % 4 = 0
        BEGIN
            SET @web = 'https://usuario' + CAST(@userid AS VARCHAR) + '.com';
            INSERT INTO caipi_contactInfoPerUsers (enable, lastUpdate, value, userid, contactInfoTypeId)
            VALUES (1, @fecha, @web, @userid, 4); -- 4 es sitio web
        END

        SET @userid = @userid + 1;
    END
END
GO

```

 </details>

#### Subscriptions y Members

 <details>
   <summary>Haz clic para expandir</summary>

```sql
/*
 procedimiento almacenado: dbo.sp_FillSubscriptionsAndMembers
 descripcion: asigna suscripciones a un tercio de usuarios (101-300) y miembros a cada suscripcion
 hay mas usuarios como miembros que como dueños
 cada suscripcion tendra de 3 a 6 miembros
*/
GO
CREATE OR ALTER PROCEDURE dbo.sp_llenarSubscriptionyMembers
AS
BEGIN
    SET NOCOUNT ON;

    -- definimos rango de usuarios
    DECLARE @minUser INT = 1, @maxUser INT = 100;
    DECLARE @totalUsers INT = @maxUser - @minUser + 1;
    -- elegimos un tercio de usuarios como dueños
    DECLARE @ownersCount INT = @totalUsers / 3;

    -- tabla temporal de dueños de suscripcion
    DECLARE @owners TABLE (userid INT PRIMARY KEY);
    DECLARE @idx INT = 0;
    WHILE @idx < @ownersCount
    BEGIN
        SET @idx = @idx + 1;
        INSERT INTO @owners (userid)
        VALUES (@minUser + @idx - 1);
    END;

    -- cursor para recorrer cada dueño
    DECLARE owner_cursor CURSOR FOR
        SELECT userid FROM @owners;
    OPEN owner_cursor;

    DECLARE @ownerId INT;
    FETCH NEXT FROM owner_cursor INTO @ownerId;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- datos aleatorios para la suscripcion
        DECLARE @subscription_typeid INT = CAST(RAND(CHECKSUM(NEWID())) * 8 + 1 AS INT);
        DECLARE @social BIT         = CAST(RAND(CHECKSUM(NEWID())) * 2 AS BIT);
        DECLARE @enable BIT         = 1;
        DECLARE @startdate DATE     = DATEADD(DAY, -CAST(RAND(CHECKSUM(NEWID())) * 365 AS INT), CAST(GETDATE() AS DATE));
        DECLARE @deleted BIT        = 0;
        DECLARE @statusid INT       = CAST(RAND(CHECKSUM(NEWID())) * 5 + 1 AS INT);
        DECLARE @scheduleId INT     = CAST(RAND(CHECKSUM(NEWID())) * 39 + 1 AS INT);
        DECLARE @auto_renew BIT     = CAST(RAND(CHECKSUM(NEWID())) * 2 AS BIT);
        DECLARE @created_at DATETIME = DATEADD(MINUTE, -CAST(RAND(CHECKSUM(NEWID())) * 10000 AS INT), GETDATE());
        DECLARE @idPlan INT         = CAST(RAND(CHECKSUM(NEWID())) * 15 + 1 AS INT);

        -- insertamos la suscripcion y obtenemos su id
        INSERT INTO dbo.caipi_subscriptions
            (suscription_typeid, userid, social, enable, startdate, deleted, statusid, scheduleId, auto_renew, created_at, idPlan)
        VALUES
            (@subscription_typeid, @ownerId, @social, @enable, @startdate, @deleted, @statusid, @scheduleId, @auto_renew, @created_at, @idPlan);
        DECLARE @subscriptionId INT = SCOPE_IDENTITY();

        -- determinamos cuántos miembros (3 a 6)
        DECLARE @membersCount INT = CAST(RAND(CHECKSUM(NEWID())) * 4 + 3 AS INT);

        -- insertamos al dueño como miembro
        INSERT INTO dbo.caipi_members
            (subscriptionid, userid, startdate, leftdate, enabled, deleted)
        VALUES
            (@subscriptionId, @ownerId, @created_at, NULL, 1, 0);

        -- insertamos miembros adicionales, pueden repetirse en otras suscripciones
        DECLARE @m INT = 1;
        WHILE @m < @membersCount
        BEGIN
            DECLARE @randUser INT = CAST(RAND(CHECKSUM(NEWID())) * @totalUsers + @minUser AS INT);
            IF NOT EXISTS(
                SELECT 1 FROM dbo.caipi_members
                WHERE subscriptionid = @subscriptionId AND userid = @randUser
            )
            BEGIN
                INSERT INTO dbo.caipi_members
                    (subscriptionid, userid, startdate, leftdate, enabled, deleted)
                VALUES
                    (@subscriptionId, @randUser, @created_at, NULL, 1, 0);
                SET @m = @m + 1;
            END;
        END;

        FETCH NEXT FROM owner_cursor INTO @ownerId;
    END;

    CLOSE owner_cursor;
    DEALLOCATE owner_cursor;
END;
GO
```

 </details>

#### Currencies

 <details>
   <summary>Haz clic para expandir</summary>

```sql
INSERT INTO dbo.caipi_currencies (name, acronym, symbol)
VALUES ('Colón Costa Rica', 'CRC', '¢'),('Dólar Estados Unidos', 'USD', '$');
```

 </details>

#### ExchangeRates

 <details>
   <summary>Haz clic para expandir</summary>

```sql
-- inserciones USD ? CRC (currencyId = 2)
INSERT INTO dbo.caipi_ExchangeRates
  (startDate,    endDate,      exchangeRate, enable, currentExchangeRate, currencyId)
VALUES
  ('2025-04-14','2025-04-14', 511.52,        1,      0,                   2),
  ('2025-04-15','2025-04-15', 512.99828,     1,      0,                   2),
  ('2025-04-16','2025-04-16', 502.61598,     1,      0,                   2),
  ('2025-04-17','2025-04-17', 502.26978,     1,      0,                   2),
  ('2025-04-18','2025-04-18', 502.26978,     1,      1,                   2);

-- inserciones CRC ? USD (currencyId = 1)
INSERT INTO dbo.caipi_ExchangeRates
  (startDate,    endDate,      exchangeRate, enable, currentExchangeRate, currencyId)
VALUES
  ('2025-04-14','2025-04-14', 0.00195,       1,      0,                   1),
  ('2025-04-15','2025-04-15', 0.0019493,     1,      0,                   1),
  ('2025-04-16','2025-04-16', 0.0019896,     1,      0,                   1),
  ('2025-04-17','2025-04-17', 0.00199,       1,      0,                   1),
  ('2025-04-18','2025-04-18', 0.00199,       1,      1,                   1);
```

 </details>

 #### AvailiablePaymentMethodsPerUser

<details>
   <summary>Haz clic para expandir</summary>

```sql
CREATE OR ALTER PROCEDURE dbo.caipi_SP_AddPaymentMethodsPerUser
	--SIN PARAMETROS
AS
BEGIN
	--Declare local variables
	DECLARE @UserQuantity INT = 100 --cantidad de usuarios
	DECLARE @MethodsQuantity INT = 5 --cantidad de metodos disponibles
	DECLARE @MethodId INT --Id del metodo seleccionado de forma aleatoria
	DECLARE @UserCount INT = 1 --Contador de ciclo que recorre los registros de usuarios el cual funciona tambien como ID del users


	WHILE @UserCount <= @UserQuantity
    BEGIN
		--Escoge un metodo de pago disponible entre los id registrados con el checkscum obtengo distintos valores en cada interacion de RAND
		SET @MethodId = FLOOR(1 + RAND(CHECKSUM(NEWID())) * @MethodsQuantity);

		INSERT INTO dbo.caipi_AvailiablePaymentMethodsPerUser
			   ([enable]
			   ,[paymentMethodId]
			   ,[idUser])
		 VALUES
			   (1
			   ,@MethodId
			   ,@UserCount)

		SET @UserCount +=1;
	END
END;
```

</details>

#### caipi_AgreementType
```sql
INSERT INTO caipi_AgreementType (name, description, dataType)
VALUES
('Descuento Porcentaje', 'Aplica un porcentaje de descuento sobre el precio original.', 'porcentaje'),
('Precio Fijo', 'Precio acordado fijo sin descuento adicional.', 'decimal'),
('Membresía Mensual', 'Acceso a un servicio durante un mes.', 'tiempo'),
('Acceso Ilimitado', 'Servicio disponible sin restricción durante el periodo contratado.', 'bool'),
('Promoción Especial', 'Descuento o beneficio temporal sobre el precio de lista.', 'porcentaje');
```

#### caipi_agreementTerms
```sql
-- SMART FIT (idSupplier = 7)
INSERT INTO caipi_agreementTerms (
 enable, checkSum, startDate, idMeasureUnit, idService, finalDate, idSupplier,
 signedDate, deleted, access, disccountPercentage, originalPrice, agreementPrice,
 salePrice, IVA, idAgreementType, currencyId, quantity, scheduleId, userDisccount
) VALUES
(1, HASHBYTES('SHA2_256', 'SmartFit-Gym'), '2025-05-01', 1, 2, '2025-12-31', 7, GETDATE(), 0, 1, 15.00, 850.00, 722.50, 722.50, 1, 1, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'SmartFit-Personal'), '2025-05-01', 1, 15, '2025-12-31', 7, GETDATE(), 0, 1, 10.00, 700.00, 630.00, 630.00, 1, 2, 1, 4, NULL, NULL);

-- AMASER (idSupplier = 8)
INSERT INTO caipi_agreementTerms VALUES
(1, HASHBYTES('SHA2_256', 'AmaSer-Yoga'), '2025-05-01', 1, 3, '2025-12-31', 8, GETDATE(), 0, 1, 20.00, 600.00, 480.00, 480.00, 1, 3, 1, 4, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'AmaSer-Nutrición'), '2025-05-01', 1, 13, '2025-12-31', 8, GETDATE(), 0, 1, 25.00, 800.00, 600.00, 600.00, 1, 1, 1, 2, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'AmaSer-Personal'), '2025-05-01', 1, 15, '2025-12-31', 8, GETDATE(), 0, 1, 15.00, 750.00, 637.50, 637.50, 1, 5, 1, 2, NULL, NULL);

-- SPOON (idSupplier = 13)
INSERT INTO caipi_agreementTerms VALUES
(1, HASHBYTES('SHA2_256', 'Spoon-Comida'), '2025-05-01', 1, 8, '2025-12-31', 13, GETDATE(), 0, 1, 10.00, 500.00, 450.00, 450.00, 1, 2, 1, 5, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'Spoon-Nutrición'), '2025-05-01', 1, 13, '2025-12-31', 13, GETDATE(), 0, 1, 5.00, 600.00, 570.00, 570.00, 1, 1, 1, 1, NULL, NULL);

-- CENTRAL DE MASCOTAS (idSupplier = 11)
INSERT INTO caipi_agreementTerms VALUES
(1, HASHBYTES('SHA2_256', 'Central-Grooming'), '2025-05-01', 1, 4, '2025-12-31', 11, GETDATE(), 0, 1, 20.00, 400.00, 320.00, 320.00, 1, 5, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'Central-Veterinaria'), '2025-05-01', 1, 5, '2025-12-31', 11, GETDATE(), 0, 1, 15.00, 500.00, 425.00, 425.00, 1, 1, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'Central-Mantenimiento'), '2025-05-01', 1, 10, '2025-12-31', 11, GETDATE(), 0, 1, 30.00, 700.00, 490.00, 490.00, 1, 3, 1, 1, NULL, NULL);

-- VIDA MIA (idSupplier = 2)
INSERT INTO caipi_agreementTerms VALUES
(1, HASHBYTES('SHA2_256', 'VidaMia-Yoga'), '2025-05-01', 1, 3, '2025-12-31', 2, GETDATE(), 0, 1, 25.00, 500.00, 375.00, 375.00, 1, 1, 1, 2, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'VidaMia-Belleza'), '2025-05-01', 1, 12, '2025-12-31', 2, GETDATE(), 0, 1, 20.00, 700.00, 560.00, 560.00, 1, 2, 1, 1, NULL, NULL);

-- THE PETS CLUB (idSupplier = 5)
INSERT INTO caipi_agreementTerms VALUES
(1, HASHBYTES('SHA2_256', 'PetsClub-Grooming'), '2025-05-01', 1, 4, '2025-12-31', 5, GETDATE(), 0, 1, 20.00, 450.00, 360.00, 360.00, 1, 1, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'PetsClub-Mantenimiento'), '2025-05-01', 1, 10, '2025-12-31', 5, GETDATE(), 0, 1, 10.00, 550.00, 495.00, 495.00, 1, 4, 1, 1, NULL, NULL);

-- VOLAIR STUDIO (idSupplier = 6)
INSERT INTO caipi_agreementTerms VALUES
(1, HASHBYTES('SHA2_256', 'VolAir-Yoga'), '2025-05-01', 1, 3, '2025-12-31', 6, GETDATE(), 0, 1, 10.00, 600.00, 540.00, 540.00, 1, 3, 1, 2, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'VolAir-Nutrición'), '2025-05-01', 1, 13, '2025-12-31', 6, GETDATE(), 0, 1, 15.00, 700.00, 595.00, 595.00, 1, 5, 1, 1, NULL, NULL),
(1, HASHBYTES('SHA2_256', 'VolAir-Entrenamiento'), '2025-05-01', 1, 15, '2025-12-31', 6, GETDATE(), 0, 1, 12.00, 750.00, 660.00, 660.00, 1, 1, 1, 1, NULL, NULL);

SELECT * FROM caipi_AgreementsPerPlan
SELECT idPlan, name FROM caipi_plans ORDER BY idPlan;
SELECT idagreementTerm, idSupplier, idService
FROM caipi_agreementTerms
ORDER BY idagreementTerm;
```

#### caipi_AgreementsPerPlan
```sql
INSERT INTO caipi_AgreementsPerPlan (
    enable, deleted, idPlans, idAgreementTerm, quantity, idMeasureUnit, amount, disccount
)
VALUES (
    1,
    0,
    16,
    7,
    '1 mes',
    1,
    722.50,
    127.50
);

-- Plan 16: Joven Deportista
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 16, 7, '1 mes', 1, 722.50, 127.50),
(1, 0, 16, 9, '1 mes', 1, 630.00, 70.00);

-- Plan 17: Familia de Verano
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 17, 10, '1 mes', 1, 480.00, 120.00),
(1, 0, 17, 11, '1 mes', 1, 600.00, 200.00),
(1, 0, 17, 12, '1 mes', 1, 637.50, 112.50);

-- Plan 18: Viajero Frecuente
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 18, 13, '1 mes', 1, 450.00, 50.00),
(1, 0, 18, 14, '1 mes', 1, 570.00, 30.00);

-- Plan 19: Nómada Digital
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 19, 18, '1 mes', 1, 375.00, 125.00),
(1, 0, 19, 19, '1 mes', 1, 560.00, 140.00);

-- Plan 20: Profesional en Movimiento
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 20, 20, '1 mes', 1, 425.00, 75.00),
(1, 0, 20, 21, '1 mes', 1, 495.00, 55.00),
(1, 0, 20, 15, '1 mes', 1, 360.00, 90.00);

-- Plan 21: Estudiante Proactivo
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 21, 10, '1 mes', 1, 480.00, 120.00),
(1, 0, 21, 19, '1 mes', 1, 560.00, 140.00);

-- Plan 22: Creativo Freelance
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 22, 7, '1 mes', 1, 722.50, 127.50),
(1, 0, 22, 9, '1 mes', 1, 630.00, 70.00),
(1, 0, 22, 17, '1 mes', 1, 490.00, 210.00);

-- Plan 23: Full Wellness
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 23, 10, '1 mes', 1, 480.00, 120.00),
(1, 0, 23, 22, '1 mes', 1, 540.00, 60.00),
(1, 0, 23, 24, '1 mes', 1, 660.00, 90.00);

-- Plan 24: Tiempo en Familia
INSERT INTO caipi_AgreementsPerPlan VALUES
(1, 0, 24, 13, '1 mes', 1, 450.00, 50.00),
(1, 0, 24, 14, '1 mes', 1, 570.00, 30.00),
(1, 0, 24, 16, '1 mes', 1, 425.00, 75.00),
(1, 0, 24, 11, '1 mes', 1, 600.00, 200.00); 
```

### caipi_subscriptions
```sql
-- Plan 16
INSERT INTO caipi_subscriptions (suscription_typeid, userid, social, enable, startdate, deleted, statusid, scheduleId, auto_renew, created_at, idPlan) VALUES
(1, 1, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 16),
(1, 2, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 16),
(1, 3, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 16);

-- Plan 17
INSERT INTO caipi_subscriptions VALUES
(1, 4, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 17),
(1, 5, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 17),
(1, 6, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 17),
(1, 7, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 17);

-- Plan 18
INSERT INTO caipi_subscriptions VALUES
(1, 8, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 18),
(1, 9, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 18),
(1, 10, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 18),
(1, 11, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 18),
(1, 12, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 18);

-- Plan 19
INSERT INTO caipi_subscriptions VALUES
(1, 13, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 19),
(1, 14, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 19),
(1, 15, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 19);

-- Plan 20
INSERT INTO caipi_subscriptions VALUES
(1, 16, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 20),
(1, 17, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 20),
(1, 18, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 20),
(1, 19, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 20),
(1, 20, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 20),
(1, 21, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 20);

-- Plan 21
INSERT INTO caipi_subscriptions VALUES
(1, 22, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 21),
(1, 23, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 21),
(1, 24, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 21),
(1, 25, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 21);

-- Plan 22
INSERT INTO caipi_subscriptions VALUES
(1, 26, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 22),
(1, 27, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 22),
(1, 28, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 22),
(1, 29, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 22),
(1, 30, 0, 1, GETDATE(), 0, 1, 2, 1, GETDATE(), 22);
```

### 🔎 Demostraciones T-SQL (uso de instrucciones específicas)
Todos las pruebas a continuación se deben hacer en uno o varios scripts TSQL. Perfectamente un solo query puede resolver varios puntos de las pruebas.

1. Cursor local, mostrando que no es visible fuera de la sesión de la base de datos.

2. Cursor global, accesible desde otras sesiones de la base de datos.

3. Uso de un trigger (por ejemplo, para log de inserciones en pagos).

4. Uso de `sp_recompile`, cómo podría estar recompilando todos los SP existentes cada cierto tiempo.

5. Uso de `MERGE` para sincronizar datos de planes por ejemplo.

6. `COALESCE` para manejar valores nulos en configuraciones de usuario.

7. `SUBSTRING` para extraer partes de descripciones.

8. `LTRIM` para limpiar strings.

9. `AVG` con agrupamiento (ej. promedio de montos pagados por usuario).

10. `TOP` para mostrar top 5 planes más populares.

11. `&&` en que caso se usa.

12. `SCHEMABINDING` demostrar que efectivamente funciona en SPs, vistas, funciones.

13. `WITH ENCRYPTION` demostrar que es posible encriptar un SP y que no lo violenten.

14. `EXECUTE` AS para ejecutar SP con impersonificación, es posible? qué significa eso?

15. `UNION` entre planes individuales y empresariales por ejemplo.

16. `DISTINCT` para evitar duplicados en servicios asignados por ejemplo.
---
#### Uso de un TRIGGER
 <details>
   <summary>Haz clic para expandir</summary>
	 
El TRIGGER es un SP que se ejecuta automaticamente en respuesta de un evento en una tabla o vista desde la base de datos. En este caso, se utiliza con fines de auditoria, en caso de generarse una actualizacion de datos en un usuario, el trigger despues de la actualizacion *UPDATE* genera una incersion en la tabla `caipi_logs` en el cual el registro almacena el movimiento. Con el TRIGGER, se puede acceder los datos anteriores y los datos insertados, en el caso de T-SQL un *UPDATE* es manipulado por un DELETED (Viejos datos) y un INSERTED (Nuevos datos)
```sql

-- TRIGGER El cual dispara cuando un usuario es actualizado
--Realiza una comparacion de datos nuevos y antiguos con la finalidad de almacenar el el log los cambios hechos en la actualizacion

CREATE OR ALTER TRIGGER log_insertUserUpdate
ON caipi_users
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
	--declara las variables que se van a utilizar en la consulta
    DECLARE @userId INT,
            @username NVARCHAR(100),
            @old_username NVARCHAR(100),
            @name NVARCHAR(100),
            @old_name NVARCHAR(100),
            @lastname NVARCHAR(100),
            @old_lastname NVARCHAR(100),
            @password NVARCHAR(100),
            @old_password NVARCHAR(100),
            @role NVARCHAR(100),
            @old_role NVARCHAR(100),
            @changedColumns NVARCHAR(MAX);

	--Utilza un cursor local para almacenar los datos de la consulta, del registro insertado y del registro eliminado
    DECLARE cur CURSOR FOR
        SELECT i.userId, i.username, d.username,
               i.name, d.name,
               i.lastname, d.lastname,
               i.password, d.password,
               i.role, d.role
        FROM INSERTED i
        INNER JOIN DELETED d ON i.userId = d.userId;

	--abre el cursor para comenzar a recorrer las filas de la consulta
    OPEN cur;
    FETCH NEXT FROM cur INTO @userId, @username, @old_username,
                            @name, @old_name,
                            @lastname, @old_lastname,
                            @password, @old_password,
                            @role, @old_role;

    WHILE @@FETCH_STATUS = 0
    BEGIN
		--validacion de cambio de datos almacena los cambios realizados en el usuario
        SET @changedColumns = '';
		
        IF @username <> @old_username SET @changedColumns += 'username, ';
        IF @name <> @old_name SET @changedColumns += 'name, ';
        IF @lastname <> @old_lastname SET @changedColumns += 'lastname, ';
        IF @password <> @old_password SET @changedColumns += 'password, ';
        IF @role <> @old_role SET @changedColumns += 'role, ';

        -- Quitar última coma si existe
        IF RIGHT(@changedColumns, 2) = ', ' 
            SET @changedColumns = LEFT(@changedColumns, LEN(@changedColumns) - 2);

	    --Ejecuta el SP que genera el log de actualizar usuario
        EXECUTE sp_LogUpdateUser
            @userId,
            @username,
            @name,
            @lastname,
            @password,
            @role,
            @changedColumns;

		-- recorre el siguiente registro actualizado
        FETCH NEXT FROM cur INTO @userId, @username, @old_username,
                                @name, @old_name,
                                @lastname, @old_lastname,
                                @password, @old_password,
                                @role, @old_role;
    END;

    CLOSE cur;
    DEALLOCATE cur;
END;
GO

```

#### SP que es llamado por el trigger para insertar y log con la finalidad de guardar la integridad del check sum

```sql

CREATE OR ALTER PROCEDURE sp_LogUpdateUser
    @userId INT,
    @username NVARCHAR(100),
    @name NVARCHAR(100),
    @lastname NVARCHAR(100),
    @password NVARCHAR(100),
    @role NVARCHAR(100),
    @changedColumns NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO caipi_logs (
        [description], [computer], [username], [trace],
        [referenceId1], [referenceId2], [value1], [value2],
        [chechsum], [logSeverityId], [logSourceId], [logTypeId]
    )
    VALUES (
        'Usuario Actualizado - UserName: ' + @username,
        HOST_NAME(),
        SYSTEM_USER,
        'TRACE-' + CAST(ABS(CHECKSUM(NEWID())) % 10000 AS VARCHAR(10)),
        'Id Usuario',
        'Cambios Realizados',
        @userId,
        @changedColumns,
        CHECKSUM(@userId, @name, @lastname, @password, @role,@username),
        3,
        5,
        1
    );
END;
GO

```
</details>

#### Uso de Cursor global, accesible desde otras sesiones de la base de datos.

 <details>
   <summary>Haz clic para expandir</summary>
Este cursor puede ser referenciado en la conexion. Es decir, puede utilizarse en cualquier SP u otro procediminertos que se esté ejecuctando en la conexion. Por un lado, para ser declarado debe especificarse mediante la palabra reservada `GLOBAL`, en caso de no ser utilizada por defecto será *local*, por otro lado, puede declarse afuera de un procedimiento o bloque.



```sql

--Cursor global
CREATE OR ALTER PROCEDURE Dec_Cursor_Services
AS
BEGIN
    -- Declaro el cursor global para obtener todos los servicios en el sistema de lo cuales solo los activos
    DECLARE Services_Cursor CURSOR GLOBAL
    FOR
    SELECT 
        s.serviceId,
        s.name AS service_name
    FROM 
        dbo.caipi_services s
    WHERE 
        s.enable = 1;  -- Solo servicios habilitados
    
    -- Abrir el cursor
    OPEN Services_Cursor;
END
GO

CREATE OR ALTER PROCEDURE Fetch_Cursor_Services
AS
BEGIN
    -- Variables para almacenar los datos del cursor
    DECLARE @serviceId INT;
    DECLARE @service_name VARCHAR(255);
    DECLARE @total_suppliers INT;

    -- Fetch inicial para obtener el primer servicio
    FETCH NEXT FROM Services_Cursor INTO @serviceId, @service_name;

    -- Mientras haya más filas, seguiran procesandose
    WHILE (@@FETCH_STATUS <> -1)
    BEGIN
        -- Se cuenta cuantos provedores tiene un contrato activos con el servicio
        SELECT 
            @total_suppliers = COUNT(DISTINCT at.idSupplier)
        FROM 
            dbo.caipi_agreementTerms at
        WHERE 
            at.idService = @serviceId
            AND at.enable = 1;  -- Solo relaciones activas

        -- Muestra el resultado directamente
        SELECT 
            @serviceId AS serviceId,
            @service_name AS service_name,
            @total_suppliers AS total_suppliers;

        -- Obtiene la siguiente fila
        FETCH NEXT FROM Services_Cursor INTO @serviceId, @service_name;
    END
END
GO


```

> [!NOTE]
> Esta funcion es ejecutada en otra sesion o fuera del procedimiento con la finalidad de mostrar un cursor global

``` sql

EXEC Dec_Cursor_Services
GO;
EXEC Fetch_Cursor_Services;
CLOSE Services_Cursor
GO;
DEALLOCATE Services_Cursor
GO;

```
</details>

##### Uso de `sp_recompile` y cursor local

 <details>
   <summary>Haz clic para expandir</summary>
La instrucción `sp_recompile` permite eliminar (hacer drop) los planes de ejecución que existen actualmente para un procedimiento almacenado (SP), trigger o función, con la finalidad de que se genere un nuevo plan la próxima vez que se ejecute.

Esto es útil porque esos planes de ejecución se crean considerando la cantidad de datos que hay en ese momento. Si la cantidad de datos crece con el tiempo, ese plan ya no es tan eficiente. Al recompilar, se genera un plan optimizado para la cantidad de datos actual y así se mejora el rendimiento.


¿Cómo podría estar recompilando todos los SP existentes cada cierto tiempo?

Por medio de la asigancion de un job a un SQL SERVER Agent, el cual se le asigna la ejecucion del comando *EXEC recompileAllProc;* de forma recurrente y diaria a las 2am.

###### Paso a Paso de la creación del Agente

### 1. Crear un nuevo Job llamado `RecompileAllProcedures_Job`

![Creación del Job](imagenes/CreacionJob.jpg)

---

### 2. Asignar el comando que el Job va a ejecutar

![Asignación del Comando](imagenes/AsignacionComando.jpg)

---

### 3. Definir un horario (schedule) para el Job

En este caso se define de forma recurrente, con frecuencia **diaria**, y se establece que la hora de ejecución sea a las **2:00 AM**, sin fecha de finalización.

![Horario Programado](imagenes/schedule.png)



El uso de un *cursor local* en la siguiente procedure es que a la hora almacenar el conjunto de filas que devuelve la instruccion SELECT o tambien conocidas como conjunto de resultados. El cursos puede colocarse en una fila especifica o recuperar fila por fila del conjunto de datos, en este caso se usa para recorrer cada fija de la consulta que provee los PROC de la base de datos. 

Al ser local, el nombre del cursor solo es valido en la sesion de ejecucion y se puede hacer referencia al mismo dentro del SP que lo almacena la asignacion del cursor se cancela cuando la ejecucion finaliza. Un ejecmplo de la visibilidad se encuentra en el bloque de codigo el cual dara error si se intenta acceder fuera del SP en el que fue declarado, ya que solamente es visible dentro.

```sql

CREATE PROCEDURE recompileAllProc
AS
BEGIN
    -- CURSOR LOCAL QUE RECORRE LOS RESULTADOS DE LA CONSULTA
    DECLARE CURSOR_PROC CURSOR FOR 
    (
        -- OBTIENE LOS NOMBRES DE LOS PROCEDIMIENTOS, FUNCIONES Y TRIGGERS
        SELECT QUOTENAME(S.NAME) + '.' + QUOTENAME(O.NAME) AS PROCNAME 
        FROM 
           SYS.OBJECTS O
           INNER JOIN SYS.SCHEMAS S ON O.SCHEMA_ID = S.SCHEMA_ID
        WHERE O.[TYPE] IN ('P', 'FN', 'IF', 'TR') -- PROCEDIMIENTOS (P), FUNCIONES (FN), IN-LINE FUNCTIONS (IF) Y TRIGGERS (TR) ESTOS SON LOS TIPOS DE PROC QUE SE VAN A RECOMPILAR
    );

    DECLARE @PROCNAME SYSNAME; --EL SYSNAME EQUIVALE A NVARCHAR(128) POR SI HAY CARACTERES UNICODE

	--ABRE EL CURSOR Y LO LLEVA AL PRIMER REGISTRO DE LA CONSULTA
    OPEN CURSOR_PROC;
    FETCH NEXT FROM CURSOR_PROC INTO @PROCNAME; 

    WHILE @@FETCH_STATUS = 0 -- MIENTRAS EL CURSOR NO LLEGUE AL FINAL DE LOS REGISTROS, RECOMPILAR CADA PROCEDIMIENTO
    BEGIN
        EXEC SP_RECOMPILE @PROCNAME; -- EJECUTA LA RECOMPILACIÓN PARA EL PROCEDIMIENTO ALMACENADO
        FETCH NEXT FROM CURSOR_PROC INTO @PROCNAME; -- EL CURSOR PASA AL SIGUIENTE PROCEDIMIENTO
    END;

    -- CIERRA EL CURSOR UTILIZADO
    CLOSE CURSOR_PROC;
    DEALLOCATE CURSOR_PROC;
END;

```
> [!NOTE]
> Esta funcion es ejecutada en otra sesion o fuera del procedimiento con la finalidad de mostrar un cursor local
```sql
--mostrando que el cursos local utilizado recompileAllProc y llamado CURSOR_PROC en no es visible fuera de la sesión de la base de datos
--Al intentar hacer referencia al cursor local dara error pues el cursor solo existe dentro de la sesion que se esta ejecutando esto se debe a que es local.
FETCH NEXT FROM CURSOR_PROC INTO @PROCNAME;
```
</details>

##### Uso de MERGE y COALESCE
 <details>
   <summary>Haz clic para expandir</summary>
	 
La instruccion `MERGE` funciona para sincronizar datos a una tabla "destino" basado en la información de otra tabla "fuente", se pueden hacer insert, update y delete a partir de ciertas condiciones que se establcen segun los coomponentes de cada una de las tablas.
En este caso se utiliza para automatizar los reminders, ya que se utiliza esta tabla como la tabla destino que será actualizada a partir de la tabla de suscripciones.  Se busca que cada vez que algun registro de la tabla de suscripciones sufra un cambio en su estado y pase a tenerlo como "expirado", se genere automaticamente un mensaje al usuario advirtiendole sobre esto.

Por otro lado, también se incorpora la instruccion`COALESCE`, la cual puede gestionar los valores que permiten NULL  y se insertan de esta manera, puede devolver el primer valor no nulo de una columna solicitada hasta reemplazar la informacion cuando esté faltante. Para este caso, se utiliza coalesce para gestionar los datos que se insertarán como nulos con el objetivo de que al consultarlos no muestren 'NULL' sino que en vez de esto se muestre un string indicando otra cosa por defecto.


```sql
MERGE INTO caipi_reminders AS Destino	-- Tabla a actualizar

-- subconsulta para extraer solo las suscripciones con estado 'expirado' y que no hayan sido eliminadas
USING ( 
    SELECT S.statusid, S.subscriptionid, S.userid	
    FROM caipi_subscriptions S
    WHERE S.statusid = 4 AND S.deleted = 0 ) AS Origen	-- Tabla utilizada para generar los cambios

-- Se establecen las condiciones que se deben verificar antes de generar un nuevo mensaje
ON Destino.userid = Origen.userid  AND 
   Destino.ticketid = CAST(Origen.subscriptionid AS VARCHAR(10)) AND
   Destino.createddate >= DATEADD(DAY, -30, GETDATE())

-- En caso de que las condiciones no se encuentren en 'reminders' se genera un nuevo mensaje
WHEN NOT MATCHED BY TARGET THEN
    INSERT ( message, createddate, lastreminder, ticketid, requestid, expectedresult, successinfo, userid, 
        notificationmethods_notificationmethodid, remindertypeid)
    VALUES ('La suscripcion ha exiprado. Por favor renueve su plan', GETDATE(), 1, 
		CAST(Origen.subscriptionid AS VARCHAR(10)), NULL,  COALESCE(NULL, 'No expected res'), 
		COALESCE(NULL, 'No aplica'), Origen.userid, 1, 1);
```

</details>


##### Uso de AVG - TOP - &&/AND - SCHEMABINDING - LTRIM - SUBSTRING
<details>
   <summary>Haz clic para expandir</summary>

La instruccion `AVG` en SQL sirve para calcular el promedio aritmético de un conjunto de valores numérico.
La instruccion `TOP` se usa para limitar la cantidad de filas que retorna una consulta. Es como decir “quiero solo los primeros N resultados”.
La instruccion `AND` es un operador lógico que se usa para combinar dos o más condiciones en una cláusula.
La instruccion `SCHEMABINDING` se usa para “atar” un objeto al esquema de las tablas, de modo que no podrás renombrar, 
eliminar ni cambiar tipo de columna en las tablas referenciadas mientras el `SCHEMABINDING` exista.

La instruccion `SUBSTRING` se utiliza para extraer una cantidad especifica de caracteres de  una cadena con el fin de manipular cadenas de una mejor manera al ser de longitud más pequeña.
Por otro lado, la instrucción `LTRIM` elimina cualquier espacio en blanco que este a la izquierda o inicio de una cadena, esto se utiliza para los datos mal formateados.
En este caso, `SUBSTRING` se utiliza para extraer el username de cada usuario dejando de lado los 3 primero caracteres. Además se utiliza `LTRIM` para eliminar cualquier espacio en blanco que se presente al incio del nombre y apellido del usuario.

La siguiente view con schemabinding muestra el top 20 de promedios de 
montos pagados por usuarios activos con plan, subs y membership activas
y de plan tipo familiar

```sql
IF OBJECT_ID('dbo.caipi_VW_UserAvgPayFamilyPlan','V') IS NOT NULL
    DROP VIEW dbo.caipi_VW_UserAvgPayFamilyPlan;
GO

CREATE VIEW dbo.caipi_VW_UserAvgPayFamilyPlan
WITH SCHEMABINDING
AS
  SELECT 
	  u.userid AS id, SUBSTRING(u.username,3,9) AS userName,
	  LTRIM(u.name) + ' ' + LTRIM(u.lastname) AS nombre,
	  AVG(p.totalAmount) AS promedio
  FROM dbo.caipi_users AS u
  JOIN dbo.caipi_members AS m ON u.userid = m.userid
  JOIN dbo.caipi_subscriptions AS s ON m.subscriptionid = s.subscriptionid
  JOIN dbo.caipi_plans AS p ON s.idPlan = p.idPlan
  JOIN dbo.caipi_planTypes AS pt ON p.idplanTypes = pt.idplanTypes
  WHERE
	pt.name = 'Familiar'
    	AND u.active = 1
    	AND m.enabled = 1
    	AND s.enable = 1
    	AND p.enable = 1
  GROUP BY u.userid, u.username, u.name, u.lastname;
GO


SELECT TOP(20) id, nombre, promedio, userName
FROM dbo.caipi_VW_UserAvgPayFamilyPlan
ORDER BY promedio DESC;


EXEC sp_rename 
  'dbo.caipi_users.name', 
  'name_', 
  'COLUMN';

-- Msg 15336, Level 16, State 1, Procedure sp_rename, Line 612 [Batch Start Line 77]
-- Object 'dbo.caipi_users.name' cannot be renamed because the object participates in enforced dependencies.
```
</details>

##### Uso de ENCRYPTION y EXECUTE AS

WITH ENCRYPTION se utiliza para ocultar el código fuente de un procedimiento almacenado, protegiendo la lógica interna contra lecturas no autorizadas.
EXECUTE AS USER permite ejecutar instrucciones con los permisos de otro usuario, útil para delegar control sin otorgar acceso directo a objetos sensibles.

En este caso, se crea un procedimiento encriptado que inserta un usuario especial (id = 101), y se ejecuta con EXECUTE AS USER = 'dbo' para simular que lo ejecuta un usuario con privilegios completos. Esto demuestra cómo aplicar seguridad y control en escenarios reales.

```sql
IF OBJECT_ID('dbo.CrearUsuarioEspecial', 'P') IS NOT NULL
    DROP PROCEDURE dbo.CrearUsuarioEspecial;
GO

CREATE PROCEDURE dbo.CrearUsuarioEspecial
WITH ENCRYPTION
AS
BEGIN
    SET NOCOUNT ON;

    SET IDENTITY_INSERT dbo.caipi_users ON;

    INSERT INTO dbo.caipi_users
        (userid, username, [name], lastname, birth, [password], deleted, active, last_update, role, registerdate, profile_url, img_profile_url)
    VALUES
        (
            101,
            'admin101',
            'Admin',
            'Especial',
            DATEADD(YEAR, -30, GETDATE()),
            HASHBYTES('SHA2_256', 'admin101pass'),
            0,
            1,
            GETDATE(),
            1,
            GETDATE(),
            'https://example.com/users/admin101',
            'https://example.com/images/admin101.jpg'
        );

    SET IDENTITY_INSERT dbo.caipi_users OFF;
END;
GO

EXECUTE AS USER = 'dbo'; -- o tu usuario admin
EXEC dbo.CrearUsuarioEspecial;
REVERT;
```

##### Uso de UNION
La instrucción UNION se utiliza para combinar los resultados de dos consultas con estructuras compatibles, eliminando duplicados por defecto. Es útil cuando se desea presentar datos de distintas fuentes o categorías como un solo conjunto coherente.

En este caso, se usa UNION para unir planes de tipo individual (como "Básico" o "Familiar") y planes de tipo empresarial (como "Corporativo" o "Personalizado"), clasificándolos según el tipo de cliente. Esto permite visualizar ambos tipos de planes en una misma lista diferenciada, simulando una segmentación lógica de oferta en el sistema.

```sql
-- UNION de planes individuales y empresariales basados en tipo de plan

-- Planes Individuales
SELECT
    p.idPlan,
    p.name AS planName,
    pt.name AS planType,
    'Individual' AS tipoCliente
FROM
    caipi_plans p
INNER JOIN
    caipi_planTypes pt ON p.idplanTypes = pt.idplanTypes
WHERE
    pt.name IN ('Básico', 'Familiar', 'Salud y Bienestar')

UNION

-- Planes Empresariales
SELECT
    p.idPlan,
    p.name AS planName,
    pt.name AS planType,
    'Empresarial' AS tipoCliente
FROM
    caipi_plans p
INNER JOIN
    caipi_planTypes pt ON p.idplanTypes = pt.idplanTypes
WHERE
    pt.name IN ('Corporativo', 'Personalizado')
ORDER BY
    tipoCliente, planName;
```

##### Uso de DISTINCT
La cláusula DISTINCT se utiliza para eliminar registros duplicados en una consulta, mostrando únicamente combinaciones únicas de columnas.
En este caso, se aplica para listar servicios que han sido asignados al menos una vez en acuerdos (agreementTerms), sin repetirlos aunque estén vinculados a múltiples proveedores o combinaciones. Esto permite obtener una vista clara y sin redundancias de los servicios activos en el sistema.

```sql
-- Mostrar servicios únicos que han sido asignados en caipi_agreementTerms
SELECT DISTINCT
    s.serviceId,
    s.name AS serviceName
FROM
    caipi_agreementTerms at
INNER JOIN
    caipi_services s ON at.idService = s.serviceId
ORDER BY
    s.serviceId;
```

# Mantenimiento de la Seguridad

#### 1. Crear usuarios de prueba y:

##### 1.1 Mostrar cómo permitir o denegar acceso a la base de datos, del todo poder verla o no, poder conectarse o no

<details>
	<summary>Mostrar script</summary>

```sql
-------------------------------------------------------------------------------
-- Usuarios y acceso a la db
-------------------------------------------------------------------------------

USE master;  -- cambiar al contexto de servidor
GO

-- crear logins a nivel servidor
CREATE LOGIN login_solo_lectura   WITH PASSWORD = 'password1';  -- login con contraseña para usuario de solo lectura
CREATE LOGIN login_sin_acceso   WITH PASSWORD = 'password2';  -- login que no podrá conectar
CREATE LOGIN login_solo_sp     WITH PASSWORD = 'password3';  -- login que sólo ejecutará SP
GO

USE caipiIAdb;  -- cambiar al contexto de la base de datos deseada
GO

-- crear usuarios de base de datos asociados a los logins
CREATE USER user_solo_lectura   FOR LOGIN login_solo_lectura;  -- usuario que verá datos
CREATE USER user_sin_acceso   FOR LOGIN login_sin_acceso;  -- usuario sin acceso
CREATE USER user_solo_sp     FOR LOGIN login_solo_sp;    -- usuario que sólo puede ejecutar SP
GO

-- controlar CONNECT a la base
DENY CONNECT TO user_sin_acceso;       -- denegar conexión completamente
GRANT CONNECT TO user_solo_lectura;      -- permitir conexión
GRANT CONNECT TO user_solo_sp;        -- permitir conexión
GO
```

</details>

##### 1.2 Conceder solo permisos de SELECT sobre una tabla a un usuario específico. Será posible crear roles y que existan roles que si puedanhacer ese select sobre esa tabla y otros Roles que no puedan? Demuestrelo con usuarios y roles pertinentes.

<details>
	<summary>Mostrar script</summary>

```sql
-------------------------------------------------------------------------------
-- Roles y permisos SELECT sobre dbo.caipi_users
-------------------------------------------------------------------------------

CREATE ROLE rol_si_select;           -- rol que podrá hacer SELECT
CREATE ROLE rol_no_select;        -- rol que no podrá hacer SELECT
GO

ALTER ROLE rol_si_select ADD MEMBER user_solo_lectura;  -- asignar ReadOnly al rol con SELECT
ALTER ROLE rol_no_select ADD MEMBER user_solo_sp;    -- asignar SPOnly al rol sin SELECT
GO

GRANT SELECT ON dbo.caipi_users TO rol_si_select;   -- conceder SELECT al rol
DENY  SELECT ON dbo.caipi_users TO rol_no_select;-- denegar SELECT al otro rol
GO

-- probar permisos de SELECT
EXECUTE AS USER = 'user_solo_lectura';  
SELECT TOP(1) * FROM dbo.caipi_users;   -- funciona porque tiene SELECT
REVERT;
-- REVERT restaura el contexto al usuario original, es decir, el que ejecutó originalmente el script.
-- Si no usas REVERT, seguirás "siendo" ese usuario dentro de esa sesión, lo que puede causar confusión o errores de permisos después.
EXECUTE AS USER = 'user_solo_sp';  
SELECT TOP(1) * FROM dbo.caipi_users;   -- falla por DENY
REVERT;
GO
-- Msg 229, Level 14, State 5, Line 51
-- The SELECT permission was denied on the object 'caipi_users', database 'caipiIAdb', schema 'dbo'.
EXECUTE AS USER = 'user_sin_acceso';  
SELECT TOP(1) * FROM dbo.caipi_users;   -- falla por DENY
REVERT;
GO
-- Msg 916, Level 14, State 4, Line 57
-- The server principal "login_sin_acceso" is not able to access the database "caipiIAdb" under the current security context.
```

</details>

##### 1.3 Permitir ejecución de ciertos SPs y denegar acceso directo a las tablas que ese SP utiliza, será que aunque tengo las tablas restringidas, puedo ejecutar el SP?

<details>
	<summary>Mostrar script</summary>

```sql
-------------------------------------------------------------------------------
-- SP que expone datos y oculta acceso directo a tablas
-------------------------------------------------------------------------------
CREATE OR ALTER PROCEDURE dbo.caipiSP_ObtenerUsuariosOWNER
WITH EXECUTE AS OWNER -- ejecuta con permisos de propietario, sin importar el invocador
AS
BEGIN
	SELECT userid, username FROM dbo.caipi_users;
END;
GO

CREATE OR ALTER PROCEDURE dbo.caipiSP_ObtenerUsuariosREGULAR
AS
BEGIN
	SELECT userid, username FROM dbo.caipi_users;
END;
GO

-- configurar permisos para user_solo_sp
DENY SELECT ON dbo.caipi_users TO user_solo_sp;
GRANT EXECUTE ON dbo.caipiSP_ObtenerUsuariosOWNER TO user_solo_sp;

-- probar ejecución de los sp
EXECUTE AS USER = 'user_solo_sp';
SELECT * FROM dbo.caipi_users;
EXEC dbo.caipiSP_ObtenerUsuariosREGULAR;
EXEC dbo.caipiSP_ObtenerUsuariosOWNER;
REVERT;
GO
```
 
</details>

##### 1.4 Habrá alguna forma de implementar RLS, row level security

<details>
	<summary>Mostrar script</summary>

```sql
-------------------------------------------------------------------------------
-- Row‑Level Security: sólo ver miembros propios
-------------------------------------------------------------------------------
-- función de predicado
IF OBJECT_ID('dbo.caipiFN_MemberFilter','FN') IS NOT NULL
	DROP FUNCTION dbo.caipiFN_MemberFilter;  
GO
CREATE FUNCTION dbo.caipiFN_MemberFilter(@userid INT)
RETURNS TABLE
WITH SCHEMABINDING
AS
    RETURN SELECT 1 AS fn_ok
           WHERE @userid = USER_ID();  -- solo pasa filas si el userid coincide con el usuario de contexto
GO

-- política de seguridad
IF OBJECT_ID('dbo.caipiSecurityPolicy_Members','POL') IS NOT NULL 
	DROP SECURITY POLICY dbo.caipiSecurityPolicy_Members;  
GO
CREATE SECURITY POLICY dbo.caipiSecurityPolicy_Members
    ADD FILTER PREDICATE dbo.caipiFN_MemberFilter(userid) ON dbo.caipi_members  -- aplicar el filtro a caipi_members
    WITH (STATE = ON);      -- activar la política
GO

-- probar RLS
EXECUTE AS USER = 'user_solo_lectura';  
SELECT * FROM dbo.caipi_members;  -- sólo verá sus propias filas
REVERT;
GO
```
 
</details>


#### 2. Crear un certificado y llave asimétrica.
```sql
-- Debido a que SQL Server trabaja con una jerarquía de claves, debemos tener una clave maestra primero
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'ClaveMaestra';
GO	

-- Crear certificado
CREATE CERTIFICATE CaipiSeguridad
WITH SUBJECT = 'CaipiCertificado';

-- Crear llave asimétrica
CREATE ASYMMETRIC KEY CaipiClaveAsimetrica
WITH ALGORITHM = RSA_2048
ENCRYPTION BY PASSWORD = 'CaipiCaso2';

-- Creamos una credencial que enlace el certificado con la llave asimetrica 
CREATE CREDENTIAL CertificadoEnlace
WITH IDENTITY = 'CaipiSeguridad',
SECRET = 'CaipiClaveAsimetrica'
```

#### 3. Crear una llave simétrica.
```sql
-- Crear llave simétrica
CREATE SYMMETRIC KEY ClaveSimetrica
WITH ALGORITHM = AES_256 
ENCRYPTION BY PASSWORD = 'CaipiContraseñaSimetrica';

-- Abrir llave
OPEN SYMMETRIC KEY ClaveSimetrica
DECRYPTION BY PASSWORD = 'CaipiContraseñaSimetrica'; -- Contraseña original

-- Proteger clave simetrica con asimetrica
ALTER SYMMETRIC KEY ClaveSimetrica
ADD ENCRYPTION BY ASYMMETRIC KEY CaipiClaveAsimetrica; -- Usa la llave asimétrica

-- Cerrar la llave
CLOSE SYMMETRIC KEY ClaveSimetrica;

-- Abrir la llave simétrica usando la llave asimétrica
OPEN SYMMETRIC KEY ClaveSimetrica
DECRYPTION BY ASYMMETRIC KEY CaipiClaveAsimetrica
WITH PASSWORD = 'CaipiCaso2'; -- Contraseña de la llave asimétrica

-- ===================================================================
-- Ver si la llave está abierta
-- ===================================================================
SELECT key_name AS 'Llave Abierta' 
FROM sys.openkeys;
```

#### 4. Cifrar datos sensibles usando cifrado simétrico y proteger la llave privada con las llaves asimétrica definidas en un certificado del servidor.
```sql
-- ENCRIPTACIÓN DE DATOS 

-- Abrimos la llave simetrica
OPEN SYMMETRIC KEY ClaveSimetrica
DECRYPTION BY ASYMMETRIC KEY CaipiClaveAsimetrica
WITH PASSWORD = 'CaipiCaso2'

-- Encriptación de las contraseñas de los usuarios y nombres
UPDATE caipi_users
SET password = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), password),
name = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), name)


-- Encriptación del Mask Account y CallBackURL
UPDATE caipi_availablePaymentMethods
SET callbackURL = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), callbackURL),
	maskAccount = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), maskAccount)

-- Encriptación del authNumber
UPDATE caipi_payments
SET authNumber = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), authNumber)

-- Encriptación del computer
UPDATE caipi_logs
SET computer = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), computer)

-- Encriptación del quantity (Hace que aunque consigan la otra información, no puedan interpretarla)
UPDATE caipi_AgreementsPerPlan
SET quantity = ENCRYPTBYKEY(KEY_GUID('ClaveSimetrica'), quantity)

-- Cerrar la llave
CLOSE SYMMETRIC KEY ClaveSimetrica;
```

#### 5. Crear un SP que descifre los datos protegidos usando las llaves anteriores.
```sql
-- Modificar el Stored Procedure DesencriptarColumna
CREATE PROCEDURE DesencriptarColumna
    @NombreTabla NVARCHAR(128),
    @NombreColumna NVARCHAR(128),
    @NombreLlaveSimetrica NVARCHAR(128),
    @NombreLlaveAsimetrica NVARCHAR(128),
    @ContraseñaLlaveAsimetrica NVARCHAR(256)
AS
BEGIN
    -- Evitar el conteo de filas afectadas
    SET NOCOUNT ON;

    -- Construir la consulta dinámicamente
    DECLARE @SQL NVARCHAR(MAX);
    SET @SQL = '
    OPEN SYMMETRIC KEY ' + QUOTENAME(@NombreLlaveSimetrica) + '
    DECRYPTION BY ASYMMETRIC KEY ' + QUOTENAME(@NombreLlaveAsimetrica) + '
    WITH PASSWORD = ''' + @ContraseñaLlaveAsimetrica + ''';

    SELECT
        ' + QUOTENAME(@NombreColumna) + ' AS ColumnaEncriptada,
        CONVERT(NVARCHAR(MAX), DECRYPTBYKEY(' + QUOTENAME(@NombreColumna) + ')) AS ColumnaDesencriptada
    FROM ' + QUOTENAME(@NombreTabla) + ';

    CLOSE SYMMETRIC KEY ' + QUOTENAME(@NombreLlaveSimetrica) + ';';

    -- Ejecutar la consulta dinámica
    EXEC sp_executesql @SQL;
END;
GO

-- Ejemplo de uso
EXEC DesencriptarColumna
    @NombreTabla = 'caipi_users',
    @NombreColumna = 'password',
    @NombreLlaveSimetrica = 'ClaveSimetrica',
    @NombreLlaveAsimetrica = 'CaipiClaveAsimetrica',
    @ContraseñaLlaveAsimetrica = 'CaipiCaso2';
```

# Consultas Misceláneas

#### 6. Crear un procedimiento almacenado transaccional que llame a otro SP transaccional, el cual a su vez llame a otro SP transaccional. Cada uno debe modificar al menos 2 tablas. Se debe demostrar que es posible hacer COMMIT y ROLLBACK con ejemplos exitosos y fallidos sin que haya interrumpción de la ejecución correcta de ninguno de los SP en ninguno de los niveles del llamado.

<details>
	<summary>Haz clic para expandir</summary>

 ```sql
-- NIVEL 3
CREATE  OR ALTER PROCEDURE [dbo].[caipiSP_NIVEL3]
	@userid INT,
	@direccion VARCHAR(200),
	@payMethod INT
AS 
BEGIN
	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables

	-- operaciones de select que no tengan que ser bloqueadas
	-- tratar de hacer todo lo posible antes de q inice la transaccion
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001

		-- put your code here

		UPDATE TOP(1) a
		SET a.line1 = @direccion
		FROM dbo.caipi_Adresses AS a
		JOIN dbo.caipi_AdressessPerUser AS apu ON a.adressId = apu.adressId
		WHERE apu.userid = @userid;

		UPDATE TOP(1) pm
		SET pm.paymentMethodId = @payMethod
		FROM dbo.caipi_AvailiablePaymentMethodsPerUser AS pm
		WHERE pm.idUser = @userid;

		-- es importante que el código que escriba aquí sea lo más corto y lo más eficiente posible
		-- queremos durar lo menos posible para llegar al commit 
		-- aqui asustan, hay que pasar rápido por aquí
					
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		-- en esencia, lo que hay  que hacer es registrar el error real, y enviar para arriba un error custom 
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		-- el error original lo inserte en la tabla de logs, pero retorno a la capa superior un error en "bonito"
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError) -- hay que sustituir el @message por un error personalizado bonito, lo ideal es sacarlo de sys.messages 
		-- en la tabla de sys.messages se pueden insertar mensajes personalizados de error, los cuales se les hace match con el numero en @CustomError
	END CATCH	
END
RETURN 0
GO




-- NIVEL 2
CREATE OR ALTER PROCEDURE [dbo].[caipiSP_NIVEL2]
	@userid INT,
	@membershipEnabled BIT,
	@subscriptionEnable BIT,
	@direccion VARCHAR(200),
	@payMethod INT
AS 
BEGIN
	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables

	-- operaciones de select que no tengan que ser bloqueadas
	-- tratar de hacer todo lo posible antes de q inice la transaccion
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001

		-- put your code here

		UPDATE dbo.caipi_subscriptions
		SET enable = @subscriptionEnable
		WHERE userid = @userid;

		UPDATE dbo.caipi_members
		SET enabled = @membershipEnabled		
		WHERE userid = @userid;

		EXEC dbo.caipiSP_NIVEL3 
			@userid = @userid,
			@direccion = @direccion,
			@payMethod = @payMethod;

		-- es importante que el código que escriba aquí sea lo más corto y lo más eficiente posible
		-- queremos durar lo menos posible para llegar al commit 
		-- aqui asustan, hay que pasar rápido por aquí
					
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		-- en esencia, lo que hay  que hacer es registrar el error real, y enviar para arriba un error custom 
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		-- el error original lo inserte en la tabla de logs, pero retorno a la capa superior un error en "bonito"
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError) -- hay que sustituir el @message por un error personalizado bonito, lo ideal es sacarlo de sys.messages 
		-- en la tabla de sys.messages se pueden insertar mensajes personalizados de error, los cuales se les hace match con el numero en @CustomError
	END CATCH	
END
RETURN 0
GO


-- NIVEL 1
CREATE OR ALTER PROCEDURE [dbo].[caipiSP_NIVEL1]
	@userid INT,
	@lastname VARCHAR(50),
	@contact VARCHAR(100),
	@membershipEnabled BIT,
	@subscriptionEnable BIT,
	@direccion VARCHAR(200),
	@payMethod INT
AS 
BEGIN
	
	SET NOCOUNT ON
	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables

	-- operaciones de select que no tengan que ser bloqueadas
	
	-- verifico existencia
	IF NOT EXISTS (SELECT 1 FROM dbo.caipi_users WHERE userid = @userid)
	BEGIN
		-- genero un error de usuario, severidad 16 (fallo), estado 1
		RAISERROR('usuario con id %d no encontrado.', 16, 1, @userid);
		RETURN;  -- salgo del SP
	END

	-- tratar de hacer todo lo posible antes de q inice la transaccion
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001

		-- put your code here

		UPDATE dbo.caipi_users
		SET lastname = @lastname, last_update = GETDATE()
		WHERE userid = @userid;

		UPDATE dbo.caipi_contactInfoPerUsers
		SET value = @contact, lastUpdate = GETDATE()
		WHERE userid = @userid AND contactInfoTypeId = 1;

		EXEC dbo.caipiSP_NIVEL2
			@userid = @userid,
			@membershipEnabled = @membershipEnabled,
			@subscriptionEnable = @subscriptionEnable,
			@direccion = @direccion,
			@payMethod = @payMethod;

		-- es importante que el código que escriba aquí sea lo más corto y lo más eficiente posible
		-- queremos durar lo menos posible para llegar al commit 
		-- aqui asustan, hay que pasar rápido por aquí
					
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		-- en esencia, lo que hay  que hacer es registrar el error real, y enviar para arriba un error custom 
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		-- el error original lo inserte en la tabla de logs, pero retorno a la capa superior un error en "bonito"
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError) -- hay que sustituir el @message por un error personalizado bonito, lo ideal es sacarlo de sys.messages 
		-- en la tabla de sys.messages se pueden insertar mensajes personalizados de error, los cuales se les hace match con el numero en @CustomError
	END CATCH	
END
RETURN 0
GO

DECLARE @userid INT = 101
DECLARE @lastname VARCHAR(50) = 'sequeira'
DECLARE @contact VARCHAR(100) = 'prueba@gmail.com'
DECLARE @membershipEnabled BIT = 1
DECLARE @subscriptionEnable BIT = 1
DECLARE @direccion VARCHAR(200) = 'cartago'
DECLARE @payMethod INT = 2

--select * from dbo.caipi_users where userid = @userid;
--select * from caipi_contactInfoPerUsers as c where c.userid = @userid;
--select * from caipi_members as m where m.userid = @userid;
--select * from caipi_subscriptions as s where s.userid = @userid;
--select * from caipi_Adresses as a join caipi_AdressessPerUser as ap on a.adressId = ap.adressId where ap.userid = @userid;
--select * from caipi_AvailiablePaymentMethodsPerUser as apm where apm.idUser = @userid;

EXEC dbo.caipiSP_NIVEL1
	@userid = @userid,
	@lastname = @lastname,
	@contact = @contact,
	@membershipEnabled = @membershipEnabled,
	@subscriptionEnable = @subscriptionEnable,
	@direccion = @direccion,
	@payMethod = @payMethod;

```
</details>

#### 7. Será posible que haciendo una consulta SQL en esta base de datos se pueda obtener un JSON para ser consumido por alguna de las pantallas de la aplicación que tenga que ver con los planes, subscripciones, servicios o pagos. Justifique cuál pantalla podría requerir esta consulta.

<details>
	<summary>Mostrar script</summary>

 ```sql
CREATE PROCEDURE dbo.caipiSP_ObtenerProveedoresJSON
	@json VARCHAR(MAX) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
	
	-- Abrir la llave simétrica
	OPEN SYMMETRIC KEY LlaveSimetrica
	DECRYPTION BY ASYMMETRIC KEY LlaveAsimetrica;
	
	-- Hacemos el query
	SELECT @json = (
		SELECT 
			s.idSupplier AS id, 
			s.name AS nombre, 
			m.mediaURL AS logo, 
			CONVERT(VARCHAR(200), DecryptByKey(c.value)) AS contacto
		FROM dbo.caipi_suppliers AS s
		INNER JOIN dbo.caipi_supplierCategories AS sc ON s.idsupplierCategories = sc.idsupplierCategories
		INNER JOIN dbo.caipi_mediaFiles AS m ON s.idmediaFiles = m.idmediaFiles
		INNER JOIN dbo.caipi_contactInfoPerSupplier AS c ON s.idSupplier = c.idSupplier
		INNER JOIN dbo.caipi_contactInfoType AS ct ON c.contactInfoTypeId = ct.conatctInfoTypeId
		FOR JSON PATH, ROOT('proveedores')
	);
	
	-- Cerrar la llave
	CLOSE SYMMETRIC KEY LlaveSimetrica;
END;


DECLARE @Proveedoresjson VARCHAR(MAX);
EXEC dbo.caipiSP_ObtenerProveedoresJSON @json = @Proveedoresjson OUTPUT;
SELECT @Proveedoresjson AS proveedores;

-- Justificacion de uso: pantalla de presentación o visualización pública de proveedores en la pagina web
```

</details>

<details>
	<summary>Mostrar resultado</summary>

```json
{
  "proveedores": [
    {
      "id": 1,
      "nombre": "The Retreat Costa Rica        ",
      "logo": "https://media.soltura.com/plan_fitness_4_personas.mp4",
      "contacto": "info@theretreatcr.com"
    },
    {
      "id": 2,
      "nombre": "Vida Mia Healing Center       ",
      "logo": "https://media.soltura.com/plan_yoga_familiar.mp4",
      "contacto": "contacto@vidamia.com"
    },
    {
      "id": 4,
      "nombre": "Paws & Co.                    ",
      "logo": "https://media.soltura.com/plan_grooming_mascota.jpg",
      "contacto": "pawsco@vetservices.com"
    },
    {
      "id": 6,
      "nombre": "VolAir Studio                 ",
      "logo": "https://media.soltura.com/plan_yoga_familiar.mp4",
      "contacto": "info@volairstudio.com"
    },
    {
      "id": 7,
      "nombre": "Smart Fit                     ",
      "logo": "https://media.soltura.com/plan_fitness_4_personas.mp4",
      "contacto": "smartfit@fitness.com"
    },
    {
      "id": 8,
      "nombre": "AmaSer                        ",
      "logo": "https://media.soltura.com/plan_yoga_familiar.mp4",
      "contacto": "amamaser@wellness.com"
    },
    {
      "id": 5,
      "nombre": "The Pets Club                 ",
      "logo": "https://media.soltura.com/servicio_mantenimiento_mascota.jpg",
      "contacto": "+506 6000 9000"
    },
    {
      "id": 3,
      "nombre": "Agromédica Veterinaria        ",
      "logo": "https://media.soltura.com/plan_revision_veterinaria.jpg",
      "contacto": "+506 2222 3333"
    },
    {
      "id": 1,
      "nombre": "The Retreat Costa Rica        ",
      "logo": "https://media.soltura.com/plan_fitness_4_personas.mp4",
      "contacto": "+506 4000 1234"
    },
    {
      "id": 3,
      "nombre": "Agromédica Veterinaria        ",
      "logo": "https://media.soltura.com/plan_revision_veterinaria.jpg",
      "contacto": "www.agromedica.cr"
    },
    {
      "id": 5,
      "nombre": "The Pets Club                 ",
      "logo": "https://media.soltura.com/servicio_mantenimiento_mascota.jpg",
      "contacto": "www.thepetsclub.cr"
    },
    {
      "id": 7,
      "nombre": "Smart Fit                     ",
      "logo": "https://media.soltura.com/plan_fitness_4_personas.mp4",
      "contacto": "www.smartfit.cr"
    },
    {
      "id": 6,
      "nombre": "VolAir Studio                 ",
      "logo": "https://media.soltura.com/plan_yoga_familiar.mp4",
      "contacto": "+506 7000 8000"
    },
    {
      "id": 4,
      "nombre": "Paws & Co.                    ",
      "logo": "https://media.soltura.com/plan_grooming_mascota.jpg",
      "contacto": "+506 8888 7777"
    },
    {
      "id": 2,
      "nombre": "Vida Mia Healing Center       ",
      "logo": "https://media.soltura.com/plan_yoga_familiar.mp4",
      "contacto": "+506 4000 5678"
    }
  ]
}
```

</details>

#### 8. Podrá su base de datos soportar un SP transaccional que actualice los contratos de servicio de un proveedor, el proveedor podría ya existir o ser nuevo, si es nuevo, solo se inserta. Las condiciones del contrato del proveedor, deben ser suministradas por un Table-Valued Parameter (TVP), si las condiciones son sobre items existentes, entonces se actualiza o inserta realizando las modificacinoes que su diseño requiera, si son condiciones nuevas, entonces se insertan.

<details>
	<summary>Mostrar script</summary>

```sql
-- 1. Crear el tipo TVP
CREATE TYPE dbo.caipiTVP_CondicionesProveedor AS TABLE (
	[idagreementTerm] [int] IDENTITY(1,1) NOT NULL,
	[enable] [bit] NOT NULL,
	[checkSum] [varbinary](255) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[idMeasureUnit] [int] NOT NULL,
	[idService] [int] NULL,
	[finalDate] [datetime] NOT NULL,
	[idSupplier] [int] NULL,
	[signedDate] [datetime] NULL,
	[deleted] [bit] NOT NULL,
	[access] [bit] NULL,
	[disccountPercentage] [decimal](5, 2) NULL,
	[originalPrice] [decimal](5, 2) NOT NULL,
	[agreementPrice] [decimal](5, 2) NOT NULL,
	[salePrice] [decimal](5, 2) NOT NULL,
	[IVA] [bit] NOT NULL,
	[idAgreementType] [int] NOT NULL,
	[currencyId] [int] NULL,
	[quantity] [int] NULL,
	[scheduleId] [int] NULL,
	[userDisccount] [decimal](5, 2) NULL
);
GO

CREATE OR ALTER PROCEDURE [dbo].[caipiSP_ActualizarCondiciones]
	@supplierID INT,
	@name VARCHAR(30),
	@enable BIT,
	@categoryID INT,
	@mediafileID INT,
	@agreementID INT,
	@deleted BIT,
	@condiciones dbo.caipiTVP_CondicionesProveedor READONLY
AS 
BEGIN
	
	SET NOCOUNT ON;
	SET XACT_ABORT ON;    -- << importante

	
	DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT
	DECLARE @Message VARCHAR(200)
	DECLARE @InicieTransaccion BIT

	-- declaracion de otras variables
	DECLARE @supplier_exist BIT = 1

	-- operaciones de select que no tengan que ser bloqueadas
	IF NOT EXISTS (SELECT 1 FROM dbo.caipi_suppliers WHERE idSupplier = @supplierID)
	BEGIN
		SET @supplier_exist = 0;
	END
	-- tratar de hacer todo lo posible antes de q inice la transaccion
	
	SET @InicieTransaccion = 0
	IF @@TRANCOUNT=0 BEGIN
		SET @InicieTransaccion = 1
		SET TRANSACTION ISOLATION LEVEL READ COMMITTED
		BEGIN TRANSACTION		
	END
	
	BEGIN TRY
		SET @CustomError = 2001

		-- put your code here

		IF @supplier_exist = 0
		BEGIN
			INSERT INTO dbo.caipi_suppliers
				(name, enable, idsupplierCategories, idmediaFiles, idagreementTerms, deleted)
			VALUES
				(@name, @enable, @categoryID, @mediafileID, @agreementID, @deleted);
			SET @supplierID = SCOPE_IDENTITY();
		END
		
		MERGE dbo.caipi_agreementTerms AS destino
        USING @condiciones AS origen
        ON destino.idSupplier = @supplierID AND destino.idSupplier = origen.idSupplier AND destino.checkSum = origen.checkSum
        WHEN MATCHED THEN 
			UPDATE SET
				enable = origen.enable,
				checkSum = origen.checkSum,
				startDate = origen.startDate,
				idMeasureUnit = origen.idMeasureUnit,
				idService = origen.idService,
				finalDate = origen.finalDate,
				idSupplier = @supplierID,
				signedDate = origen.signedDate,
				deleted = origen.deleted,
				access = origen.access,
				disccountPercentage = origen.disccountPercentage,
				originalPrice = origen.originalPrice,
				agreementPrice = origen.agreementPrice,
				salePrice = origen.salePrice,
				IVA = origen.IVA,
				idAgreementType = origen.idAgreementType,
				currencyId = origen.currencyId,
				quantity = origen.quantity,
				scheduleId = origen.scheduleId,
				userDisccount = origen.userDisccount
        WHEN NOT MATCHED THEN
            INSERT
				(
					enable, checkSum, startDate, idMeasureUnit, idService, finalDate, 
					idSupplier, signedDate, deleted, access, disccountPercentage, originalPrice, 
					agreementPrice, salePrice, IVA, idAgreementType, currencyId, quantity, scheduleId, userDisccount
				)
			VALUES
				(
					origen.enable, origen.checkSum, origen.startDate, origen.idMeasureUnit, origen.idService, origen.finalDate, 
					@SupplierID, origen.signedDate, origen.deleted, origen.access, origen.disccountPercentage, origen.originalPrice, 
					origen.agreementPrice, origen.salePrice, origen.IVA, origen.idAgreementType, origen.currencyId, origen.quantity, origen.scheduleId, origen.userDisccount
				);



		-- es importante que el código que escriba aquí sea lo más corto y lo más eficiente posible
		-- queremos durar lo menos posible para llegar al commit 
		-- aqui asustan, hay que pasar rápido por aquí
					
		IF @InicieTransaccion=1 BEGIN
			COMMIT
		END
	END TRY
	BEGIN CATCH
		-- en esencia, lo que hay  que hacer es registrar el error real, y enviar para arriba un error custom 
		SET @ErrorNumber = ERROR_NUMBER()
		SET @ErrorSeverity = ERROR_SEVERITY()
		SET @ErrorState = ERROR_STATE()
		SET @Message = ERROR_MESSAGE()
		
		IF @InicieTransaccion=1 BEGIN
			ROLLBACK
		END
		-- el error original lo inserte en la tabla de logs, pero retorno a la capa superior un error en "bonito"
		RAISERROR('%s - Error Number: %i', 
			@ErrorSeverity, @ErrorState, @Message, @CustomError) -- hay que sustituir el @message por un error personalizado bonito, lo ideal es sacarlo de sys.messages 
		-- en la tabla de sys.messages se pueden insertar mensajes personalizados de error, los cuales se les hace match con el numero en @CustomError
	END CATCH	
END
RETURN 0
GO




-- 1) preparar TVP con dos condiciones: 
DECLARE @tvp dbo.caipiTVP_CondicionesProveedor;

INSERT INTO @tvp
  (enable, checkSum, startDate, idMeasureUnit, idService, finalDate,
   idSupplier, signedDate, deleted, access, disccountPercentage, originalPrice,
   agreementPrice, salePrice, IVA, idAgreementType, currencyId, quantity, scheduleId, userDisccount)
VALUES
  (1, 0xABCDEF, '2025-05-01', 1, 10, '2025-12-31', 16, '2025-05-01', 0, 1, 5.00, 100.00, 95.00, 890.00, 1, 2, 1, 10, 1, 0.00),
  (1, 0x123456, '2025-06-01', 2, 20, '2025-12-31', 16, '2025-06-01', 0, 1, 0.00,  200.00,180.00, 230.00, 1, 3, 2,  5, 2, 10.00);

-- 2) ejecutar SP
EXEC dbo.caipiSP_ActualizarCondiciones
  @supplierID   = 16,
  @name         = 'Proveedor X',
  @enable       = 1,
  @categoryID   = 5,
  @mediafileID  = 3,
  @agreementID  = 0,
  @deleted      = 0,
  @condiciones  = @tvp;

-- 3) verificar
SELECT * FROM dbo.caipi_suppliers    WHERE name = 'Proveedor X';
SELECT * FROM dbo.caipi_agreementTerms WHERE idSupplier = 16;
```
 </details>

 #### 9. Crear un SELECT que genere un archivo CSV de datos basado en un JOIN entre dos tablas

<details>
	<summary>Mostrar script</summary>

```sql
GO
CREATE OR ALTER PROCEDURE dbo.caipiSP_ObtenerUserPlanStardateCSV
AS
BEGIN
    SET NOCOUNT ON;
	
	-- Hacemos el query
	SELECT 'username,plan,stardate' AS csv
	UNION ALL
	SELECT 
		u.username + ',' +
		p.name + ',' +
		CONVERT(VARCHAR(30), s.startdate) AS startdate
	FROM dbo.caipi_users AS u
	INNER JOIN dbo.caipi_subscriptions AS s ON u.userid = s.userid
	INNER JOIN dbo.caipi_plans AS p ON s.idPlan = p.idPlan
	WHERE
		u.active = 1
		AND s.enable = 1
		AND p.enable = 1;
END;
GO

EXEC dbo.caipiSP_ObtenerUserPlanStardateCSV;
```

</details>

<details>
	<summary>Mostrar resultado</summary>

```csv
username,plan,stardate
lgarcia002,Combo Soltura,2025-02-24
mgarcia003,Creativo Freelance,2024-06-14
mtorres004,Combo Soltura,2025-04-14
mmartinez005,Viajero Frecuente,2024-05-09
agarcia006,EcoVida,2024-07-03
cramirez007,Estudiante Proactivo,2024-08-04
jperez008,Fit & Chill,2024-12-24
mmartinez009,Viajero Frecuente,2024-10-08
alopez010,Viajero Frecuente,2024-10-14
mgarcia011,Tiempo en Familia,2024-05-04
clopez012,Combo Soltura,2025-02-23
cmartinez013,Joven Deportista,2024-09-09
cperez014,Familia de Verano,2024-05-14
llopez015,Estudiante Proactivo,2025-04-11
mramirez016,Viajero Frecuente,2024-09-17
ctorres017,Estudiante Proactivo,2024-11-09
jlopez018,Viajero Frecuente,2024-12-21
cgonzalez019,Nómada Digital,2024-08-14
jhernandez020,Creativo Freelance,2025-01-30
mramirez021,Familia de Verano,2024-12-27
agonzalez022,Profesional en Movimiento,2024-09-02
cmartinez023,Explorador Urbano,2024-11-27
mhernandez024,Estudiante Proactivo,2024-11-17
mramirez025,Hogar Equilibrado,2025-02-12
cgonzalez026,EcoVida,2025-03-28
ltorres027,Full Wellness,2025-03-16
ahernandez028,Hogar Equilibrado,2024-10-17
jgarcia029,Fit & Chill,2024-04-21
cgarcia030,Creativo Freelance,2024-11-12
lramirez031,Hogar Equilibrado,2024-05-27
cgarcia032,Profesional en Movimiento,2024-11-29
mgarcia033,Full Wellness,2025-03-10
aramirez034,Full Wellness,2024-06-28
jmartinez035,Profesional en Movimiento,2024-07-14
mgonzalez036,Estudiante Proactivo,2024-12-17
mperez037,Hogar Equilibrado,2024-04-30
ltorres038,Estudiante Proactivo,2024-11-29
lhernandez039,Estudiante Proactivo,2025-01-06
agonzalez040,Full Wellness,2025-01-29
jperez041,Tiempo en Familia,2024-09-23
jsanchez042,Creativo Freelance,2024-08-02
chernandez043,Familia de Verano,2025-02-03
amartinez044,Combo Soltura,2024-06-04
jlopez045,Combo Soltura,2024-08-31
ltorres046,EcoVida,2025-02-08
ltorres047,Hogar Equilibrado,2024-09-13
jlopez048,Familia de Verano,2024-11-10
mramirez049,Joven Deportista,2024-09-07
jrodriguez050,EcoVida,2024-06-03
cgarcia051,Combo Soltura,2024-10-08
cmartinez052,Viajero Frecuente,2024-12-08
aramirez053,Joven Deportista,2024-09-24
lsanchez054,Familia de Verano,2024-07-29
mramirez055,Profesional en Movimiento,2024-09-05
lsanchez056,Familia de Verano,2024-10-22
cgarcia057,EcoVida,2024-06-17
ahernandez058,Nómada Digital,2025-03-01
lramirez059,Familia de Verano,2024-05-18
jgarcia060,Zen Diario,2024-12-16
aperez061,EcoVida,2025-02-09
cgarcia062,Nómada Digital,2024-09-04
cmartinez063,Combo Soltura,2024-11-11
mtorres064,Joven Deportista,2024-07-06
ctorres065,Full Wellness,2024-06-06
jramirez066,Hogar Equilibrado,2024-07-21
```

 </details>

#### 10. Configurar una tabla de bitácora en otro servidor SQL Server accesible vía Linked Servers con impersonación segura desde los SP del sistema. Ahora haga un SP genérico para que cualquier SP en el servidor principal, pueda dejar bitácora en la nueva tabla que se hizo en el Linked Server.

<details>
	<summary>Mostrar script creacion segunda base de datos</summary>

```sql
USE [caipiLogs]

/****** Object:  Table [dbo].[caipi_logs]    Script Date: 21/4/2025 12:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caipi_logs](
	[logId] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](80) NULL,
	[postime] [timestamp] NOT NULL,
	[computer] [varchar](100) NOT NULL,
	[username] [varchar](70) NOT NULL,
	[trace] [varchar](300) NULL,
	[referenceId1] [bigint] NULL,
	[referenceId2] [bigint] NULL,
	[value1] [varchar](300) NULL,
	[value2] [varchar](300) NULL,
	[chechsum] [varbinary](256) NOT NULL,
	[logSeverityId] [int] NOT NULL,
	[logSourceId] [int] NOT NULL,
	[logTypeId] [int] NOT NULL,
 CONSTRAINT [PK_caipi_qrLogs] PRIMARY KEY CLUSTERED 
(
	[logId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caipi_logSeverity]    Script Date: 21/4/2025 12:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caipi_logSeverity](
	[logSeverityId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_caipi_logSeverity] PRIMARY KEY CLUSTERED 
(
	[logSeverityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caipi_logsSources]    Script Date: 21/4/2025 12:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caipi_logsSources](
	[logSourceId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_caipi_logsSources] PRIMARY KEY CLUSTERED 
(
	[logSourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caipi_logTypes]    Script Date: 21/4/2025 12:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caipi_logTypes](
	[logTypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_caipi_logTypes] PRIMARY KEY CLUSTERED 
(
	[logTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
```

 </details>

<details>
	<summary>Mostrar script de llenado de segunda base de datos</summary>

```sql
USE [caipiLogs];

-- Log severity
INSERT INTO [dbo].[caipi_logSeverity] ([name])
VALUES
	('Low'),
	('Medium'),
	('High'),
	('Critical'),
	('Informational');

--Log Sources
INSERT INTO [dbo].[caipi_logsSources] ([name])
VALUES
	('System'),
	('Application'),
	('Database'),
	('Security'),
	('User Activity'),
	('Network'),
	('API'),
	('Payment Gateway'),
	('Error Handler'),
	('Authentication'),
	('File System');

--Log Types
INSERT INTO [dbo].[caipi_logTypes] ([name])
VALUES
	('Error'),
	('Warning'),
	('Info'),
	('Debug'),
	('Critical'),
	('Audit'),
	('Security'),
	('Transaction'),
	('Performance'),
	('Access');
```

</details>

<details>
	<summary>Mostrar script</summary>

```sql
EXEC sp_addlinkedserver 
    @server = 'SQLBITACORA',
    @srvproduct = '',
    @provider = 'SQLNCLI',
    @datasrc = 'localhost\SQLBITACORA';
GO

EXEC sp_addlinkedsrvlogin 
    @rmtsrvname = 'SQLBITACORA',
    @useself = 'TRUE'; -- Usa el contexto del usuario que ejecuta el SP
GO

IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'caipiSP_LogToBackupBitacora')
BEGIN
    DROP PROCEDURE dbo.caipiSP_LogToBackupBitacora;
END
GO

CREATE PROCEDURE dbo.caipiSP_LogToBackupBitacora
	@description VARCHAR(80),
	@computer VARCHAR(100),
	@username VARCHAR(70),
	@trace VARCHAR(300),
	@referenceId1 BIGINT,
	@referenceId2 BIGINT,
	@value1 VARCHAR(300),
	@value2 VARCHAR(300),
	@chechsum VARBINARY(256),
	@logSeverityId INT,
	@logSourceId INT,
	@logTypeId INT
AS
BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;

	BEGIN TRAN;
	BEGIN TRY

	INSERT INTO SQLBITACORA.caipiLogs.dbo.caipi_logs 
		(description, postime, computer, username, trace, referenceId1, referenceId2, value1, value2, chechsum, logSeverityId, logSourceId, logTypeId)
	VALUES
		(@description, GETDATE(), @computer, @username, @trace, @referenceId1, @referenceId2, @value1, @value2, @chechsum, @logSeverityId, @logSourceId, @logTypeId);

    COMMIT;  -- si todo OK
	END TRY
	BEGIN CATCH
		ROLLBACK;
	-- relanzo el error real
	THROW;
	END CATCH
END;
GO

EXEC dbo.caipiSP_LogToBackupBitacora
    @description     = 'Error en proceso de carga',
    @computer        = 'Prueba',
    @username        = 'Preuba',
    @trace           = 'StackTrace o detalle del error',
    @referenceId1    = 12345,
    @referenceId2    = 67890,
    @value1          = 'valor1',
    @value2          = 'valor2',
    @chechsum        = 0xDEADBEEF, -- ejemplo binario
    @logSeverityId   = 2,
    @logSourceId     = 1,
    @logTypeId       = 3;

```

 </details>


# Concurrencia

## Cursor de Update

Crear un cursor de update que bloquee los registros que recorre uno a uno, demuestre en que casos dicho cursor los bloquea y en que casos no, para que el equipo de desarrollo sepa para que escenarios usar cursos y cuando no. 

A continuacion se presenta un caso de bloqueo entre dos sesiones de ejecucion. En el cual se demuestra por medio de dos sesiones el bloqueo por parte del fetch.

Actualmente por defecto un cursor no bloquea un registro, no obstante, esto ahora se debe indicar por medio del operador `SCROLL_LOCKS`

```sql

--Con la finalidad de realizar pruebas se recomienda ejecutar la siguiente actualizacion
UPDATE caipi_agreementTerms
SET finalDate = GETDATE(), enable = 1


DECLARE @idAgreementTerm INT
DECLARE @finalDate DATETIME
DECLARE @enable BIT



-- Declara el cursor con bloqueo UPDLOCK y ROWLOCK para garantizar la actualización sin bloqueos globales
DECLARE agreement_terms_cursor CURSOR SCROLL_LOCKS FOR
SELECT idagreementTerm, finalDate, enable
FROM dbo.caipi_agreementTerms WITH (ROWLOCK, UPDLOCK) --SE BLOQUEA TODA LA FILA QUE EL CURSOR ESTA RECORRIENDO
WHERE deleted = 0  -- Solo acuerdos no eliminados

-- Abre el cursor
OPEN agreement_terms_cursor

-- Recupera el primer registro
FETCH NEXT FROM agreement_terms_cursor INTO @idAgreementTerm, @finalDate, @enable

-- Recorre los registros
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Ejemplo de operación: Deshabilitar el acuerdo si la fecha final ha pasado
    IF @finalDate < GETDATE() AND @enable = 1
    BEGIN
        -- Actualiza el valor de 'enable' a 0 sin necesidad de UPDLOCK adicional pq el cursor lo esta realizando
        UPDATE dbo.caipi_agreementTerms
        SET enable = 0
        WHERE idagreementTerm = @idAgreementTerm
    END

	--PRINT 'Procesado el Agreement ID: ' + CAST(@idAgreementTerm AS VARCHAR) +  ', Final Date: ' + CAST(@finalDate AS VARCHAR) +  ', Enabled: ' + CAST(@enable AS VARCHAR)
	WAITFOR DELAY '00:00:012'
    -- Recupera el siguiente registro
    FETCH NEXT FROM agreement_terms_cursor INTO @idAgreementTerm, @finalDate, @enable
END

-- Cierra y desasocia el cursor
CLOSE agreement_terms_cursor
DEALLOCATE agreement_terms_cursor

```

El cursor de UPDATE en SQL Server recorre los registros de una tabla y realiza actualizaciones en ellos mientras mantiene bloqueos para evitar que otros procesos modifiquen esos registros simultáneamente. Al declarar el cursor con la opción SCROLL_LOCKS, se garantiza que el cursor pueda moverse tanto hacia adelante como hacia atrás en los registros, y que los bloqueos sobre las filas que se están procesando se mantengan durante todo el recorrido.

Se utiliza WITH (ROWLOCK, UPDLOCK) para aplicar los bloqueos. El ROWLOCK asegura que solo se bloquea la fila específica que se está procesando, no toda la tabla, lo que permite que otras filas puedan ser modificadas por otros procesos. El UPDLOCK, por su parte, aplica un bloqueo de actualización en la fila, lo que significa que, mientras el cursor está procesando ese registro, nadie más podrá modificarlo. Si otro proceso intenta actualizar la misma fila, tendrá que esperar hasta que el cursor termine de procesarla y libere el bloqueo. Este mecanismo garantiza que los registros no sean modificados concurrentemente, evitando conflictos y asegurando la integridad de los datos mientras se realizan las actualizaciones.

Las siguientes instrucciones se deben ejecutar en otras esion

```sql

DECLARE @agreementId INT
SET @agreementId = 16

UPDATE caipi_agreementTerms
SET finalDate = GETDATE()
WAITFOR DELAY '00:00:01'

```
El UPDATE en otra sesión anterior debe esperar a que el cursor termine de ejecutarse debido al bloqueo UPDLOCK aplicado por el cursor sobre los registros que está procesando. En el caso que mencionas, el cursor adquiere un bloqueo de actualización (UPDLOCK) sobre cada fila mientras la recorre. Este tipo de bloqueo impide que otras transacciones modifiquen los registros bloqueados hasta que el cursor termine su operación y libere el bloqueo.

Cuando otra sesión intenta ejecutar un UPDATE sobre la tabla, como en el caso de actualizar el finalDate, se encuentra con que las filas que el cursor está procesando están bloqueadas con el UPDLOCK. Debido a esto, la sesión que intenta ejecutar el UPDATE no puede modificar esas filas hasta que el cursor haya terminado de procesarlas, ya que el bloqueo de actualización mantiene a otras transacciones a la espera.

El UPDLOCK evita que otros procesos realicen actualizaciones en las filas bloqueadas, lo que asegura que no haya cambios concurrentes en los registros mientras el cursor está en ejecución. Una vez que el cursor termina y se cierra, los bloqueos se liberan, y las sesiones que estaban esperando pueden continuar con sus transacciones y modificar las filas si es necesario.

---
### Casos en los que un cursor no bloquearia una fila

Como fue mencionado anteriormente, uun cursor al no poseer un operador de bloqueo este no bloquea la fila a la que se le este realizando fetch por lo que se muestra un ejemplo en el que al declarar un cursor sencillo no realiza bloqueos si yo ejecuto una transaccion sobre el mismo dato en otra sesion

```sql

--Con la finalidad de realizar pruebas se recomienda ejecutar la siguiente actualizacion
UPDATE caipi_agreementTerms
SET finalDate = GETDATE(), enable = 1


DECLARE @idAgreementTerm INT
DECLARE @finalDate DATETIME
DECLARE @enable BIT



-- Declara el cursor con bloqueo UPDLOCK y ROWLOCK para garantizar la actualización sin bloqueos globales
DECLARE agreement_terms_cursor CURSOR FOR
SELECT idagreementTerm, finalDate, enable
FROM dbo.caipi_agreementTerms  --NO SE BLOQUEA TODA LA FILA QUE EL CURSOR ESTA RECORRIENDO PQ NO SE INDICA NINGUN OPERADOR
WHERE deleted = 0  -- Solo acuerdos no eliminados

-- Abre el cursor
OPEN agreement_terms_cursor

-- Recupera el primer registro
FETCH NEXT FROM agreement_terms_cursor INTO @idAgreementTerm, @finalDate, @enable

-- Recorre los registros
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Ejemplo de operación: Deshabilitar el acuerdo si la fecha final ha pasado
    IF @finalDate < GETDATE() AND @enable = 1
    BEGIN
        -- Actualiza el valor de 'enable' a 0 sin necesidad de UPDLOCK adicional pq el cursor lo esta realizando
        UPDATE dbo.caipi_agreementTerms
        SET enable = 0
        WHERE idagreementTerm = @idAgreementTerm
    END

	--PRINT 'Procesado el Agreement ID: ' + CAST(@idAgreementTerm AS VARCHAR) +  ', Final Date: ' + CAST(@finalDate AS VARCHAR) +  ', Enabled: ' + CAST(@enable AS VARCHAR)
	WAITFOR DELAY '00:00:012'
    -- Recupera el siguiente registro
    FETCH NEXT FROM agreement_terms_cursor INTO @idAgreementTerm, @finalDate, @enable
END

-- Cierra y desasocia el cursor
CLOSE agreement_terms_cursor
DEALLOCATE agreement_terms_cursor


```

La siguiente transaccion se ejecuta en otra sesion, y a diferencia de un bloqueo, esta se realiza casi de forma inmediata con un tiempo menor

```sql

DECLARE @agreementId INT
SET @agreementId = 16

UPDATE caipi_agreementTerms
SET finalDate = GETDATE()
WAITFOR DELAY '00:00:01'

```

### Casos en los que se recomienda utilizar un cursor dentro de SOLTURA

En el sistema de Soltura, donde se manejan contratos, paquetes de servicios y beneficios mensuales para los clientes, el uso de cursores en SQL Server puede tener sentido en ciertos casos teniendo en cuenta el asilamiento que ellos generan cuando se le indica y tambien casos cuando no bloqueen, pero es importante saber cuándo conviene realmente usarlos debido a los bloqueos por fila que generan.

- **Renovar beneficios uno por uno dependiendo del historial del usuario :** Por ejemplo, si tengo que revisar cliente por cliente su historial de uso y pagos antes de renovar su contrato, un cursor me permite aplicar lógica condicional específica por cada fila sin afectar a otros usuarios al mismo tiempo.
  
- Se necesita procesar fila por fila y aplicar lógica compleja que no se puede resolver fácilmente con una sola consulta UPDATE o MERGE. Por ejemplo, si Soltura requiere revisar la fecha de vencimiento de cada contrato individualmente y tomar decisiones distintas para cada cliente según varios criterios, un cursor puede ser útil.
  
- **Actualizar servicios activos con lógica extensa :** Si un cliente tiene servicios distintos como gimnasio, spa o dieta, y cada uno tiene reglas diferentes de renovación, el cursor me permite aplicar condiciones específicas para cada caso sin hacer todo en un solo UPDATE genérico.

- Enviar notificaciones personalizadas al vencer contratosSi quiero enviar mensajes distintos dependiendo del tipo de paquete, cliente o historial, puedo recorrer uno a uno los registros y preparar notificaciones personalizadas.

- Si el proceso implica tomar decisiones basadas en valores específicos de cada fila y estas decisiones no se pueden hacer en una sola consulta masiva. Por ejemplo, si cada fila necesita cálculos complejos o múltiples pasos de validación antes de realizar una acción.

- Si el proceso implica varias tablas y es complicado hacerlo en una sola transacción o consulta, el cursor te permite manejar la lógica de manera secuencial y paso a pas

### Casos en los que se NO recomienda utilizar un cursor dentro de SOLTURA

- **Deshabilitar contratos vencidos en masa:** Si todos los contratos con fecha vencida deben ser deshabilitados, se puede hacer con una sola sentencia. Esto como fue demostrado, no es tan util y dismunuye la eficiencia de la transacción. Con ello, este ejemplo es un paso para tomarlo en otros casos de los cuales se pueda simplificar una transaccion sin recorrer uno por uno.

- **Cuando el volumen de datos es muy alto**, no se recomienda porque los cursores consumen muchos recursos y pueden causar bloqueos prolongados que afecten a otras transacciones si no se manejan bien e incluso llegar a deadlocks y por consecuencia transacciones canceladas.

- **Registrar renovaciones automáticas del mes**   Si la lógica de renovación es simple y se aplica igual a todos los contratos activos, no hace falta recorrer uno por uno. Un `UPDATE` masivo es más rápido y eficiente.

- **Asignar beneficios estándar al contratar un nuevo paquete**   Cuando un nuevo cliente contrata un paquete, todos los beneficios asociados se pueden insertar directamente con una sentencia `INSERT INTO ... SELECT`, sin cursor.

- **Descontar saldo mensual a todos los clientes activos**
  	Si todos los clientes activos deben tener un descuento de su saldo por la mensualidad, hacerlo en lote es mucho más eficiente que recorrer cada cliente con un cursor.

- **Cuando el sistema debe escalar o trabajar con muchos datos**  
   En sistemas donde el volumen de datos puede crecer rápidamente, como Soltura, los cursores tienden a volverse lentos y bloquear recursos por más tiempo, lo que afecta el rendimiento general.


## Transaccion de volumen
Defina lo que es la "transacción de volumen" de su base de datos, por ejemplo, en uber la transacción es buscar un driver, en paypal es procesar un pago, en amazon es buscar artículos, y así sucesivamente, es la operación que más solicitudes recibe el sistema, dicho esto:

- Transacción de volumen dentro de la base de datos → En Soltura, la transacción de volumen corresponde al proceso de canjeo de los servicios incluidos en cada plan de suscripción. Esta operación es la más frecuente dentro del sistema, ya que los usuarios pueden realizar canjes de forma diaria y en múltiples ocasiones, lo que genera una alta cantidad de solicitudes concurrentes a la base de datos. Por tanto, este proceso debe estar optimizado para manejar grandes volúmenes de transacciones sin afectar el rendimiento del sistema.

---

El siguiente procedimiento almacenado permite registrar transacciones de redención de servicios ofrecidos a través de los planes del sistema. Valida que el usuario o proveedor tenga derecho a realizar la redención, verificando los límites disponibles según el tipo de acuerdo (por cantidad, monto o validación). Si los criterios se cumplen, inserta la transacción en la base de datos y actualiza el límite correspondiente, garantizando la integridad y trazabilidad mediante una suma de verificación (`checkSum`). Está diseñado para ejecutarse en un entorno transaccional controlado y manejar adecuadamente errores con registros claros.

El nivel de insolacion READ COMMITTED se utiliza para evitar la lectura de datos no confirmados ("dirty reads") durante la transacción. Esto significa que cualquier dato leído durante la ejecución del procedimiento ya ha sido confirmado por otras transacciones, garantizando así que los valores utilizados para verificar límites o condiciones son válidos y estables durante toda la operación. Esto es esencial en este procedimiento, ya que trabaja con condiciones sensibles de límites de redención que, si se leyeran sin confirmar, podrían permitir redenciones incorrectas o inconsistentes.


 ```sql

-----------------------------------------------------------
-- Autor: Carol Araya
-- Fecha: 05/03/2025
-- Descripcion: genera las rendenciones de los servicios ofrecidos por los planes de soltura
	/*
	@numberTag INT- Número identificador del tag o usuario que realiza la redención.
	@redemptionTransactionTypeId INT - Identificador del tipo de transacción de redención (por ejemplo: puntos, efectivo, regalo).
	@idModule INT  - Identificador del módulo o sistema donde ocurre la transacción (app, kiosko, etc.).
	@idSupplierBranch INT - Identificador de la sucursal o proveedor donde se realiza la redención.
	@quantity INT = NULL  - Cantidad de artículos o servicios redimidos. Puede ser NULL si no aplica.
	@amount DECIMAL(5,2) = NULL  - Monto involucrado en la transacción. Puede ser NULL si no aplica.
	@validation BIT = NULL  - Indicador de validación (1 = validado, 0 = no validado). Puede ser NULL si no se requiere validación.

	*/
-----------------------------------------------------------
CREATE OR ALTER PROCEDURE [dbo].[CaipiSP_InsertRedemptionTransaction]
	--PARAMETROS
	@numberTag VARCHAR(100),
    @redemptionTransactionTypeId INT,
    @idModule INT,
    @idSupplierBranch INT,
    @quantity INT = NULL,
    @amount DECIMAL(18,4) = NULL,
    @validation BIT = NULL,
	@agreementTermId INT = NULL,
	@userACanjearId  INT = NULL,
	@idPerson  INT = NULL
AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorNumber INT, @ErrorSeverity INT, @ErrorState INT, @CustomError INT;
    DECLARE @Message VARCHAR(200);
    DECLARE @InicieTransaccion BIT;

    --variables locales para el insert
    DECLARE @idPlan INT, @idRedemptionSubType INT, @idBenefit INT, @idUser INT = NULL;
    DECLARE @idSupplier INT = NULL, @idService INT = NULL, @idRedemption INT = NULL;
    DECLARE @redemptionSubTypeName VARCHAR(50);
    DECLARE @agreementType VARCHAR(50) = NULL, @agreementPerPlan INT;
    DECLARE @checkSum VARBINARY(500), @agreementDescription VARCHAR(100);
    DECLARE @limit VARCHAR(100), @idPlanLimit INT, @unitMeasure INT;

    -- Validación de parámetros
    IF @numberTag IS NULL OR @idModule IS NULL OR @redemptionTransactionTypeId IS NULL
        RETURN 99;

    -- Obtener la información de la redención de una sola consulta con JOIN
    SELECT 
        r.idPlan, r.idRedemptionSubType, r.idBenefit, r.idRedemptions, r.idUser, r.idSupplier,
        rs.name AS redemptionSubTypeName
    INTO #RedemptionData
    FROM caipi_redemptions r
    JOIN caipi_redemptionSubType rs ON r.idRedemptionSubType = rs.idRedemptionSubType
    WHERE r.enable = 1 AND r.numberTag = @numberTag;

    -- Si no se encuentra la redención
    IF NOT EXISTS (SELECT 1 FROM #RedemptionData)
        RETURN 10;

    SELECT 
        @idPlan = idPlan, 
        @idRedemptionSubType = idRedemptionSubType, 
        @idBenefit = idBenefit,
        @idRedemption = idRedemptions, 
        @idUser = idUser, 
        @idSupplier = idSupplier, 
        @redemptionSubTypeName = redemptionSubTypeName
    FROM #RedemptionData;

    -- Obtener el acuerdo solo si es necesario
    IF @redemptionSubTypeName = 'Usuario'
    BEGIN
        SELECT 
            @agreementType = tp.name, 
            @agreementPerPlan = ap.benefitPerPlanId, 
            @agreementDescription = at.description
        FROM caipi_AgreementsPerPlan ap
        JOIN caipi_agreementTerms at ON at.idagreementTerm = ap.idAgreementTerm
        JOIN caipi_AgreementType tp ON tp.idAgreementType = at.idAgreementType
        WHERE ap.idAgreementTerm = @agreementTermId AND ap.idPlans = @idPlan;
    END
    ELSE IF @redemptionSubTypeName IN ('Proveedor', 'Servicio')
    BEGIN
        SELECT 
            @idPlan = subs.idPlan, 
            @agreementType = tp.name, 
            @agreementPerPlan = ap.benefitPerPlanId
        FROM caipi_subscriptions subs
        JOIN caipi_AgreementsPerPlan ap ON subs.idPlan = ap.idPlans
        JOIN caipi_agreementTerms at ON at.idagreementTerm = ap.idAgreementTerm
        JOIN caipi_AgreementType tp ON tp.idAgreementType = at.idAgreementType
        WHERE subs.enable = 1 AND subs.userid = @userACanjearId;
    END

    -- Checksum de la transacción
    SET @checkSum = HASHBYTES('SHA2_256', 
        CONCAT(
            CAST(@idRedemption AS VARCHAR),
            CAST(@idUser AS VARCHAR),
            CAST(@idSupplierBranch AS VARCHAR),
            CAST(@idModule AS VARCHAR),
            CAST(@idPerson AS VARCHAR),
            CAST(@redemptionTransactionTypeId AS VARCHAR),
            CAST(@quantity AS VARCHAR),
            CAST(@amount AS VARCHAR),
            CAST(@validation AS VARCHAR),
            CAST(@agreementTermId AS VARCHAR),
            CONVERT(VARCHAR, GETDATE(), 121)
        )
    );

    -- Si no hay transacción abierta, iniciar una
    SET @InicieTransaccion = 0;
    IF @@TRANCOUNT = 0
    BEGIN
        SET @InicieTransaccion = 1;
        SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
        BEGIN TRANSACTION;        
    END
    
    BEGIN TRY
        -- Verificación de acuerdo
        IF @agreementType IS NULL
            RETURN 2; -- No existe un acuerdo relacionado

        -- Verificar límites disponibles para el canje
        SELECT 
            @idPlanLimit = idPlansLimits, 
            @unitMeasure = idMeasureUnit, 
            @limit = [limit]
        FROM caipi_plansLimits
        WHERE benefitPerPlanId = @agreementPerPlan
          AND idMember = @idUser
          AND [current] = 1
          AND (
              (@agreementType = 'Quantity' AND TRY_CAST([limit] AS INT) >= @quantity)
              OR (@agreementType = 'Amount' AND TRY_CAST([limit] AS DECIMAL(18,4)) >= @amount)
              OR (@agreementType = 'Validation' AND [limit] NOT IN ('False', 'false', '0', 'No', 'no'))
          );

        IF @idPlanLimit IS NOT NULL
        BEGIN
            -- Insertar la transacción de canje
            INSERT INTO [dbo].[caipi_redemptionTransactions]
            ([idRedemption], [idUser], [idSupplierBranch], [checkSum], [creationDate], [idModule], [description], [idPerson],
             [idRedemptionTransactionTypes], [quantity], [amount], [validation], [idAgreementTerm])
            VALUES
            (@idRedemption, @idUser, @idSupplierBranch, @checkSum, GETDATE(), @idModule, 
             'Canjeo de un servicio de ' + @agreementDescription, @idPerson, 
             @redemptionTransactionTypeId, @quantity, @amount, @validation, @agreementTermId);

            -- Actualizar el límite
            IF @agreementType = 'Validation'
                SET @limit = 0;
            ELSE IF @agreementType = 'Quantity'
                SET @limit = ISNULL(CAST(@limit AS INT), 0) - ISNULL(@quantity, 0);
            ELSE IF @agreementType = 'Amount'
                SET @limit = ISNULL(CAST(@limit AS DECIMAL(18,4)), 0.0) - ISNULL(@amount, 0.0);

            -- Insertar el nuevo límite
            INSERT INTO [dbo].[caipi_plansLimits]
            ([limit], [dateUsed], [current], [checkSum], [idPlans], [benefitPerPlanId], [idMeasureUnit], [idMember])
            VALUES
            (@limit, GETDATE(), 1,
             HASHBYTES('SHA2_256', CONCAT(@limit, '|', CONVERT(VARCHAR, GETDATE(), 126), '|', @idPlan, '|', 
                                         @agreementPerPlan, '|', @unitMeasure, '|', @idUser)),
             @idPlan, @agreementPerPlan, @unitMeasure, @idUser);

            -- Actualizar el estado del límite anterior
            UPDATE [dbo].[caipi_plansLimits]
            SET [current] = 0
            WHERE idPlansLimits = @idPlanLimit;
        END
        ELSE
            RETURN 7;

        -- Commit de la transacción si fue iniciada
        IF @InicieTransaccion = 1
            COMMIT;
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SET @ErrorNumber = ERROR_NUMBER();
        SET @ErrorSeverity = ERROR_SEVERITY();
        SET @ErrorState = ERROR_STATE();
        SET @Message = ERROR_MESSAGE();

        IF @InicieTransaccion = 1
            ROLLBACK;

        RAISERROR('%s - Error Number: %i', @ErrorSeverity, @ErrorState, @Message, @CustomError);
    END CATCH;
END;

``` 

Determine cuántas transacciones por segundo máximo es capaz de procesar su base de datos, valide el método con el profesor

# 🧪 Configuración de JMeter para Pruebas de Rendimiento de la API

Este documento explica cómo se configuró Apache JMeter para evaluar el rendimiento de una API Node.js que se conecta a una base de datos SQL Server.

---

## 🎯 Objetivo de la Prueba

Simular múltiples usuarios accediendo simultáneamente al endpoint `/insert-redemption` para evaluar:

- El tiempo de respuesta promedio.
- La capacidad de la base de datos para manejar carga.
- La estabilidad del backend bajo estrés.

---

## ⚙️ Configuración del Test Plan

## 1. Configuración de JMeter:

### 1.1. Crear un Test Plan
1. Abre JMeter y selecciona **File > New** para crear un nuevo plan de prueba.
2. Se creará un **Test Plan** vacío.

### 1.2. Agregar un Thread Group
1. Haz clic derecho sobre el **Test Plan** en el árbol de componentes.
2. Selecciona **Add > Threads (Users) > Thread Group**.
3. Configura los parámetros del **Thread Group**:
   - **Number of Threads (Usuarios):** 60 (o el número de usuarios concurrentes que desees simular).
   - **Ramp-Up Period (Segundos):** 10 (el tiempo para que todos los hilos se inicien).
   - **Loop Count (Repeticiones):** 10 (cada usuario ejecutará la prueba 10 veces).

### 1.3. Agregar un HTTP Request
1. Haz clic derecho sobre el **Thread Group**.
2. Selecciona **Add > Sampler > HTTP Request**.
3. Configura los siguientes parámetros:
   - **Server Name or IP:** `localhost` (o el nombre de tu servidor de API si no es local).
   - **Port Number:** `3000` (el puerto donde corre la API).
   - **Protocol:** `http` (o `https` si tu API usa encriptación).
   - **Method:** `POST`.
   - **Path:** `/insert-redemption` (el endpoint de la API).

### 🧵 Thread Group (Grupo de Hilos)

Se configuró para simular un escenario realista con los siguientes parámetros:

- **Number of Threads (Usuarios simulados):** `60`  
  → Representa la cantidad de usuarios simultáneos haciendo peticiones.

- **Ramp-Up Period (segundos):** `10`  
  → Tiempo en segundos que JMeter tardará en iniciar todos los usuarios. Por ejemplo, 60 hilos en 10 segundos significa que cada segundo se inician 6 hilos.

- **Loop Count (Repeticiones por hilo):** `10`  
  → Cada usuario realizará la prueba 10 veces.

🔁 **Total de solicitudes simuladas**: `60 hilos * 10 repeticiones = 600 solicitudes`

---

### ⏲️ Temporizador: Uniform Random Timer

Para evitar que las solicitudes se disparen de forma simultánea y poco realista, se añadió un **Uniform Random Timer** con los siguientes valores:

- **Delay Offset:** `0 ms`
- **Random Delay Maximum:** `100 ms`

🔄 Esto introduce una variación aleatoria entre cada solicitud, simulando un comportamiento más natural y evitando picos de carga artificiales.

---

## 📈 Listeners Utilizados

### 1. View Results Tree

Permite inspeccionar el resultado de cada solicitud de forma individual. Es útil para:

- Ver el cuerpo de la respuesta.
- Comprobar errores HTTP.
- Medir tiempos de respuesta puntuales.

### 2. Aggregate Report

Proporciona estadísticas globales del test, incluyendo:

- **# Samples**: Cantidad total de peticiones realizadas.
- **Average**: Tiempo promedio de respuesta.
- **Min / Max**: Tiempos mínimos y máximos de respuesta.
- **Error %**: Porcentaje de fallos.
- **Throughput**: Número de peticiones procesadas por segundo.

---

**LISTO**  JMeter comenzará a enviar las solicitudes **POST** al endpoint `/insert-redemption`. 

## ✅ Resultados Esperados

Con esta configuración, se puede:

- Evaluar cómo responde la API bajo carga.
- Identificar posibles cuellos de botella.
- Comparar diferentes versiones del backend.

## 📊 Resultados de la Prueba

Tras ejecutar el test con la configuración descrita, se obtuvieron los siguientes resultados:

- **Throughput (TPS - Transactions per Second):** `59.1 TPS`  
  → Esto indica que el sistema pudo manejar aproximadamente 59 solicitudes por segundo, lo cual es un buen rendimiento para una carga de 60 usuarios concurrentes.

- **Average Response Time (Promedio):** `89 ms`  
  → El tiempo promedio que tardó el servidor en responder a cada solicitud. Un tiempo por debajo de 100 ms indica una respuesta rápida bajo carga.

- **Median Response Time (Mediana):** `34 ms`  
  → El 50% de las solicitudes se resolvieron en menos de 34 ms, lo que muestra que la mayoría de las respuestas fueron muy rápidas.

- **Samples (Muestras Totales):** `600`  
  → Equivale a las 600 solicitudes totales generadas por los 60 usuarios con 10 repeticiones cada uno.

---

## Interpretación

- El sistema mostró **alta capacidad de respuesta** y **estabilidad** con 60 usuarios concurrentes.
- La mediana baja frente al promedio sugiere que unas pocas solicitudes más lentas elevaron el promedio, pero en general, la mayoría fueron muy rápidas.
- Un Throughput de casi 60 TPS es adecuado para aplicaciones de backend que atienden transacciones individuales.

# 📡 API de Inserción de Transacciones de Redención

Este proyecto contiene una API construida con **Node.js** y **Express** que se conecta a una base de datos **SQL Server** para ejecutar un procedimiento almacenado (`dbo.CaipiSP_InsertRedemptionTransaction`).

---

## 🚀 Cómo ejecutar la API con `node index.js`

### 📦 Requisitos previos

Antes de ejecutar la API, se debe tener instalado lo siguiente:

- **Node.js** (versión 14 o superior)
- **npm** (el gestor de paquetes de Node)
- **SQL Server** (en funcionamiento localmente o accesible desde tu equipo)
- El procedimiento almacenado `CaipiSP_InsertRedemptionTransaction` creado en la base de datos `caipiIAdb`

---

### 📁 Archivos importantes

El archivo principal del servidor es:

```
index.js
```

---

### 📥 Instalación de dependencias

Desde la carpeta del proyecto, ejecuta en la terminal:

```
npm install express mssql
```

Esto instalará las dependencias necesarias para ejecutar el servidor.

---

### ⚙️ Configuración de la conexión a la base de datos

Abre `index.js` y verifica que la sección de configuración de la base de datos tenga tus credenciales reales:

```js
const config = {
  user: 'UsuarioSQL',
  password: 'password2410',
  server: 'localhost',
  database: 'caipiIAdb',
  options: {
    encrypt: true,
    trustServerCertificate: true
  }
};
```

Reemplace `UsuarioSQL`, `password2410` y otros valores según su configuracion de servidore en la base de datos.

---

### ▶️ Ejecutar la API

Para iniciar el servidor, ejecute el siguiente comando:

```
node index.js
```

Si todo está correctamente configurado, debería ver en la terminal:

```
Servidor corriendo en http://localhost:3000
```

---

### 📬 ¿Qué hace esta API?

Esta API expone un endpoint `POST` en:

```
http://localhost:3000/insert-redemption
```

Al hacer una solicitud a este endpoint:

1. Se conecta a la base de datos `caipiIAdb`.
2. Ejecuta el procedimiento almacenado `CaipiSP_InsertRedemptionTransaction` con valores de prueba.
3. Devuelve una respuesta en formato JSON con los datos resultantes.

---
```js
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
```

## 🧪 Pruebas de rendimiento con JMeter


#### Monitoreo del CPU durante la prueba de ejecución

![WhatsApp Image 2025-05-05 at 12 09 04_f5574b54](https://github.com/user-attachments/assets/9b351a55-1b5b-490d-8882-8b08f47427eb)


#### Resultados del listener al ejecutar la prueba

![WhatsApp Image 2025-05-05 at 12 33 09_c097ccb5](https://github.com/user-attachments/assets/3eb92172-9c7b-44d1-8640-3213444c79c5)


# Migracion de los usuarios de Payment Assistant
Previo a la semana santa, la empresa Soltura estuvo en conversaciones con los dueños e inversionistas de varias empresas ya establecidas en el país, entre ellas "payment assistant" y "app assistant" (como grupo de trabajo escogen solo una del entregable del caso #1), esas empresas ya han logrado cierta tracción y público en Costa Rica y han decidido que dichas aplicaciones podrían ser dadas como parte de los planes de subscripción de Soltura.

En lugar de negociar con los dueños para verlos como proveedores, quieren usarlas para aumentar su cartera de usuarios, haciendo que por el mismo precio que ya pagan por el servicio, obtengan un plan que obtengan mínimo lo mismo y dos servicios más adicionales. Esto para el periodo de adquisición y dejar que los mismos usuarios posteriormente se muevan a otros planes.

Esto ha hecho que ustedes como equipo de tecnología les toque realizar una migración de los datos importantes de la base de datos del sistema adquirido, a la base de datos del sistema de soltura. No se pretende copiar las tablas, si no más bien migrar los usuarios y sus subscripciones del sistema adquirido, de tal forma que esos usuarios y sus planes ahora sean parte de los usuarios y planes de soltura. Para esta migración se sabe lo siguiente con respecto al sistema adquirido (payment assistant, app assistant):

- Existen poco más de 1000 usuarios activos

- El 70% de los usuarios tienen un plan activo que se paga mensualmente y el resto un plan pagado anual.

- Hay 2 planes activos en el sistema.

- Las fechas de pago de los planes y los montos se deben conversar al momento de hacer la migración de datos.

- Los usuarios consumidores deben conversar sus permisos en el app.

- Se debe crear algún tipo de mecanismo o tabla que haga correspondencia entre los usuarios del sistema adquirido y los usuarios en Soltura, de tal forma que para las rutinas en Soltura sea transparente el tipo de usuario .

- Todos los usuarios migrados van a tener un nuevo usuario en Soltura con su email respectivo y sus datos respectivos de perfil de usuario, pero al hacer login deben estar forzados a ingresar un nuevo password pues no puede ser migrado el password del sistema anterior.

- Soltura va crear una imagen en el home page y un banner publicitario indicando que dicho sistema (payment assistant o app assistant) ahora es Soltura, la fecha a partir de cuando se hace la migración y un link hacia la guía de pasos que deben seguir los usuarios ese día (este link no existe solo se pone). No hay que hacer los banner ni nada, solo el ingreso de los datos en los collections respectivos.

#### Migrado de la base de Datos

 <details>
   <summary>Haz clic para expandir</summary>
Para poder realizar la migración de datos se ha decidido implementar la base de datos utilizada para la aplicacion de Payment Assistant

```py
#Librerias
import pymysql
import pandas as pd
from sqlalchemy import create_engine
from sqlalchemy import text
import pyodbc
from urllib.parse import quote_plus

#para datos 
import random
from datetime import datetime

#Conexion a la bd MYSQL (Payment Assistant)
conex_mysql = create_engine("mysql+pymysql://root:123456@127.0.0.1:3306/paymentdb")

#Conexion a la bd SQL Server (caipiIA)
#conex_sql = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};''SERVER=localhost;''DATABASE=Clinica;''Trusted_Connection=yes;')

# Set up SQLAlchemy engine for SQL Server connection    
conex = quote_plus(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=localhost;"
    "DATABASE=caipiIAdb;"
    "Trusted_Connection=yes;")

engine_sql = create_engine("mssql+pyodbc:///?odbc_connect=" + conex)

#Lee los datos de MySQL
df = pd.read_sql("SELECT userId, firstName, lastName, birthdate,username FROM payment_users where enabled = 1 and migrado = 0", conex_mysql)


#Adaptar el dataframe de mysql al de sql server y definir datos por default

df['password'] = df['firstName'] +'10ncaklfan!'+ df['lastName']

df['name'] = df['firstName']
df['lastname'] = df['lastName']
df['username'] = df['username']
df['password'] = df['password'] .apply(lambda x: x.encode('utf-8'))
df['birth'] = df['birthdate']
df['active'] = 1
df['deleted'] = 0
df['last_update'] = datetime.now()
df['role'] = df.apply(lambda x: random.randint(1, 3), axis=1)
df['registerdate'] = datetime.now()
df['profile_url'] = 'https://example.com/users/'+ df['firstName'] + df['lastName']
df['img_profile_url'] = 'https://example.com/images/'+ df['firstName'] + df['lastName'] + '.jpg'
df['migrado'] = 1


usuarios = df[['username', 'name', 'lastname', 'birth','password', 'deleted', 'active', 'last_update', 'registerdate', 'profile_url','img_profile_url', 'migrado']]

try:
    #Inserta los datos de MySQL a SQL SERVER
    usuarios.to_sql('caipi_users', engine_sql, if_exists='append', index=False)
except Exception as e:
    print(f"Ocurrió un error al insertar los datos: {e}")



#Actualiza el campo 'migrado' a 1 para cada usuario en la tabla
with conex_mysql.begin() as connection:
    for index, row in df.iterrows():
        user_id = row['userId']
        try:
            update_query = text("UPDATE payment_users SET migrado = 1 WHERE userId = :user_id")
            result = connection.execute(update_query, {"user_id": user_id})
        except Exception as e:
            print(f"Error con userId {user_id}: {e}")

#------------------------INFORMACION DE CONTACTO DE USUARIOS-----------------

#Recorre cada fila de 'df' (usuarios)
for index, row in df.iterrows():
    user_id = row['userId']
    username = row['username']
    # Realiza la consulta de contactos de cada usuario con el parametro de posición %s
    query = """
        SELECT value, FK_contactInfoTypesId 
        FROM payment_contactsUserInfo 
        WHERE enabled = 1 AND FK_userId = %s
    """
    
    #Pasa por parametro el id del usuario que se esta buscando
    contactosUsuario = pd.read_sql(query, conex_mysql, params=(user_id,))

    query = """
        SELECT userId
        FROM caipi_users 
        WHERE username = ?
    """

    IdusuarioSoltura = pd.read_sql(query, engine_sql, params=(username,))
    
    #recorro los contactos de cada usuario para pasar todos lo que tenga activos
    for index, row in contactosUsuario.iterrows():

        #obtengo el id del tipo contacto del usuario esto para que no sea estatico
        tipoContactoPAsisstant = pd.read_sql(
            "SELECT name FROM payment_contactInfoTypes WHERE contactInfoTypeId = %s",
            con=conex_mysql,
            params=(row['FK_contactInfoTypesId'],)
        )

        idTipoContactSol= pd.read_sql(
            "SELECT conatctInfoTypeId FROM caipi_contactInfoType WHERE name = ?",
            con=engine_sql,
            params=(tipoContactoPAsisstant['name'].iloc[0],)
        )
        #Adaptar el dataframe de mysql al de sql server y definir datos por default
        row['enable'] = 1
        row['value'] = row['value']
        row['lastUpdate'] = datetime.now()
        row['userid'] = user_id
        row['contactInfoTypeId'] = idTipoContactSol['conatctInfoTypeId'].iloc[0]

        try:
            contacto = pd.DataFrame([row[['enable', 'lastUpdate', 'value', 'userid', 'contactInfoTypeId']]])
            #Inserta los datos de MySQL a SQL SERVER
            contacto.to_sql('caipi_contactInfoPerUsers', engine_sql, if_exists='append', index=False)
        except Exception as e:
            print(f"Ocurrió un error al insertar los datos: {e}")

#--------------------------------------MIGRADO DE PLANES POR USUARIO---------------------------

#Leer usuarios desde MySQL habilitados
df_users_mysql = pd.read_sql("SELECT userId, firstName, lastName, username FROM payment_users WHERE enabled = 1", conex_mysql)

#Leer id usuarios para poder insertar el id real de sql server
df_users_sql = pd.read_sql("SELECT userid AS userId_sql, username FROM caipi_users", engine_sql)

#Leer los planes de MySQL
df_plans = pd.read_sql("""SELECT planPerUserId, adquisitionDate, enabled, FK_planPriceId, FK_userId, FK_scheduleId 
    FROM payment_plansPerUser""", conex_mysql)

#Leer los datos de suscripciones para verificar y evitar repeticions
df_subs = pd.read_sql("""SELECT userid, idPlan, scheduleId FROM caipi_subscriptions""", engine_sql)



#los users se normalizan a lower case para evitar diferencia 
df_users_mysql['username'] = df_users_mysql['username'].str.lower()
df_users_sql['username'] = df_users_sql['username'].str.lower()

#Se crea un mapeo entre usuarios de mysql y sqlServer para poder saber su id real basado en el username
df_user_map = pd.merge(df_users_mysql, df_users_sql, on='username', how='inner')

#Se utiliza el nuevo userId que ahora corresponde a SQL server para asociarlo a la suscription 
df_plans = pd.merge(df_plans, df_user_map[['userId', 'userId_sql']], left_on='FK_userId', right_on='userId', how='inner')

#Eviatr planes repetidos en suscriptions
df_plans = pd.merge(df_plans,df_subs,left_on=['userId_sql', 'FK_planPriceId', 'FK_scheduleId'],
    right_on=['userid', 'idPlan', 'scheduleId'],how='left',indicator=True)

#Seleccionamos solo los planes que no han sido insertados en suscriptions 
df_plans = df_plans[df_plans['_merge'] == 'left_only']

#Se adapta el dataFrame de suscriptions segun los datos de mysql
df_subs = pd.DataFrame()
df_subs['suscription_typeid'] = df_plans['FK_scheduleId'].apply(lambda x: 1 if x == 1 else 2)
df_subs['userid'] = df_plans['userId_sql']
df_subs['social'] = [random.randint(0, 1) for _ in range(len(df_subs))]
df_subs['enable'] = 1
df_subs['startdate'] = datetime.now()
df_subs['deleted'] = 0
df_subs['statusid'] = 1  
df_subs['scheduleId'] = df_plans['FK_scheduleId'].apply(lambda x: 2 if x == 1 else 3)
df_subs['auto_renew'] = 1
df_subs['created_at'] = datetime.now()
df_subs['idPlan'] = df_plans['FK_scheduleId'].apply(lambda x: 18 if x == 1 else 19) #Depende del id del plan que se establezca para soltura

#Se realiza la insercion de datos a la tabla suscription s
df_subs.to_sql('caipi_subscriptions', engine_sql, if_exists='append', index=False)

```
</details>


#### Banner Publicitario

 <details>
   <summary>Haz clic para expandir</summary>

Soltura anuncia que los servicios pertenecientes al sistema de Payment Assistant ahora les pertenece, para esto se realica un banner publicitario dentro del modelo no relacional de mercadeo en el cual se incorpora una imagen que especifica la descripcion de esta noticia, y un link con los pasos a seguir para los clientes

```json
{
        "media_id": "004",
        "tipo": "imagen",
        "titulo": "Soltura ahora se hace uno con Payment Assistant, la app #1 para tus pagos recurrentes",
        "descripcion": "A partir del 1 de Mayo del 2025 podrás acceder a todos los beneficios que Payment Assistant tiene para ti. Visista el link para saber como puedes acceder a ella",
        "url_masInfo": "https://soltura.cr/informacion/appAssis",
        "imagenURL": "https://soltura.cr/media/appAssistant.jpg",
        "formato": "jpg",
        "resolucion": "2470x3510 px",
        "dimensiones": {
          "ancho": 1080,
          "alto": 1080
        },
        "etiquetas": ["pagos ", "beneficios"],
        "fecha_publicacion": "2025-05-01T12:00:00Z",
        "estadisticas": {
            "vistas": 5200,
            "comentarios": 40
        },
        "estado": "activo"
      }
```
</details>

> [!NOTE]
> Este fragmento de código corresponde a la estructura no relacional de Mongo utilizada para abordar los aspectos de mercadeo.

