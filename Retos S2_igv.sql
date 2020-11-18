#####RETO1
USE tienda;

###1 ¿Qué artículos incluyen la palabra Pasta en su nombre?
SELECT * 
FROM articulo 
WHERE nombre LIKE '%pasta%';

###2 ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
SELECT * 
FROM articulo 
WHERE nombre LIKE '%cannelloni%';

###3 ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
SELECT * 
FROM articulo 
WHERE nombre LIKE '% - %'; ##por buena practica para secuencias complejas como ADN se recomienda agregar los espacios

###4 ¿Qué puestos incluyen la palabra Designer?
SELECT * 
FROM puesto 
WHERE nombre LIKE "%designer%";

###5 ¿Qué puestos incluyen la palabra Developer?
SELECT * 
FROM puesto 
WHERE nombre LIKE "%developer%";

#####RETO2
USE tienda;

###1 ¿Cuál es el promedio de salario de los puestos?
SELECT avg(salario) 
FROM puesto;

###2 ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT count(*) 
FROM articulo 
WHERE nombre LIKE '%pasta%';

###3 ¿Cuál es el salario mínimo y máximo?
SELECT min(salario) AS "Salario minimo", max(salario) AS "Salario maximo"
FROM puesto;

###4 ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT max(id_puesto) - 5 
FROM puesto; ##checar que sean consecutivos
###Usar identificador 995
SELECT sum(salario) 
FROM puesto 
WHERE id_puesto > 995; ##no es >= porque saca 6

###alternativa
SELECT SUM(salario) 
FROM puesto 
WHERE id_puesto > ((SELECT MAX(id_puesto) FROM puesto) - 5);


#####RETO3
USE tienda;

###1 ¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, count(*) AS "Total registros por puestos"
FROM puesto GROUP BY nombre; ##no puede ser por id_puesto porque pueden no ser únicos

###2 ¿Cuánto dinero se paga en total por puesto?
SELECT nombre, sum(salario) AS "Pago por Puesto"
FROM puesto GROUP BY nombre;

###3 ¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, count(clave) AS "Ventas por vendedor"
FROM venta GROUP BY id_empleado;

###4 ¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, count(*) AS "Ventas por articulo"
FROM venta GROUP BY id_articulo;


