-- Each query has a question, a solution and a note on why a tester cares.
-- Run:  sqlite3 :memory: ".read sql/01_schema.sql" ".read sql/02_data.sql" ".read sql/03_queries.sql"

-- Q1. List all active users.
SELECT * FROM users WHERE status = 'active';

-- Q2. Users from Delhi, newest first.
SELECT full_name, email, created_on FROM users WHERE city = 'Delhi' ORDER BY created_on DESC;

-- Q3. Users with no email saved (missing data check).
SELECT user_id, full_name FROM users WHERE email IS NULL;

-- Q4. Emails that do not look valid (no dot after the @) - signup validation check.
SELECT user_id, email FROM users WHERE email IS NOT NULL AND email NOT LIKE '%_@_%._%';

-- Q5. Duplicate users (same email appears more than once).
SELECT email, COUNT(*) AS times FROM users WHERE email IS NOT NULL GROUP BY email HAVING COUNT(*) > 1;

-- Q6. Number of users per city.
SELECT city, COUNT(*) AS total_users FROM users GROUP BY city ORDER BY total_users DESC, city;

-- Q7. Products that are out of stock or have negative stock (invalid data).
SELECT product_id, name, stock FROM products WHERE stock <= 0;

-- Q8. Average, min and max price per category.
SELECT category, ROUND(AVG(price),2) AS avg_price, MIN(price) AS min_price, MAX(price) AS max_price FROM products GROUP BY category;

-- Q9. Orders with the customer name (INNER JOIN).
SELECT o.order_id, u.full_name, o.status, o.total FROM orders o INNER JOIN users u ON u.user_id = o.user_id ORDER BY o.order_id;

-- Q10. Orders whose user does not exist (orphan records) - LEFT JOIN.
SELECT o.order_id, o.user_id FROM orders o LEFT JOIN users u ON u.user_id = o.user_id WHERE u.user_id IS NULL;

-- Q11. Users who never placed an order.
SELECT u.user_id, u.full_name FROM users u LEFT JOIN orders o ON o.user_id = u.user_id WHERE o.order_id IS NULL;

-- Q12. Does each order total match the sum of its items? (data integrity check)
SELECT o.order_id, o.total AS stored_total, SUM(i.qty * i.unit_price) AS calculated_total
FROM orders o JOIN order_items i ON i.order_id = o.order_id
GROUP BY o.order_id, o.total
HAVING ROUND(o.total,2) <> ROUND(SUM(i.qty * i.unit_price),2);

-- Q13. Total revenue from delivered orders only.
SELECT SUM(total) AS delivered_revenue FROM orders WHERE status = 'delivered';

-- Q14. Top customer by total amount of non-cancelled orders.
SELECT u.full_name, SUM(o.total) AS spent FROM orders o JOIN users u ON u.user_id = o.user_id
WHERE o.status <> 'cancelled' GROUP BY u.user_id, u.full_name ORDER BY spent DESC LIMIT 1;

-- Q15. Customers with more than one order (HAVING).
SELECT user_id, COUNT(*) AS orders_count FROM orders GROUP BY user_id HAVING COUNT(*) > 1;

-- Q16. Products never ordered (NOT IN / subquery).
SELECT product_id, name FROM products WHERE product_id NOT IN (SELECT product_id FROM order_items);

-- Q17. Orders that contain an out-of-stock product (JOIN across three tables).
SELECT DISTINCT o.order_id, p.name FROM orders o
JOIN order_items i ON i.order_id = o.order_id
JOIN products p ON p.product_id = i.product_id
WHERE p.stock <= 0;

-- Q18. Orders placed by a blocked user (business rule violation).
SELECT o.order_id, u.full_name, u.status FROM orders o JOIN users u ON u.user_id = o.user_id WHERE u.status = 'blocked';

-- Q19. Orders in May 2026 between two dates.
SELECT order_id, order_date FROM orders WHERE order_date BETWEEN '2026-05-10' AND '2026-05-20';

-- Q20. Second highest priced product (classic interview question).
SELECT MAX(price) AS second_highest FROM products WHERE price < (SELECT MAX(price) FROM products);

-- Q21. Open defects by severity.
SELECT severity, COUNT(*) AS open_defects FROM defects WHERE status IN ('Open','In Progress') GROUP BY severity;

-- Q22. Defect count per module, highest first.
SELECT module, COUNT(*) AS total FROM defects GROUP BY module ORDER BY total DESC, module;

-- Q23. Critical defects that are not closed (what blocks a release?).
SELECT defect_id, title, status FROM defects WHERE severity = 'Critical' AND status NOT IN ('Closed','Rejected');

-- Q24. Days taken to close each closed defect.
SELECT defect_id, title, CAST(julianday(closed_on) - julianday(reported_on) AS INTEGER) AS days_to_close
FROM defects WHERE closed_on IS NOT NULL;

-- Q25. Defect status summary with percentage (CASE + subquery).
SELECT status, COUNT(*) AS total, ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM defects), 1) AS percent FROM defects GROUP BY status;

-- Q26. Label defects by priority using CASE.
SELECT defect_id, title,
  CASE severity WHEN 'Critical' THEN 'Fix now' WHEN 'Major' THEN 'Fix this sprint' ELSE 'Backlog' END AS action
FROM defects;

-- Q27. Fixed defects that are still waiting for closure (closed_on is empty).
SELECT defect_id, title FROM defects WHERE status = 'Fixed' AND closed_on IS NULL;
