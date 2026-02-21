/*
--------------------------------------------------------------------------------
PROBLEM: Pivot Occupation Column

Pivot the Occupation column in the OCCUPATIONS table so that each Name is
sorted alphabetically and displayed underneath its corresponding Occupation.

The output must contain four columns in the following order:
    1. Doctor
    2. Professor
    3. Singer
    4. Actor

Each column should list names alphabetically under that occupation.

If an occupation has fewer names than others, print NULL in the remaining rows.

--------------------------------------------------------------------------------
TABLE STRUCTURE:

OCCUPATIONS
-----------
Name        VARCHAR
Occupation  VARCHAR

Occupation will contain only one of the following values:
    - 'Doctor'
    - 'Professor'
    - 'Singer'
    - 'Actor'

--------------------------------------------------------------------------------
EXPECTED OUTPUT FORMAT:

Doctor      Professor      Singer      Actor
-------------------------------------------------
<Name1>     <Name1>        <Name1>     <Name1>
<Name2>     <Name2>        <Name2>     <Name2>
NULL        <Name3>        NULL        <Name3>
...

--------------------------------------------------------------------------------
REQUIREMENTS:

1. Sort names alphabetically within each occupation.
2. Align them row-wise.
3. Display NULL where no corresponding name exists.
4. Output must be ordered row-wise correctly.
--------------------------------------------------------------------------------
*/
SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
    SELECT 
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
    FROM OCCUPATIONS
) t
GROUP BY rn
ORDER BY rn;