USE pizzeria;

SELECT 
    c.name AS city,
    SUM(op.quantity) AS total_drinks_sold
FROM order_product op
JOIN product p ON op.product_id = p.product_id
JOIN `order` o ON op.order_id = o.order_id
JOIN customer cu ON o.customer_id = cu.customer_id
JOIN city c ON cu.city_id = c.city_id
WHERE p.product_type = 'drink'
  AND c.name = 'Barcelona'
GROUP BY c.name;


SELECT 
    e.first_name,
    e.last_name,
    COUNT(o.order_id) AS total_orders
FROM employee e
JOIN `order` o ON e.employee_id = o.delivery_employee_id
WHERE e.employee_id = 1
GROUP BY e.employee_id;


