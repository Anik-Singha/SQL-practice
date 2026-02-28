/*
Question: Top 2 Highest-Grossing Products per Category (Amazon)

This is the same question as Problem #12 in the SQL Chapter of
"Ace the Data Science Interview".

Assume you're given a table containing data on Amazon customers
and their spending on products across different categories.

Write a SQL query to identify the top two highest-grossing products
within each category in the year 2022.

The output should include:
- category
- product
- total_spend (sum of spend)

Rules:
1. Only consider transactions that occurred in the year 2022.
2. Calculate the total spend for each product within its category.
3. Rank products within each category based on total spend (highest first).
4. Return only the top 2 highest-grossing products per category.

Table: product_spend

Columns:
- category (string)
- product (string)
- user_id (integer)
- spend (decimal)
- transaction_date (timestamp)

Example Input:

category      | product            | user_id | spend  | transaction_date
---------------------------------------------------------------------------
appliance     | refrigerator       | 165     | 246.00 | 12/26/2021 12:00:00
appliance     | refrigerator       | 123     | 299.99 | 03/02/2022 12:00:00
appliance     | washing machine    | 123     | 219.80 | 03/02/2022 12:00:00
electronics   | vacuum             | 178     | 152.00 | 04/05/2022 12:00:00
electronics   | wireless headset   | 156     | 249.90 | 07/08/2022 12:00:00
electronics   | vacuum             | 145     | 189.00 | 07/15/2022 12:00:00


Expected Output:

category     | product            | total_spend
------------------------------------------------
appliance    | refrigerator       | 299.99
appliance    | washing machine    | 219.80
electronics  | vacuum             | 341.00
electronics  | wireless headset   | 249.90


Explanation:

Within the "appliance" category, the two products with the highest
total spending are "refrigerator" and "washing machine".

Within the "electronics" category, the two highest-grossing products
are "vacuum" and "wireless headset".

Note:
The dataset you are querying against may have different input and output.
This example is only for illustration.
*/
With a AS(
SELECT category,
       product,
       sum(spend) total_spend,
       dense_rank() over(partition by category order by sum(spend) desc) rank_spend
FROM product_spend
WHERE extract(YEAR from transaction_date) = 2022
group by category,
         product
)
select category,product, total_spend
from a
where rank_spend <=2;