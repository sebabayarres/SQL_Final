### Entrega 1

## Descripción de la temática de la base de datos

**Introducción**

El objetivo de este proyecto es desarrollar una base de datos para la gestión de la información relacionada con la venta de rifas, organizadas anualmente por estudiantes de Ciencias Económicas en Uruguay. Esta base de datos será utilizada exclusivamente por un vendedor, quien tendrá la responsabilidad de registrar y organizar los datos de los compradores, los sorteos realizados y los premios correspondientes. El propósito es optimizar el proceso de recolección, almacenamiento y consulta de información, garantizando la eficiencia y precisión en la administración de las rifas.

**Objetivo**

El objetivo del proyecto es crear una base de datos para que el vendedor registre, organice y consulte eficientemente la información de compradores, sorteos y premios. La base debe permitir seguimiento detallado de ventas y gestionar resultados de sorteos en tiempo real, reduciendo errores y mejorando la transparencia.

**Situación Problemática**

Actualmente, la gestión de la venta de rifas se realiza manualmente, lo cual puede ocasionar inconvenientes como la pérdida de información, errores en el registro de los datos de los compradores y dificultades para llevar un seguimiento adecuado de los sorteos y premios. La implementación de una base de datos solucionará estas problemáticas al permitir un registro centralizado y ordenado de la información, eliminando los errores humanos y mejorando la eficiencia en la gestión de los datos por parte del vendedor.

**Modelos de Negocio**

La base de datos será utilizada por un vendedor que gestionará la venta de rifas para financiar el viaje de estudiantes de Ciencias Económicas. El vendedor registrará los datos de los compradores, los sorteos y los premios. Este sistema permitirá un control eficiente de las rifas vendidas, los resultados y los premios. La implementación simplificará el trabajo del vendedor, mejorando la precisión y agilidad en la gestión.

## Diagrama Entidad Relación

![Diagrama ER](Diagrama%20Entidad%20Relacion.png)


## Listado de Tablas en la Base de Datos:

- **Tabla “compradores”.**

En esta tabla se registran los datos de todos los compradores. La misma cuenta con los siguientes campos:

- **id_comprador**
- **nombre**
- **apellido**
- **email**
- **documento**
- **domicilio**
- **teléfono**

Se estableció el id_comprador como principal identificador de la tabla, por lo que se lo asigno como PRIMARY KEY. Adicionalmente se le agrego AUTO_INCREMENT para que la tabla complete automáticamente el valor al ingresar los distintos datos. Esta en formato INT dado que será un numero entero.

Los demás campos se definen como VARCHAR ya que almacenan cadenas de texto de longitud variable. Todos se establecen como NOT NULL debido a que la institución requiere obligatoriamente cada uno de estos datos. Además, los campos email, documento y teléfono se definen como UNIQUE, ya que cada comprador debe tener información única en estos campos.

- **Tabla “rifas”**

En esta tabla se registran todos los números de rifa que tiene el estudiante para vender, los cuales no son correlativos, por lo que se le agrega un identificador autoincremental al igual que en el caso de la tabla “compradores”. Los campos son:

- **id_rifa**
- **numero**

Se ha establecido la condición UNIQUE en el campo “numero” ya que cada rifa tiene un numero único que no puede repetirse en otras rifas.

- **Tabla “premios”**

En esta tabla se registran todos los premios, se los identifica con un identificador autoincremental al igual que en las tablas anteriores. Los campos son:

- **id_premio**
- **descripción_premio**

Se ha establecido la condición NOT NULL en el campo “descripción_premio” dado que el mismo es necesario para identificar el premio.

- **Tabla “sorteos”**

En esta tabla se registran todos los sorteos, se los identifica con un identificador autoincremental al igual que en las tablas anteriores. Los campos son:

- **id_sorteo**
- **id_premio**
- **resultado**

El campo id_premio hace referencia a la tabla “premios” mediante un FOREIGN KEY. El campo resultado hace referencia al campo “numero” de la tabla “rifas”, ya que el resultado del sorteo es un número de rifa que resulta ganador.

- **Tabla “ventas”**

En esta tabla se registran todos los sorteos, se los identifica con un identificador autoincremental al igual que en las tablas anteriores. Cada venta asocia un comprador con una rifa. Los campos son:

- **id_comprador**
- **id_rifa**
- **tipo_de_venta**
- **forma_de_pago**

El campo id_comprador hace referencia a la tabla “compradores” mediante un FOREIGN KEY. El campo id_rifa hace referencia a la tabla “rifas”.

Adicionalmente se crean los campos de tipo_de_venta y forma_de_pago, con formato VARCHAR ya que pueden tener caracteres variables y con la condición NOT NULL ya que es obligatorio informar estos datos.

A continuación se adjunta el script: [Script.sql](Script.sql)


### Entrega 2

## Correcciones de entrega anterior

Durante el desarrollo de esta segunda entrega se ha detectado que algunos campos definidos en la entrega anterior no eran compatibles con las funciones que debían cumplir, por lo que fueron corregidos según se detalla a continuación.

**Tabla “Ventas”.**

En la primera entrega, se definió "id_comprador" como PRIMARY KEY en la tabla ventas, lo que impide repeticiones. Esto es incorrecto, ya que un comprador puede aparecer varias veces al comprar múltiples rifas.

El campo que no debería repetirse es el de “id_rifa”, ya que cada rifa puede ser vendida a una sola persona. Por tanto, se ha corregido el script para crear la tabla estableciendo el campo “id_rifa” como PRIMARY KEY.

