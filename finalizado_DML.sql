-- Sentencia Select 
--Obtener todos los registros y todos los campos de la tabla de productos
SELECT * FROM products;

--Obtener una consulta con Productid, productname, supplierid, categoryId, UnistsinStock, UnitPrice
SELECT product_id, product_name, supplier_id, category_id, units_in_stock, unit_price FROM products;

--Crear una consulta para obtener el IdOrden, IdCustomer, Fecha de la orden de la tabla de ordenes.
SELECT order_id, customer_id, order_date FROM orders;

--Crear una consulta para obtener el OrderId, EmployeeId, Fecha de la orden.
SELECT order_id, employee_id, order_date FROM orders;

--Columnas calculadas 

--Obtener una consulta con Productid, productname y valor del inventario, valor inventrio (UnitsinStock * UnitPrice)
SELECT product_id, product_name, (unit_price * units_in_stock) AS valor_inventario FROM products;

--Cuanto vale el punto de reorden (Reorden * precio unitario)
SELECT product_id, product_name, (unit_price * reorder_level) AS punto_reorden FROM products;

--Mostrar una consulta con Productid, productname y precio, el nombre del producto debe estar en mayuscula 
SELECT product_id, UPPER(product_name) AS product_name, unit_price FROM products;

--Mostrar una consulta con Productid, productname y precio, el nombre del producto debe contener unicamente 10 caracteres */
SELECT product_id, SUBSTRING(product_name,1,10), unit_price FROM products;

--Obtenre una consulta que muestre la longitud del nombre del producto
SELECT product_id, product_name, LENGTH(product_name) AS longitud_nombre, unit_price FROM products;
-- Otra forma de sacarlo
SELECT product_id, product_name, CHAR_LENGTH(product_name) AS longitud2_nombre, unit_price FROM products;

--Obtener una consulta de la tabla de productos que muestre el nombre en minúscula
SELECT product_id, LOWER(product_name) AS product_name, unit_price FROM products;

--Mostrar una consulta con Productid, productname y precio, el nombre del producto debe contener unicamente 10 caracteres y se deben mostrar en mayúscula */
SELECT product_id, UPPER(SUBSTRING(product_name,1,10)) AS product_name, unit_price FROM products;

--Filtros

--Obtener de la tabla de Customers las columnas CustomerId, CompanyName, Pais Obtener los clientes cuyo pais sea Spain
SELECT customer_id, company_name, country FROM customers WHERE country = 'Spain';

--Obtener de la tabla de Customers las columnas CustomerId, CompanyName, Pais, Obtener los clientes cuyo pais comience con la letra U
SELECT customer_id, company_name, country FROM customers WHERE country LIKE 'U%';

--Obtener de la tabla de Customers las columnas CustomerId, CompanyName, Pais, Obtener los clientes cuyo pais comience con la letra U,S,A
SELECT customer_id, company_name, country FROM customers WHERE country LIKE 'U%' OR country LIKE 'S%' OR country LIKE 'A%';

--Obtener de la tabla de Productos las columnas productid, ProductName, UnitPrice cuyos precios esten entre 50 y 150
SELECT product_id, product_name, unit_price FROM products WHERE unit_price >= 50 AND unit_price <= 150;

--Obtener de la tabla de Productos las columnas productid, ProductName, UnitPrice, UnitsInStock cuyas existencias esten entre 50 y 100
SELECT product_id, product_name, unit_price, units_in_stock FROM products WHERE units_in_stock >= 50 AND units_in_stock <= 100;
SELECT product_id, product_name, unit_price, units_in_stock FROM products WHERE units_in_stock BETWEEN 50 AND 100;

--Obtener las columnas OrderId, CustomerId, employeeid de la tabla de ordenes cuyos empleados sean 1, 4, 9
SELECT order_id, customer_id, employee_id FROM orders WHERE employee_id = 1 OR employee_id = 4 OR employee_id = 9;

