/* 
================================================================================
SQL Problem: OCCUPATIONS
================================================================================

Generate the following two result sets from the OCCUPATIONS table:

1) Query an alphabetically ordered list of all names in OCCUPATIONS,
   immediately followed by the first letter of each profession enclosed 
   in parentheses.

   Format:
   Name(FirstLetterOfOccupation)

   Example:
   AnActorName(A)
   ADoctorName(D)
   AProfessorName(P)
   ASingerName(S)

--------------------------------------------------------------------------

2) Query the number of occurrences of each occupation in OCCUPATIONS.
   Sort the results in ascending order of occupation count.

   Output Format:
   There are a total of [occupation_count] [occupation]s.

   Where:
   - [occupation_count] is the total number of occurrences of that occupation
   - [occupation] is the lowercase occupation name
   - Output must end with a period (.)

   If multiple occupations have the same occupation_count,
   sort them alphabetically by occupation name.

--------------------------------------------------------------------------

Notes:
- The OCCUPATIONS table contains the following columns:

    Name        VARCHAR
    Occupation  VARCHAR

- Occupation will only contain one of the following values:
    Doctor, Professor, Singer, Actor

- There will be at least two entries in the table for each occupation type.

--------------------------------------------------------------------------

Sample Output:

Ashely(P)
Christeen(P)
Jane(A)
Jenny(D)
Julia(A)
Ketty(P)
Maria(A)
Meera(S)
Priya(S)
Samantha(D)
There are a total of 2 doctors.
There are a total of 2 singers.
There are a total of 3 actors.
There are a total of 3 professors.

================================================================================
*/

SELECT CONCAT(Name,
        '(',SUBSTRING(Occupation,1,1),')') T
FROM OCCUPATIONS
ORDER BY T;

SELECT CONCAT('There are a total of ',count(Occupation),' ',lower(Occupation),'s.')
FROM OCCUPATIONS
Group by Occupation
Order by count(Occupation),Occupation;