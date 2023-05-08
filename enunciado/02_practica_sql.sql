--distinct

-- Se quiere saber a qué paises se les vende usar la tabla de clientes
-- Se quiere saber a qué ciudades se les vende usar la tabla de clientes
-- Se quiere saber a qué ciudades se les ha enviado una orden
--Se quiere saber a qué ciudades se les vende en el pais USA usar la tabla de clientes

--Agrupacion

-- Se quiere saber a qué paises se les vende usar la tabla de clientes nota hacerla usando group by
--Cuantos clientes hay por pais
--Cuantos clientes hay por ciudad en el pais USA
--Cuantos productos hay por proveedor de la categoria 1

--Filtro con having

-- Cuales son los proveedores que nos surten más de 1 producto, mostrar el proveedor mostrar la cantidad de productos
-- Cuales son los proveedores que nos surten más de 1 producto, mostrar el proveedor mostrar la cantidad de productos, pero únicamente de la categoria 1
--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES USA, CANADA, SPAIN (ShipCountry) MOSTRAR UNICAMENTE LOS EMPLEADOS CUYO CONTADOR DE ORDENES SEA MAYOR A 20
--OBTENER EL PRECIO PROMEDIO DE LOS PRODUCTOS POR PROVEEDOR UNICAMENTE DE AQUELLOS CUYO PROMEDIO SEA MAYOR A 20
--OBTENER LA SUMA DE LAS UNIDADES EN EXISTENCIA (UnitsInStock) POR CATEGORIA, Y TOMANDO EN CUENTA UNICAMENTE LOS PRODUCTOS CUYO PROVEEDOR (SupplierID) SEA IGUAL A 17, 19, 16 DICIONALMENTE CUYA SUMA POR CATEGORIA SEA MAYOR A 300--
--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES (ShipCountry) SA, CANADA, SPAIN cuYO CONTADOR SEA MAYOR A 25
----OBTENER LAS VENTAS (Quantity * UnitPrice) AGRUPADAS POR PRODUCTO (Orders details) Y CUYA SUMA DE VENTAS SEA MAYOR A 50.000


--Mas de una tabla 

--OBTENER EL NUMERO DE ORDEN, EL ID EMPLEADO, NOMBRE Y APELLIDO DE LAS TABLAS DE ORDENES Y EMPLEADOS
--OBTENER EL PRODUCTID, PRODUCTNAME, SUPPLIERID, COMPANYNAME DE LAS TABLAS DE PRODUCTOS Y PROVEEDORES (SUPPLIERS)
--OBTENER LOS DATOS DEL DETALLE DE ORDENES CON EL NOMBRE DEL PRODUCTO DE LAS TABLAS DE DETALLE DE ORDENES Y DE PRODUCTOS
--OBTENER DE LAS ORDENES EL ID, SHIPPERID, NOMBRE DE LA COMPAÑÍA DE ENVIO (SHIPPERS)
--Obtener el número de orden, país de envío (shipCountry) y el nombre del empleado de la tabla ordenes y empleados Queremos que salga el Nombre y Apellido del Empleado en una sola columna.

--Combinando la mayoría de conceptos

--CONTAR EL NUMERO DE ORDENES POR EMPLEADO OBTENIENDO EL ID EMPLEADO Y EL NOMBRE COMPLETO DE LAS TABLAS DE ORDENES Y DE EMPLEADOS join y group by / columna calculada
--OBTENER LA SUMA DE LA CANTIDAD VENDIDA Y EL PRECIO PROMEDIO POR NOMBRE DE PRODUCTO DE LA TABLA DE ORDERS DETAILS Y PRODUCTS
--OBTENER LAS VENTAS (UNITPRICE * QUANTITY) POR CLIENTE DE LAS TABLAS ORDER DETAILS, ORDERS
--OBTENER LAS VENTAS (UNITPRICE * QUANTITY) POR EMPLEADO MOSTRANDO EL APELLIDO (LASTNAME)DE LAS TABLAS EMPLEADOS, ORDENES, DETALLE DE ORDENES