--ORDENAR EL RESULTADO DE LA QUERY POR ALGUNA COLUMNA Obtener la información de la tabla de Products, Ordenarlos por Nombre del Producto de forma ascendente
SELECT product_id, product_name, unit_price FROM products ORDER BY product_name ASC;

--Obtener la información de la tabla de Products, Ordenarlos por Categoria de forma ascendente y por precio unitario de forma descendente
SELECT * FROM products ORDER BY category_id ASC ,  unit_price DESC;

--Obtener la información de la tabla de Clientes, Customerid, CompanyName, city, country ordenar por pais, ciudad de forma ascendente
SELECT customer_id, company_name, city, country FROM customers ORDER BY city , country;

--Obtener los productos productid, productname, categoryid, supplierid ordenar por categoryid y supplier únicamente mostrar aquellos cuyo precio esté entre 25 y 200
SELECT product_id, product_name, category_id, supplier_id, unit_price FROM products WHERE unit_price >= 25 AND unit_price <= 200 ORDER BY category_id , supplier_id;
SELECT product_id, product_name, category_id, supplier_id, unit_price FROM products WHERE unit_price BETWEEN 25 AND 200 ORDER BY category_id , supplier_id;

--Funciones agregación

--Cuantos productos hay en la tabla de productos
SELECT COUNT(product_id) AS cantidad_de_productos FROM products;
SELECT COUNT(*) AS cantidad_de_productos FROM products;

--De la tabla de productos Sumar las cantidades en existencia
SELECT SUM(units_in_stock) AS cantidades_en_existencia FROM products;

--Promedio de los precios de la tabla de productos
SELECT AVG(unit_price) AS precio_promedio_productos FROM products;

-- Ordenar

--Obtener los datos de productos ordenados descendentemente por precio unitario de la categoría 1
SELECT * FROM products WHERE category_id = 1 ORDER BY unit_price ASC;

--Obtener los datos de los clientes(Customers) ordenados descendentemente por nombre(CompanyName) que se encuentren en la ciudad(city) de barcelona, Lisboa
SELECT * FROM customers WHERE city = 'Barcelona' OR city = 'Lisboa' ORDER BY company_name;
SELECT * FROM customers WHERE city IN ('Barcelona','Lisboa') ORDER BY company_name;

--Obtener los datos de las ordenes, ordenados descendentemente por la fecha de la orden cuyo cliente(CustomerId) sea ALFKI
SELECT * FROM orders WHERE customer_id = 'ALFKI' ORDER BY order_date DESC;

--Obtener los datos del detalle de ordenes, ordenados ascendentemente por precio cuyo producto sea 1, 5 o 20
SELECT * FROM order_details WHERE product_id = 1 OR product_id = 5 OR product_id = 20 ORDER BY unit_price ASC;
SELECT * FROM order_details WHERE product_id IN (1,5,20) ORDER BY unit_price ASC;

--Obtener los datos de las ordenes ordenados ascendentemente por la fecha de la orden cuyo empleado sea 2 o 4
SELECT * FROM orders WHERE employee_id = 2 OR employee_id = 4 ORDER BY order_date ASC;
SELECT * FROM orders WHERE employee_id IN (2,4) ORDER BY order_date ASC;

--Obtener los productos cuyo precio están entre 30 y 60 ordenado por nombre
SELECT * FROM products WHERE unit_price >= 30 AND unit_price <= 60 ORDER BY product_name;
SELECT * FROM products WHERE unit_price BETWEEN 30 AND 60 ORDER BY product_name;

--funciones de agrupacion

--OBTENER EL MAXIMO, MINIMO Y PROMEDIO DE PRECIO UNITARIO DE LA TABLA DE PRODUCTOS UTILIZANDO ALIAS
SELECT MAX(unit_price) AS Precio_Maximo, MIN(unit_price) AS Precio_Minimo, AVG(unit_price) AS Precio_Medio FROM products;

--Agrupacion

