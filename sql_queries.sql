-- Информация о сумме товаров заказанных каждым клиентом
SELECT 
    c.name AS "Клиент",
    SUM(oi.quantity * oi.price) AS "Сумма"
FROM clients c
JOIN orders o ON o.client_id = c.id
JOIN order_items oi ON oi.order_id = o.id
GROUP BY c.id, c.name;

-- Количество дочерних элементов первого уровня вложенности для категорий
SELECT 
    c.name AS "Категория",
    COUNT(child.id) AS "Количество_потомков"
FROM categories c
LEFT JOIN categories child ON child.parent_id = c.id
GROUP BY c.id, c.name
ORDER BY c.id;
