-- orders
-- | order_id | customer_id | order_date | amount |

-- customers
-- | customer_id | name | city |

-- You have a table employees:

-- | emp_id | name | department | salary | hire_date |

-- Table: transactions
-- | customer_id | transaction_date | amount |

-- 1️⃣6️⃣ Cohort Analysis
-- Group customers by their first purchase month and calculate revenue per cohort.
with first_purchase as(
select customer_id,
	min(order_date) as first_order
from orders
group by customer_id
),
customer_cohort as (
select customer_id,
	date_format(first_order ,"%Y-%m") cohort_month
from first_purchase)
select cohort_month,
	sum(amount) as total_revenue
from orders o
join customer_cohort c
on o.customer_id = c.customer_id
group by cohort_month
order by cohort_month;