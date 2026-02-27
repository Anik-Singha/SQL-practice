/*
Tables:

orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date TIMESTAMP,
    order_amount INT,
    department_id INT
);

departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

customers (
    customer_id INT PRIMARY KEY,
    last_name VARCHAR(255),
    first_name VARCHAR(255)
);

------------------------------------------------------------

Question:

Write a query to display:

- Department names
- Total revenue per department (SUM of order_amount)
- Time period: Last 12 months
- Order the result by total revenue in descending order

Tables to use:
- orders (alias: o)
- departments (alias: d)

------------------------------------------------------------
*/

select d.department_name,
        SUM(o.order_amount) total_orders
from departments d 
join orders o
on d.department_id = o.department_id
where o.order_date >= date_sub(curdate(),interval 11 month)
group by d.department_name
order by total_orders desc;

-- ✅ 2️⃣ Rolling 12 Months in MySQL (Window Function)

SELECT 
    d.department_name,
    o.order_date,
    SUM(o.order_amount) OVER (
        PARTITION BY d.department_name
        ORDER BY o.order_date
        RANGE BETWEEN INTERVAL '11' MONTH PRECEDING 
        AND CURRENT ROW
    ) AS rolling_12m_total
FROM departments d
JOIN orders o
  ON d.department_id = o.department_id;

-- MYSQL
WITH monthly_sales AS (
    SELECT 
        d.department_name,
        DATE_FORMAT(o.order_date, '%Y-%m-01') AS month_start,
        SUM(o.order_amount) AS monthly_total
    FROM departments d
    JOIN orders o
        ON d.department_id = o.department_id
    GROUP BY d.department_name, month_start
)
SELECT 
    department_name,
    month_start,
    SUM(monthly_total) OVER (
        PARTITION BY department_name
        ORDER BY month_start
        ROWS BETWEEN 11 PRECEDING AND CURRENT ROW
    ) AS rolling_12m_total
FROM monthly_sales;