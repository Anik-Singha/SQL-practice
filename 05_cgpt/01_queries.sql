-- orders
-- | order_id | customer_id | order_date | amount |

-- customers
-- | customer_id | name | city |

-- You have a table employees:

-- | emp_id | name | department | salary | hire_date |

-- Q10: Find total sales for each month in 2024.
select 
	sum(amount) total_sales,
	month(order_date)
from orders
where year(order_date) = 2024
group by month(order_date);

-- Table: transactions
-- | customer_id | transaction_date | amount |

-- Q11: Find customers who made purchases in both January and February 2024.
SELECT c.name
FROM customers c
JOIN transactions t
    ON c.customer_id = t.customer_id
WHERE YEAR(transaction_date) = 2024
  AND MONTH(transaction_date) IN (1,2)
GROUP BY c.customer_id, c.name
HAVING COUNT(DISTINCT MONTH(transaction_date)) = 2;

-- Q12: Get top 3 highest revenue-generating customers.
select name,
	sum(amount) as revenue
from customers c join orders o
on c.customer_id = o.customer_id
group by name
order by revenue desc
limit 3;

-- Q13: Calculate running total of daily sales.
with a as(
select order_date,
	sum(amount) daily_sales
from orders
group by order_date
)
select order_date,
	daily_sales,
	sum(daily_sales) over (order by order_date) running_total
from a;

-- Q14: Find duplicate email IDs in users table.
SELECT 
    email,
    COUNT(*) AS occurrence_count
FROM users
GROUP BY email
HAVING COUNT(*) > 1;

Table: website_visits
| user_id | visit_date | converted (1/0) |

-- Q15: Calculate daily conversion rate.
select visit_date,
	avg(converted) conversion_rate
from website_visits
group by visit_date;

