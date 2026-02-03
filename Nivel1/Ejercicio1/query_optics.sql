-- 1. Lista el total de facturas de un cliente/a en un período determinado.
SELECT 
    c.name AS customer_name,
    COUNT(s.sale_id) AS total_invoices
FROM sale s
JOIN customer c ON s.customer_id = c.customer_id
WHERE c.customer_id = 1
  AND s.sale_date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY c.customer_id, c.name;


-- 2. Lista los diferentes modelos de gafas que ha vendido un empleado durante un año.
SELECT DISTINCT
	e.name AS Employee,
    b.name AS brand,
    g.frame_type,
    g.frame_color,
    g.price
FROM sale s
JOIN employee e ON s.employee_id = e.employee_id
JOIN glasses g ON s.glasses_id = g.glasses_id
JOIN brand b ON g.brand_id = b.brand_id
WHERE e.employee_id = 1
  AND YEAR(s.sale_date) = 2025
ORDER BY b.name, g.frame_type;


-- 3. Lista a los diferentes proveedores que han suministrado gafas vendidas con éxito por la óptica.
SELECT DISTINCT
    sup.name AS supplier_name,
    sup.nif,
    sup.country
FROM sale sa
JOIN glasses g ON sa.glasses_id = g.glasses_id
JOIN brand b ON g.brand_id = b.brand_id
JOIN supplier sup ON b.supplier_id = sup.supplier_id;

	