--Numero de productos por categoria
SELECT category_id,  COUNT(product_id) AS cantidad_Producto FROM products GROUP BY category_id;

--Obtener el precio promedio por proveedor de la tabla de productos
SELECT supplier_id, AVG(unit_price) AS precio_promedio FROM products GROUP BY supplier_id;

--Obtener la suma de inventario (UnitsInStock) por SupplierID De la tabla de productos (Products)
SELECT supplier_id, SUM(units_in_stock) AS suma_inventario FROM products GROUP BY supplier_id;

--Contar las ordenes por cliente de la tabla de orders
SELECT customer_id, COUNT(order_id) AS cantidad_ordenes FROM orders GROUP BY customer_id;

--Contar las ordenes por empleado de la tabla de ordenes unicamente del empleado 1,3,5,6
SELECT employee_id, COUNT(order_id) AS cantidad_ordenes FROM orders WHERE employee_id = 1 OR employee_id = 3 OR employee_id = 5 or employee_id = 6 GROUP BY employee_id ORDER BY employee_id;
SELECT employee_id, COUNT(order_id) AS cantidad_ordenes FROM orders WHERE employee_id IN (1,3,5,6) GROUP BY employee_id ORDER BY employee_id;

--Obtener la suma del envío (freight) por cliente
SELECT customer_id, SUM(freight) AS suma_envio FROM orders GROUP BY customer_id ORDER BY customer_id;

--De la tabla de ordenes únicamente de los registros cuya ShipCity sea Madrid, Sevilla, Barcelona, Lisboa, LondonOrdenado por el campo de suma del envío
SELECT ship_city, SUM(freight) AS suma_envio FROM orders WHERE ship_city = 'Madrid' OR ship_city = 'Sevilla' OR ship_city = 'Barcelona' OR ship_city = 'Lisboa' OR ship_city = 'London' GROUP BY ship_city ORDER BY suma_envio;
SELECT ship_city, SUM(freight) AS suma_envio FROM orders WHERE ship_city IN ('Madrid','Sevilla','Barcelona','Lisboa','London') GROUP BY ship_city ORDER BY suma_envio;


--Obtener el precio promedio de los productos por categoria sin contar con los productos descontinuados (Discontinued)
SELECT category_id, AVG(unit_price) AS precio_promedio FROM products WHERE discontinued = 0 GROUP BY category_id;

--Obtener la cantidad de productos por categoria,  aquellos cuyo precio se encuentre entre 10 y 60 que tengan más de 12 productos
SELECT category_id, COUNT(product_id) AS cantidad_de_productos FROM products WHERE unit_price >= 10 AND unit_price <=60 GROUP BY category_id HAVING COUNT(product_id) > 12;
SELECT category_id, COUNT(product_id) AS cantidad_de_productos FROM products WHERE unit_price BETWEEN 10 AND 60 AND units_in_stock > 12 GROUP BY category_id HAVING COUNT(product_id) > 12;

--OBTENER LA SUMA DE LAS UNIDADES EN EXISTENCIA (UnitsInStock) POR CATEGORIA, Y TOMANDO EN CUENTA UNICAMENTE LOS PRODUCTOS CUYO PROVEEDOR (SupplierID) SEA IGUAL A 17, 19, 16.
SELECT category_id, SUM(units_in_stock) AS unidades_existencia FROM products WHERE supplier_id = 17 OR supplier_id = 19 OR supplier_id = 16 GROUP BY category_id;
SELECT category_id, SUM(units_in_stock) AS unidades_existencia FROM products WHERE supplier_id IN (17,19,16) GROUP BY category_id;

--Cuya categoria tenga menos de 100 unidades ordenado por unidades
SELECT category_id, SUM(units_in_stock) AS unidades_existencia 
FROM products 
WHERE supplier_id IN (17,19,16) 
GROUP BY category_id 
HAVING SUM(units_in_stock) < 100 
ORDER BY unidades_existencia;










