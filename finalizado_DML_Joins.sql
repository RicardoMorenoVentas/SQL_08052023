--distinct

-- Se quiere saber a qué paises se les vende usando la tabla de clientes
SELECT DISTINCT country FROM customers;

-- Se quiere saber a qué ciudades se les vende usando la tabla de clientes
SELECT DISTINCT city FROM customers;

-- Se quiere saber a qué ciudades se les ha enviado una orden
SELECT DISTINCT city FROM customers WHERE EXISTS (SELECT ship_city FROM orders);

--Se quiere saber a qué ciudades se les vende en el pais USA usando la tabla de clientes
SELECT DISTINCT cust.city FROM customers cust RIGHT OUTER JOIN orders o ON cust.city = o.ship_city WHERE o.ship_country = 'USA';


--Agrupacion

-- Se quiere saber a qué paises se les vende usando la tabla de clientes nota hacerla usando group by
SELECT country FROM customers GROUP BY country ORDER BY country;

--Cuantos clientes hay por pais
SELECT country, COUNT(customer_id) AS cantidad_clientes_pais FROM customers GROUP BY country;

--Cuantos clientes hay por ciudad en el pais USA
SELECT city, COUNT(customer_id) AS cantidad_clientes_ciudad FROM customers WHERE country = 'USA' GROUP BY city;

--Cuantos productos hay por proveedor de la categoria 1
SELECT supplier_id, COUNT(product_id) AS cantidad_productos_proveedor FROM products WHERE category_id = 1 GROUP BY supplier_id;

--Filtro con having

-- Cuales son los proveedores que nos surten más de 1 producto, mostrar el proveedor mostrar la cantidad de productos
SELECT supplier_id, COUNT(product_id) AS cantidad_productos_proveedor FROM products GROUP BY supplier_id HAVING COUNT(product_id) > 1;

-- Cuales son los proveedores que nos surten más de 1 producto, mostrar el proveedor mostrar la cantidad de productos, pero únicamente de la categoria 1
SELECT supplier_id, COUNT(product_id) AS cantidad_productos_proveedor FROM products WHERE category_id = 1 GROUP BY supplier_id HAVING COUNT(product_id) > 1;

--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES USA, CANADA, SPAIN (ShipCountry) MOSTRAR UNICAMENTE LOS EMPLEADOS CUYO CONTADOR DE ORDENES SEA MAYOR A 20
SELECT employee_id, COUNT(order_id) AS cantidad_ordenes_empleado FROM orders WHERE ship_country IN('USA','Canada','Spain') GROUP BY employee_id HAVING COUNT(order_id) > 20;

--OBTENER EL PRECIO PROMEDIO DE LOS PRODUCTOS POR PROVEEDOR UNICAMENTE DE AQUELLOS CUYO PROMEDIO SEA MAYOR A 20
SELECT supplier_id, AVG(units_in_stock) AS promedio_producto FROM products GROUP BY supplier_id HAVING AVG(units_in_stock) > 20;

--OBTENER LA SUMA DE LAS UNIDADES EN EXISTENCIA (UnitsInStock) POR CATEGORIA, Y TOMANDO EN CUENTA UNICAMENTE LOS PRODUCTOS CUYO PROVEEDOR (SupplierID) SEA IGUAL A 17, 19, 16 DICIONALMENTE CUYA SUMA POR CATEGORIA SEA MAYOR A 300--
SELECT category_id, SUM(units_in_stock) AS suma_unidades FROM products WHERE supplier_id IN(17,19,16) GROUP BY category_id HAVING SUM(units_in_stock) > 300;

--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES (ShipCountry) USA, CANADA, SPAIN cuYO CONTADOR SEA MAYOR A 25
SELECT employee_id, COUNT(order_id) AS cantidad_ordenes_empleado FROM orders WHERE ship_country IN('USA','Canada','Spain') GROUP BY employee_id HAVING COUNT(order_id) > 25;

----OBTENER LAS VENTAS (Quantity * UnitPrice) AGRUPADAS POR PRODUCTO (Orders details) Y CUYA SUMA DE VENTAS SEA MAYOR A 50.000
SELECT product_id, SUM(unit_price*quantity) AS ventas_producto FROM order_details GROUP BY product_id HAVING SUM(unit_price*quantity) > 50000;

