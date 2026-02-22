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