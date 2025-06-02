# Entrega Final - Sebastián Bayarres

## Índice
- [Descripción de la temática de la base de datos](#Descripción-de-la-temática-de-la-base-de-datos)
- [Objetos de mantenimiento](#objetos-de-mantenimiento)
- [Diagrama Entidad Relación](#diagrama-entidad-relación)
- [Listado de Tablas en la Base de Datos](#listado-de-tablas-en-la-base-de-datos)
- [Listado de Vistas](#listado-de-vistas)
- [Listado de Funciones](#listado-de-funciones)
- [Listado de Stored Procedures](#listado-de-stored-procedures)
- [Listado de Triggers](#listado-de-triggers)
- [Importación de datos](#importación-de-datos)

## Descripción de la temática de la base de datos

**Introducción**

El objetivo de este proyecto es desarrollar una base de datos para la gestión de la información relacionada con la venta de rifas, organizadas anualmente por estudiantes de Ciencias Económicas en Uruguay. Esta base de datos será utilizada exclusivamente por un vendedor, quien tendrá la responsabilidad de registrar y organizar los datos de los compradores, los sorteos realizados y los premios correspondientes. El propósito es optimizar el proceso de recolección, almacenamiento y consulta de información, garantizando la eficiencia y precisión en la administración de las rifas.

**Objetivo**

El objetivo del proyecto es crear una base de datos para que el vendedor registre, organice y consulte eficientemente la información de compradores, sorteos y premios. La base debe permitir seguimiento detallado de ventas y gestionar resultados de sorteos en tiempo real, reduciendo errores y mejorando la transparencia.

**Situación Problemática**

Actualmente, la gestión de la venta de rifas se realiza manualmente, lo cual puede ocasionar inconvenientes como la pérdida de información, errores en el registro de los datos de los compradores y dificultades para llevar un seguimiento adecuado de los sorteos y premios. La implementación de una base de datos solucionará estas problemáticas al permitir un registro centralizado y ordenado de la información, eliminando los errores humanos y mejorando la eficiencia en la gestión de los datos por parte del vendedor.

**Modelos de Negocio**

La base de datos será utilizada por un vendedor que gestionará la venta de rifas para financiar el viaje de estudiantes de Ciencias Económicas. El vendedor registrará los datos de los compradores, los sorteos y los premios. Este sistema permitirá un control eficiente de las rifas vendidas, los resultados y los premios. La implementación simplificará el trabajo del vendedor, mejorando la precisión y agilidad en la gestión.

## Objetos de mantenimiento

**Usuarios**

Con el fin de llevar a cabo el mantenimiento de la base de datos, se han creado distintos usuarios:
- Un usuario con permisos únicamente de lectura
- Un usuario con permisos de lectura y escritura
- Un usuario con todos los permisos

  Se adjunta script de creación de usuarios: [Creación de Usuarios.sql](https://github.com/sebabayarres/SQL_Final/blob/main/Scripts/Creación%20de%20Usuarios.sql)

**Backup**

Se ha creado un backup en terminal con el siguiente código: 

mysqldump -u root -p RIFAS > rifas_backup.sql

En caso de querer restaurar el mismo deberíamos usar el siguiente código:

mysql -u root -p RIFAS < rifas_backup.sql

Se adjunta el archivo de backup: [rifas_backup.sql](https://github.com/sebabayarres/SQL_Final/blob/main/Scripts/rifas_backup.sql)


## Diagrama Entidad Relación

![Diagrama Entidad Relación](https://github.com/sebabayarres/SQL_Final/blob/c107abae7e158e00ddb09c11fd1cb37041fd949f/Diagrama%20Entidad%20Relaci%C3%B3n/Diagrama%20Entidad%20Relacio%CC%81n.jpg)

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
- **id_forma_contacto**
- **id_ubicacion**

Se estableció el id_comprador como principal identificador de la tabla, por lo que se lo asigno como PRIMARY KEY. Adicionalmente se le agregó AUTO_INCREMENT para que la tabla complete automáticamente el valor al ingresar los distintos datos. Esta en formato INT dado que será un número entero.

Los demás campos se definen como VARCHAR ya que almacenan cadenas de texto de longitud variable. Todos se establecen como NOT NULL debido a que la institución requiere obligatoriamente cada uno de estos datos. Además, los campos email, documento y teléfono se definen como UNIQUE, ya que cada comprador debe tener información única en estos campos.

El campo "id_forma_contacto" hace referencia a la tabla "formas_de_contacto" a través de un FOREIGN KEY.
El campo "id_ubicacion" hace referencia a la tabla "ubicaciones_ventas" a través de un FOREIGN KEY.

- **Tabla “rifas”**

En esta tabla se registran todos los números de rifa que tiene el estudiante para vender, los cuales no son correlativos, por lo que se le agrega un identificador autoincremental al igual que en el caso de la tabla “compradores”. Los campos son:

- **id_rifa**
- **numero**

Se ha establecido la condición UNIQUE en el campo “numero” ya que cada rifa tiene un número único que no puede repetirse en otras rifas.

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

El campo id_premio hace referencia a la tabla “premios” mediante un FOREIGN KEY. El campo resultado hace referencia al campo “id_rifa” de la tabla “rifas”, ya que el resultado del sorteo es un número de rifa que resulta ganador.

Se ha definido un PRIMARY KEY entre el campo id_sorteo y el campo id_premio.

- **Tabla “ventas”**

En esta tabla se registran todos los sorteos, se los identifica con un identificador autoincremental al igual que en las tablas anteriores. Cada venta asocia un comprador con una rifa. Los campos son:

- **id_comprador**
- **id_rifa**
- **tipo_de_venta**
- **forma_de_pago**

Los campos de esta tabla hacen referencia a campos en otras tablas mediante un FOREIGN KEY:
- El campo id_comprador hace referencia a la tabla “compradores”.
- El campo id_rifa hace referencia a la tabla “rifas”.
- El campo tipo_de_venta hace referencia a la tabla "tipos_de_ventas".
- El campo forma_de_pago hace referencia a la tabla "formas_pago".


- **Tabla “detalle_de_premios”.**

En esta tabla se profundiza sobre los ítems que conforman los premios. Los campos que componen esta tabla son:

- **id_detalle**
- **id_premio**
- **detalle**

Se estableció el “id_detalle” como principal identificador de la tabla, por lo que se lo asigno como PRIMARY KEY. Adicionalmente se le agregó AUTO_INCREMENT para que la tabla complete automáticamente el valor al ingresar los distintos datos. Esta en formato INT dado que será un número entero.

El campo “id_premio” hace referencia a la tabla premios mediante un FOREIGN KEY.

- **Tabla “formas_de_contacto”**

En esta tabla se ingresan las distintas formas de contacto que pueden tener las ventas. Los campos son.

- **id_forma_contacto**
- **descripción**

Donde id_forma_contacto es el PRIMARY KEY que será utilizado en la tabla “ventas” para identificar la forma de contacto de cada venta.

- **Tabla “entrega_rifas”**

Esta tabla contiene datos sobre la entrega física de las rifas. Aquellas rifas que fueron entregadas aparecen con la fecha de entrega, aquellas que aún no han sido entregadas aparecen con el dato NULL.

Los campos de la tabla son:

- **id_entrega**
- **id_rifa**
- **numero**
- **fecha_entrega**

Se definió id_entrega como PRIMARY KEY.

Los campos id_rifa y numero hacen referencia a la tabla rifas mediante un FOREIGN KEY.

- **Tabla “auditoria_entregas”**

Esta tabla fue creada para documentar cambios en la tabla de entregas mediante un Trigger.

Los campos de la tabla son:

- **id_auditoria_entregas**
- **id_entrega**
- **operación**
- **fecha**

Se definió id_auditoria_entregas como PRIMARY KEY.

El campo id_entrega hace referencia a la tabla “entrega_rifas” mediante un FOREIGN KEY.

- **Tabla “auditoria_compradores”**

Esta tabla fue creada para documentar cambios en la tabla de compradores mediante un Trigger.

Los campos de la tabla son:

- **id_auditoria_compradores**
- **id_comprador**
- **operación**
- **campo_modificado**
- **valor_anterior**
- **valor_nuevo**
- **fecha**

Se definió id_auditoria_compradores como PRIMARY KEY.

El campo id_comprador hace referencia a la tabla “compradores” mediante un FOREIGN KEY.

- **Tabla “auditoria_ventas”**

Esta tabla fue creada para documentar cambios en la tabla de ventas mediante un Trigger.

Los campos de la tabla son:

- **id_auditoria_ventas**
- **operación**
- **id_comprador**
- **id_rifa**
- **fecha**

Se definió id_auditoria_ventas como PRIMARY KEY.

El campo "id_comprador" hace referencia a la tabla compradores.
El campo "id_rifa" hace referencia a la tabla rifas.

- **Tabla “fechas_sorteos”**

Esta tabla contiene las fechas de cada sorteo.

Los campos son:

- **id_sorteo**
- **id_premio**
- **fecha_sorteo**

Se ha definido un PRIMARY KEY entre el campo id_sorteo y el campo id_premio.

A su vez, este PRIMARY KEY hace referencia al PRIMARY KEY de la tabla sorteos.

- **Tabla “ubicaciones_venta”**

En esta tabla se registran las locaciones donde fueron realizadas las ventas. Los campos son:

- **id_ubicacion**
- **descripción**

Se ha definido un PRIMARY KEY en el campo id_ubicacion, el que será utilizado en la tabla “ventas” para identificar la ubicación de cada venta.


- **Tabla “formas_pago”**

En esta tabla se registran las distintas formas de pago que luego son utilizadas en la tabla “ventas”.

Los campos son:

- **id_forma_pago**
- **descripción**

Se ha definido el id_forma_pago como PRIMARY KEY.

- **Tabla “tipos_de_ventas”**

En esta tabla se registran los distintos tipos de ventas que luego son utilizadas en la tabla “ventas”.

Los campos son:

- **id_tipo_de_venta**
- **descripción**

Se ha definido el id_tipo_de_venta como PRIMARY KEY.

## Listado de Vistas

**Vista “resultados”**

El propósito de esta vista es resumir los resultados de los sorteos y facilitar el acceso a dicha información. Se presenta, para cada sorteo, el número de rifa ganador, así como el nombre y apellido del ganador, garantizando que no se divulguen datos sensibles, protegiendo así la privacidad de los participantes.

En la vista se expone:

- **id_sorteo** de la tabla sorteos
- **id_premio** de la tabla sorteos
- **numero** de la tabla rifas
- **nombre** de la tabla compradores
- **apellido** de la tabla compradores

**Vista “rifa_por_comprador”**

El propósito de esta vista es mostrar un listado de todas las rifas con los nombres y apellidos de sus respectivos compradores. Esto facilita identificar rápidamente el comprador de cada rifa y cuáles aún están disponibles, sin revelar datos sensibles de los compradores.

En la vista se expone:

- **numero** de la tabla rifas
- **nombre** de la tabla compradores
- **apellido** de la tabla compradores

**Vista “rifas_sin_entregar”**

El propósito de esta vista es mostrar las rifas que aún no han sido entregadas, incluyendo información de contacto y domicilio del comprador. Esto facilita el seguimiento y coordinación de entregas pendientes.

En la vista se expone:

- **id_comprador** de la tabla compradores
- **nombre** de la tabla compradores
- **apellido** de la tabla compradores
- **domicilio** de la tabla compradores
- **teléfono** de la tabla compradores
- **id_rifa** de la tabla rifas
- **numero** de la tabla rifas

**Vista “premios_y_ganadores”**

El propósito de esta vista es resumir todos los premios sorteados junto con los datos del comprador ganador, permitiendo un seguimiento de los resultados de los sorteos.

En la vista se expone:

- **id_premio** de la tabla premios
- **descripción_premio** de la tabla premios
- **numero** de la tabla rifas
- **nombre** de la tabla compradores
- **apellido** de la tabla compradores

Ver script adjunto:

**Vista “rifas_sin_vender”**

El propósito de esta vista es listar todas las rifas que aún no han sido vendidas. Sirve para identificar el stock y planificar nuevas estrategias de venta.

En la vista se expone:

- **id_rifa** de la tabla rifas
- **numero** de la tabla rifas

## Listado de Funciones

**Función “contar_rifas_vendidas”.**

La función tiene como objetivo devolver el número de rifas vendidas de manera sencilla para el usuario. Dado que cada rifa puede ser vendida solo una vez, la función cuenta el total de ventas para determinar la cantidad de rifas vendidas.

La función lee información desde la tabla de ventas.

**Función “contar_rifas_entregadas”.**

La función tiene como objetivo devolver el número de rifas entregadas. La función lee información desde la tabla entrega_rifas. Para determinar el número de rifas sin entregar cuenta el total de líneas que tiene NULL como valor en el campo "fecha_entrega".

En base a estas funciones se puede extraer un [Informe de rifas vendidas](https://github.com/sebabayarres/SQL_Final/blob/main/Informes/Rifas%20Vendidas.csv) y un [Informe de Rifas Entregadas](https://github.com/sebabayarres/SQL_Final/blob/main/Informes/Rifas%20Entregadas.csv)

En base a estos informes se elaboraron las siguientes gráficas:

![Gráfica 1](https://github.com/sebabayarres/SQL_Final/blob/main/Informes/Imagen%201.png)

![Gráfica 2](https://github.com/sebabayarres/SQL_Final/blob/main/Informes/Imagen%202.png)

## Listado de Stored Procedures

**Stored Procedure “obtener_ventas_por_forma_de_pago”**

El procedimiento facilita el acceso rápido a los datos clave de las ventas realizadas con una forma de pago específica. Esto permite identificar las rifas pagadas con crédito y realizar un seguimiento del pago de las cuotas.

El procedimiento arroja los siguientes datos:

- **id_comprador** de la tabla ventas
- **id_rifa** de la tabla ventas
- **forma_de_pago** de la tabla ventas
- **nombre** de la tabla compradores
- **apellido** de la tabla compradores

**Stored Procedure “obtener_ventas_por_tipo”**

El procedimiento optimiza el acceso a los datos clave de las ventas efectuadas en una modalidad específica. Este enfoque permite identificar las transacciones realizadas de manera online, facilitando la coordinación de la entrega posterior de la rifa impresa.

El procedimiento arroja los siguientes datos:

- **id_comprador** de la tabla ventas
- **id_rifa** de la tabla ventas
- **nombre** de la tabla compradores
- **apellido** de la tabla compradores
- **tipo_de_venta** de la tabla ventas


## Listado de Triggers

**Trigger sobre la tabla “ventas”**

Se ha creado una tabla de auditoría que registra los cambios de INSERT, UPDATE y DELETE en la tabla ventas, permitiendo controlar movimientos y detectar inconsistencias.

Esto se ha realizado mediante un trigger que registra todas las nuevas adiciones, todos los cambios y todas las eliminaciones de la tabla.

**Trigger sobre la tabla “compradores”**

Se ha creado una tabla de auditoría que registra los cambios de UPDATE de la tabla compradores, permitiendo controlar las variaciones.

Esto se ha realizado mediante un trigger que registra todas las actualizaciones de la tabla.

**Trigger sobre la tabla “entrega_rifas”**

Se ha creado una tabla de auditoría que registra todas las entregas de rifas.

Esto se ha realizado mediante un trigger que registra todas las INSERT a la tabla de entregas.

Ver script de creación de todos los elementos de la tabla: [Script de Creación.sql](https://github.com/sebabayarres/SQL_Final/blob/main/Scripts/Script%20de%20Creación.sql)

## Importación de datos

Ver script de inserción de datos adjunto: [Script de Inserción de Datos](https://github.com/sebabayarres/SQL_Final/blob/main/Scripts/Inserción%20de%20Datos.sql)

