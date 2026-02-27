/* ============================================================
   SQL MURDER MYSTERY INVESTIGATION
   Source: https://mystery.knightlab.com/
   ============================================================ */


/* ============================================================
   DATABASE TABLES
   ============================================================

crime_scene_report
(date INTEGER, type TEXT, description TEXT, city TEXT)

drivers_license
facebook_event_checkin
interview
get_fit_now_member
get_fit_now_check_in
solution
income
person

============================================================ */


/* ============================================================
   CASE INFORMATION
   ============================================================

Crime: Murder
Date: January 15, 2018
City: SQL City

Initial information:
Security footage shows there were two witnesses.

Witness #1:
Lives at the LAST house on "Northwestern Dr".

Witness #2:
Named Annabel
Lives somewhere on "Franklin Ave".

============================================================ */


/* ============================================================
   STEP 1 — FIND THE CRIME SCENE REPORT
   ============================================================ */

SELECT *
FROM crime_scene_report
WHERE date = '20180115'
AND type = 'murder'
AND city = 'SQL City';


/*
Result description revealed:

• Two witnesses were present.
• Witness locations were provided.

============================================================
*/


/* ============================================================
   STEP 2 — FIND THE FIRST WITNESS
   ============================================================

Clue:
"The first witness lives at the last house on Northwestern Dr."

Interpretation:
The last house means the highest address_number
on Northwestern Dr.
*/

/* Witness Found */

-- Person Details
/*
id: 14887
name: Morty Schapiro
address: 4919 Northwestern Dr
*/




/* ============================================================
   STEP 3 — FIND THE SECOND WITNESS
   ============================================================

Clue:
Named Annabel
Street: Franklin Ave
*/

/* Witness Found */

/*
id: 16371
name: Annabel Miller
address: 103 Franklin Ave
*/



/* ============================================================
   STEP 4 — CHECK WITNESS INTERVIEWS
   ============================================================

Interview 1 (Morty Schapiro):

"I heard a gunshot and saw a man run out.
He had a 'Get Fit Now Gym' bag.

The membership number on the bag started with '48Z'.
Only GOLD members have those bags.

The man got into a car with a plate that included 'H42W'."



Interview 2 (Annabel Miller):

"I saw the murder happen.

I recognized the killer from my gym when I was working out
last week on January 9th."

============================================================ */


/* ============================================================
   STEP 5 — INVESTIGATE THE GYM MEMBERS
   ============================================================

Clues gathered:

Gym: Get Fit Now
Membership number starts with: 48Z
Membership status: GOLD
Date seen at gym: January 9, 2018

Gym Check-in Records
*/

-- Possible gym check-ins

/*
membership_id  check_in_date  check_in_time  check_out_time

48Z7A          20180109       1600           1730
48Z55          20180109       1530           1700
*/




/* ============================================================
   STEP 6 — IDENTIFY THE GYM MEMBERS
   ============================================================

Join membership IDs to get the people.
*/

-- Gym Members

/*
membership_id   person_id   name            status
48Z55           67318       Jeremy Bowers   gold
48Z7A           28819       Joe Germuska    gold
*/




/* ============================================================
   STEP 7 — CHECK PERSON RECORDS
   ============================================================ */

-- Person Details

/*
person_id: 28819
name: Joe Germuska

person_id: 67318
name: Jeremy Bowers
*/




/* ============================================================
   STEP 8 — INTERVIEW THE SUSPECT
   ============================================================

Interview of Jeremy Bowers revealed:

"I was hired by a woman with a lot of money.

Description of the mastermind:

• Height: 65–67 inches
• Hair color: red
• Car: Tesla Model S
• Attended SQL Symphony Concert
  three times in December 2017
"

============================================================ */



/* ============================================================
   STEP 9 — SEARCH DRIVER LICENSE RECORDS
   ============================================================ */

SELECT *
FROM drivers_license
WHERE car_make = 'Tesla'
AND car_model = 'Model S'
AND height BETWEEN 65 AND 67
AND hair_color = 'red';


/*
Possible Suspects Found:

driver_id   height   hair_color   car
202298      66       red          Tesla Model S
291182      66       red          Tesla Model S
918773      65       red          Tesla Model S
*/




/* ============================================================
   STEP 10 — CHECK EVENT ATTENDANCE
   ============================================================

Clue:
Mastermind attended
"SQL Symphony Concert"
three times in December 2017
*/

SELECT *
FROM facebook_event_checkin
WHERE event_name = 'SQL Symphony Concert'
AND person_id IN (
    SELECT id
    FROM person
    WHERE license_id IN (202298,291182,918773)
);



/*
Person Identified:

person_id: 99716
name: Miranda Priestly
address: 1883 Golden Ave
*/




/* ============================================================
   STEP 11 — FINAL CONFIRMATION QUERY
   ============================================================ */

WITH d_details AS (
SELECT id AS driver_id, age, height, gender
FROM drivers_license
WHERE car_make = 'Tesla'
AND car_model = 'Model S'
AND height BETWEEN 65 AND 67
AND hair_color = 'red'
),
p_details AS (
SELECT p.id AS person_id, p.name, p.license_id
FROM d_details d
JOIN person p
ON d.driver_id = p.license_id
)

SELECT name
FROM p_details pp
JOIN facebook_event_checkin f
ON pp.person_id = f.person_id
WHERE f.event_name = 'SQL Symphony Concert'
GROUP BY f.event_name
HAVING COUNT(f.event_name) = 3;

-- Using Joins
SELECT p.name
FROM person p
JOIN drivers_license d
ON p.license_id = d.id
JOIN facebook_event_checkin f
ON p.id = f.person_id
WHERE d.gender = 'female'
AND d.hair_color = 'red'
AND d.height BETWEEN 65 AND 67
AND d.car_make = 'Tesla'
AND d.car_model = 'Model S'
AND f.event_name = 'SQL Symphony Concert'
GROUP BY p.name
HAVING COUNT(*) = 3;

/* ============================================================
   FINAL RESULT
   ============================================================

Murderer:
Jeremy Bowers

Mastermind behind the crime:
Miranda Priestly

============================================================ */


/*
SHORTER CTE more polished

WITH d_details AS (
    SELECT id
    FROM drivers_license
    WHERE car_make = 'Tesla'
      AND car_model = 'Model S'
      AND height BETWEEN 65 AND 67
      AND hair_color = 'red'
),
p_details AS (
    SELECT p.id, p.name
    FROM d_details d
    JOIN person p
    ON d.id = p.license_id
)

SELECT pp.name
FROM p_details pp
JOIN facebook_event_checkin f
ON pp.id = f.person_id
WHERE f.event_name = 'SQL Symphony Concert'
GROUP BY pp.name
HAVING COUNT(*) = 3;
*/