--Mas de una tabla 

--OBTENER EL NUMERO DE ORDEN, EL ID EMPLEADO, NOMBRE Y APELLIDO DE LAS TABLAS DE ORDENES Y EMPLEADOS
SELECT ord.order_id, ord.employee_id, emp.first_name, emp.last_name FROM orders ord INNER JOIN employees emp ON ord.employee_id = emp.employee_id;

--OBTENER EL PRODUCTID, PRODUCTNAME, SUPPLIERID, COMPANYNAME DE LAS TABLAS DE PRODUCTOS Y PROVEEDORES (SUPPLIERS)
SELECT prod.product_id, prod.product_name, prod.supplier_id, sup.company_name FROM products prod INNER JOIN suppliers sup ON prod.supplier_id = sup.supplier_id;

--OBTENER LOS DATOS DEL DETALLE DE ORDENES CON EL NOMBRE DEL PRODUCTO DE LAS TABLAS DE DETALLE DE ORDENES Y DE PRODUCTOS
SELECT det.order_id, det.product_id, prod.product_name, det.unit_price, det.quantity, det.discount FROM order_details det INNER JOIN products prod ON prod.product_id = det.product_id;

--OBTENER DE LAS ORDENES EL ID, SHIPPERID, NOMBRE DE LA COMPAÑÍA DE ENVIO (SHIPPERS)
SELECT ord.order_id, ord.ship_via, ship.company_name FROM orders ord INNER JOIN shippers ship ON ord.ship_via = ship.shipper_id;

--Obtener el número de orden, país de envío (shipCountry) y el nombre del empleado de la tabla ordenes y empleados Queremos que salga el Nombre y Apellido del Empleado en una sola columna.
SELECT ord.order_id, ord.ship_country, emp.first_name || ' ' || emp.last_name AS nombre_empleado FROM orders ord INNER JOIN employees emp ON ord.employee_id = emp.employee_id;

--Combinando la mayoría de conceptos

--CONTAR EL NUMERO DE ORDENES POR EMPLEADO OBTENIENDO EL ID EMPLEADO Y EL NOMBRE COMPLETO DE LAS TABLAS DE ORDENES Y DE EMPLEADOS join y group by / columna calculada
SELECT ord.employee_id , CONCAT(emp.first_name,' ',emp.last_name) AS nombre_empleado, COUNT(ord.order_id) AS cantidad_ordenes FROM orders ord INNER JOIN employees emp ON emp.employee_id = ord.employee_id GROUP BY ord.employee_id, CONCAT(emp.first_name,' ',emp.last_name);

--OBTENER LA SUMA DE LA CANTIDAD VENDIDA Y EL PRECIO PROMEDIO POR NOMBRE DE PRODUCTO DE LA TABLA DE ORDERS DETAILS Y PRODUCTS
SELECT prod.product_name, SUM(ord.quantity) AS suma_cantidad, AVG(ord.unit_price) AS precio_promedio FROM order_details ord INNER JOIN products prod ON ord.product_id = prod.product_id GROUP BY prod.product_name;

--OBTENER LAS VENTAS (UNITPRICE * QUANTITY) POR CLIENTE DE LAS TABLAS ORDER DETAILS, ORDERS
SELECT ord.customer_id, SUM(det.unit_price * det.quantity) AS ventas_cliente FROM order_details det INNER JOIN orders ord ON ord.order_id = det.order_id GROUP BY ord.customer_id;

--OBTENER LAS VENTAS (UNITPRICE * QUANTITY) POR EMPLEADO MOSTRANDO EL APELLIDO (LASTNAME)DE LAS TABLAS EMPLEADOS, ORDENES, DETALLE DE ORDENES
SELECT emp.last_name, SUM(det.unit_price * det.quantity) AS ventas_empleado FROM orders ord INNER JOIN employees emp ON emp.employee_id = ord.employee_id INNER JOIN order_details det ON det.order_id = ord.order_id GROUP BY emp.last_name;
