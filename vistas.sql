-- PRIMERA VISTA MUSTRA LOS PRIMERO 50 PRODUCTOS CON MAS STOCK
SELECT 
unidades
,MAX(precio) AS precio_mas_alto
,MIN(precio) AS precio_mas_bajo
,AVG(precio) AS precio_promedio
,descripcion
,p.nomb_producto
FROM ingreso_pro i
INNER JOIN producto p 
ON (p.id_producto = i.id_producto)
GROUP BY i.id_producto
ORDER BY SUM(unidades) DESC LIMIT 50;

-- USUARIOS MENOR NIVEL 3 SIN TELEFONO
SELECT 
CONCAT (nombre, '  ', apellido) AS Nombre_y_Apellido
,email
,num_tel
FROM email_contacto e
	INNER JOIN usuario u
		ON e.id_usuario = u.id_usuario
	INNER JOIN contacto_tel t
		ON e.id_usuario = t.id_usuario
WHERE id_tusuario < 3 AND num_tel LIKE '%sin%';


SELECT 
	CONCAT (nombre, '  ', apellido) AS Nombre_y_Apellido
-- ,   r.region
-- ,   p.pais 
,	domicilio	
,	codigo_post
,	p.nomb_producto
,	unidades
FROM egreso_pro e
	INNER JOIN usuario u
	ON (e.id_usuario = u.id_usuario)
    INNER JOIN domicilios d
    ON (envio = d.id_domi)
    INNER JOIN producto p
    ON (e.id_producto = p.id_producto);
