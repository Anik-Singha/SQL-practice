/*
SQL Interview Question:

Assume you're given a table called viewership that tracks user viewership 
categorized by device type. The three possible device types are:
- 'laptop'
- 'tablet'
- 'phone'

Table: viewership
-----------------------------------------
Column Name   | Type
-----------------------------------------
user_id       | integer
device_type   | string ('laptop', 'tablet', 'phone')
view_time     | timestamp
-----------------------------------------

Write a query that calculates:

1. The total number of laptop views as laptop_views
2. The total number of mobile views as mobile_views

Where:
- Mobile views are defined as the sum of 'tablet' and 'phone' views.

Return the result in the following format:

-----------------------------------------
| laptop_views | mobile_views |
-----------------------------------------

Note:
The dataset may contain different values than the example.
*/
select 
        count(case when device_type = 'laptop' then 1 end) laptop_views,
        count(case when device_type in ('phone','tablet') then 1 end) mobile_views
from viewership;