Ver script adjunto: [Cambio de Primary Key en Tabla Ventas.sql](https://github.com/sebabayarres/SQL/blob/main/Scripts%20Segunda%20Entrega/Correcciones/Cambio%20de%20Primary%20Key%20en%20Tabla%20Ventas.sql)


**Tabla “Sorteos”.**

En la primera entrega se definió el “id_sorteo” como auto incremental y PRIMARY KEY. Esto es incorrecto, ya que en cada sorteo hay varios premios, por lo que el “id_sorteo” debe repetirse. Por tanto, se ha corregido el script para crear la tabla sin estas condiciones.

Ver script adjunto: [Cambio de Tabla Sorteos.sql](https://github.com/sebabayarres/SQL/blob/main/Scripts%20Segunda%20Entrega/Correcciones/Cambio%20de%20Tabla%20Sorteos.sql)

## Importación de datos

Se ha agregado un dato de manera manual a modo de ejemplo. Ver script adjunto: [Ingreso de Datos.sql](https://github.com/sebabayarres/SQL/blob/main/Scripts%20Segunda%20Entrega/Dato%20Manual/Ingreso%20de%20Datos.sql)

El resto de los datos se ha importado mediante archivo CSV. Se adjuntan capturas de pantalla y archivos utilizados para la importación: [Importación de Datos](https://github.com/sebabayarres/SQL/tree/main/Importación%20de%20Datos)

## Listado de Vistas

**Vista “resultados”**

El propósito de esta vista es resumir los resultados de los sorteos y facilitar el acceso a dicha información. Se presenta, para cada sorteo, el número de rifa ganador, así como el nombre y apellido del ganador, garantizando que no se divulguen datos sensibles, protegiendo así la privacidad de los participantes.

En la vista se expone:

- **id_sorteo** de la tabla sorteos
- **id_premio** de la tabla sorteos
- **numero** de la tabla rifas
- **nombre** de la tabla compradores
- **apellido** de la tabla compradores

Ver script adjunto: [Vista Resultados con Nombres.sql](https://github.com/sebabayarres/SQL/blob/main/Scripts%20Segunda%20Entrega/Vistas/Vista%20Resultados%20con%20Nombres.sql)

**Vista “rifa_por_comprador”**

El propósito de esta vista es mostrar un listado de todas las rifas con los nombres y apellidos de sus respectivos compradores. Esto facilita identificar rápidamente el comprador de cada rifa y cuáles aún están disponibles, sin revelar datos sensibles de los compradores.

En la vista se expone:

- **numero** de la tabla rifas
- **nombre** de la tabla compradores
- **apellido** de la tabla compradores

Ver script adjunto: [Vista Rifa por Comprador.sql](https://github.com/sebabayarres/SQL/blob/main/Scripts%20Segunda%20Entrega/Vistas/Vista%20Rifa%20por%20Comprador.sql)

## Listado de Funciones

**Función “contar_rifas_vendidas”.**

La función tiene como objetivo devolver el número de rifas vendidas de manera sencilla para el usuario. Dado que cada rifa puede ser vendida solo una vez, la función cuenta el total de ventas para determinar la cantidad de rifas vendidas.

La función lee información desde la tabla de ventas.

Ver script adjunto: [Funcion Contar Rifas.sql](https://github.com/sebabayarres/SQL/blob/main/Scripts%20Segunda%20Entrega/Funciones/Funcion%20Contar%20Rifas.sql)

## Listado de Stored Procedures

**Stored Procedure “obtener_ventas_por_forma_de_pago”**

El procedimiento facilita el acceso rápido a los datos clave de las ventas realizadas con una forma de pago específica. Esto permite identificar las rifas pagadas con crédito y realizar un seguimiento del pago de las cuotas.

El procedimiento arroja los siguientes datos:

- **id_comprador** de la tabla ventas
- **id_rifa** de la tabla ventas
- **forma_de_pago** de la tabla ventas
- **nombre** de la tabla compradores
- **apellido** de la tabla compradores

Ver script adjunto: [Stored Procedure Tipo de Pago.sql](https://github.com/sebabayarres/SQL/blob/main/Scripts%20Segunda%20Entrega/Stored%20Procedures/Stored%20Procedure%20por%20Tipo%20de%20Pago.sql)

**Stored Procedure “obtener_ventas_por_tipo”**

El procedimiento optimiza el acceso a los datos clave de las ventas efectuadas en una modalidad específica. Este enfoque permite identificar las transacciones realizadas de manera online, facilitando la coordinación de la entrega posterior de la rifa impresa.

El procedimiento arroja los siguientes datos:

- **id_comprador** de la tabla ventas
- **id_rifa** de la tabla ventas
- **nombre** de la tabla compradores
- **apellido** de la tabla compradores
- **tipo_de_venta** de la tabla ventas

Ver script adjunto: [Stored Procedure Tipo de Venta.sql](https://github.com/sebabayarres/SQL/blob/main/Scripts%20Segunda%20Entrega/Stored%20Procedures/Stored%20Procedure%20Tipo%20de%20Venta.sql)

## Listado de Triggers

**Trigger sobre la tabla “ventas”**

Se ha creado una tabla de auditoría que registra los cambios de INSERT, UPDATE y DELETE en la tabla ventas, permitiendo controlar movimientos y detectar inconsistencias.

Esto se ha realizado mediante un trigger que registra todas las nuevas adiciones, todos los cambios y todas las eliminaciones de la tabla.

Ver script adjunto: [Trigger Venta.sql](https://github.com/sebabayarres/SQL/blob/main/Scripts%20Segunda%20Entrega/Triggers/Trigger%20Venta.sql)
