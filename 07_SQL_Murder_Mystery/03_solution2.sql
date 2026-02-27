/* ============================================================
   SQL MURDER MYSTERY – ANALYST CASE FILE
   Source: https://mystery.knightlab.com/
   ============================================================ */


/* ============================================================
   CASE SUMMARY
   ============================================================

Crime:
Murder in SQL City

Date:
January 15, 2018

Evidence:
Two witnesses identified from security footage.

Witness #1:
Lives at the LAST house on "Northwestern Dr".

Witness #2:
Named Annabel
Lives somewhere on "Franklin Ave".

Objective:
Identify the murderer and the mastermind.

============================================================ */


/* ============================================================
   STEP 1 — RETRIEVE CRIME SCENE REPORT
   ============================================================ */

SELECT *
FROM crime_scene_report
WHERE city = 'SQL City'
AND type = 'murder'
AND date = 20180115;


/*
Report revealed:

• Two witnesses exist.
• Their addresses were provided.

============================================================
*/


/* ============================================================
   STEP 2 — IDENTIFY BOTH WITNESSES
   ============================================================ */

/* Witness #1 (last house on Northwestern Dr) */

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;


/*
Result:
Morty Schapiro
Person ID: 14887
*/


/* Witness #2 (Annabel on Franklin Ave) */

SELECT *
FROM person
WHERE name LIKE 'Annabel%'
AND address_street_name = 'Franklin Ave';


/*
Result:
Annabel Miller
Person ID: 16371
*/



/* ============================================================
   STEP 3 — READ THEIR INTERVIEWS
   ============================================================ */

SELECT *
FROM interview
WHERE person_id IN (14887,16371);


/*
Key Clues:

Witness 1:
• Killer had "Get Fit Now Gym" bag
• Membership number starts with "48Z"
• Only GOLD members have those bags
• Car plate contains "H42W"

Witness 2:
• Recognized killer from gym
• Seen at gym on January 9, 2018

============================================================
*/


/* ============================================================
   STEP 4 — FIND GYM MEMBERS MATCHING CLUES
   ============================================================

Conditions:

• membership_id starts with '48Z'
• membership_status = 'gold'
• gym check-in date = 20180109
*/

SELECT m.id, m.person_id, m.name
FROM get_fit_now_member m
JOIN get_fit_now_check_in c
ON m.id = c.membership_id
WHERE m.id LIKE '48Z%'
AND m.membership_status = 'gold'
AND c.check_in_date = 20180109;


/*
Possible suspects:

Jeremy Bowers
Joe Germuska
*/


/* ============================================================
   STEP 5 — MATCH WITH LICENSE PLATE CLUE
   ============================================================ */

SELECT p.name, d.plate_number
FROM person p
JOIN drivers_license d
ON p.license_id = d.id
WHERE p.id IN (28819,67318)
AND d.plate_number LIKE '%H42W%';


/*
Result:

Jeremy Bowers

------------------------------------------------------------

Confirmed murderer.
============================================================
*/


/* ============================================================
   STEP 6 — INTERVIEW THE MURDERER
   ============================================================ */

SELECT *
FROM interview
WHERE person_id = 67318;


/*
Jeremy Bowers confession revealed:

He was hired by a wealthy woman.

Description of mastermind:

• Female
• Height: 65–67 inches
• Hair: Red
• Car: Tesla Model S
• Attended SQL Symphony Concert
  three times in December 2017

============================================================
*/


/* ============================================================
   STEP 7 — FIND POSSIBLE MASTERMINDS
   ============================================================ */

SELECT id
FROM drivers_license
WHERE gender = 'female'
AND hair_color = 'red'
AND height BETWEEN 65 AND 67
AND car_make = 'Tesla'
AND car_model = 'Model S';



/*
Candidate driver IDs found.
Next step: connect them to people.
*/


/* ============================================================
   STEP 8 — CHECK EVENT ATTENDANCE
   ============================================================ */

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


/*
Result:

Miranda Priestly

============================================================
*/


/* ============================================================
   FINAL RESULT
   ============================================================

Murderer:
Jeremy Bowers

Mastermind:
Miranda Priestly

============================================================
*/