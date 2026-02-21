/*
# 🟦 SQL Case Study: Classifying Triangles

## 📌 Problem Statement

Write a SQL query to identify the type of each record in the `TRIANGLES` table using its three side lengths.

For each row, output one of the following values:

- **Equilateral** → It's a triangle with 3 sides of equal length.
- **Isosceles** → It's a triangle with 2 sides of equal length.
- **Scalene** → It's a triangle with 3 sides of differing lengths.
- **Not A Triangle** → The given values of A, B, and C do not form a triangle.

---

## 📥 Input Format

The `TRIANGLES` table is described as follows:

| Column | Data Type |
|--------|----------|
| A      | INT      |
| B      | INT      |
| C      | INT      |

Each row in the table denotes the lengths of a triangle's three sides.

---

## 📤 Output Format

Return a single column named:
triangle_type

Each row must contain one of the following values:
Equilateral
Isosceles
Scalene
Not A Triangle

---

## 📘 Sample Input

| A  | B  | C  |
|----|----|----|
| 20 | 20 | 23 |
| 20 | 20 | 20 |
| 20 | 21 | 22 |
| 13 | 14 | 30 |

---

## 📗 Sample Output
Isosceles
Equilateral
Scalene
Not A Triangle
*/
SELECT 
    CASE 
        WHEN A + B <= C 
          OR A + C <= B 
          OR B + C <= A 
        THEN 'Not A Triangle'
        
        WHEN A = B AND B = C THEN 'Equilateral'
        WHEN A = B OR B = C OR A=C THEN 'Isosceles'

        ELSE 'Scalene'
    END T
FROM TRIANGLES;