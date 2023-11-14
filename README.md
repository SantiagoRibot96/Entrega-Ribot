# Tienda TodoParrillas
Este es un proyecto de un ecommerce realizado por Santiago Ribot para el curso de React de Coderhouse. La aplicacion permite ver productos alojados en un base de datos, interactuar con ellos y finalizar una compra dejando los datos del cliente en una base de datos.

## Tecnologias utilizadas
Se utilizo:
- Vite
- React
- React router
- Firebase
- Bootstrap

## Funcionalidades
- Ver los productos y su stock
- Agregar productos a un carrito de compras
- Ver y modificar el carrito de compras
- Realizar un pedido
- Obtener el id del pedido

## Instalacion

### Para instalar y ejecutar la aplicacion en tu maquina local sigue los siguientes pasos:

1. Clona el repositorio en tu maquina local.
2. Abre una terminal en el directorio del proyecto.
3. Ejecuta el comando 'npm install' para instalar las dependencias.
4. Ejecuta el comando 'npm run dev' para iniciar la aplicacion.
5. Desde el navegador accede a 'http://localhost:5173/' para ver la aplicacion en accion.

## Configuracion de Firebase

### Para utilizar Firebase en esta aplicacion, debes seguir los siguientes pasos:

1. Crea una cuenta en Firebase y crea un nuevo proyecto.
2. En la seccion "Authentication" de Firebase, habilita el proveedor de 
3. Autenticacion de correo electronico y contraseña.
4. En la seccion de "Firestore" de Firebase, crea una nueva base de datos y configura las reglase de seguridad para permitir lectura/escritura solamente a usuarios autenticados.
5. En la seccion "Project settings" de Firebase, haz clic en "Add app" y sigue las instrucciones para agregar una nueva aplicacion web.
6. Copia las credenciales de Firebase y configura las variables de entorno en el archivo .env de tu proyecto.

## Licencia
Este proyecto esta licenciado bajo la licencia MIT. Consulta el achivo LICENSE para obtener mas informacion.