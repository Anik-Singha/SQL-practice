/* ============================================================
   SQL MURDER MYSTERY
   Source: https://mystery.knightlab.com/

   CASE DESCRIPTION
   ------------------------------------------------------------
   A crime has taken place and the detective needs your help.
   The detective gave you the crime scene report, but somehow
   you lost it.

   You vaguely remember that the crime was a murder that
   occurred sometime on January 15, 2018 and that it took
   place in SQL City.

   Start by retrieving the corresponding crime scene report
   from the police department’s database.

   From there you will need to use SQL queries to examine
   the clues, find witnesses, read interview transcripts,
   and follow evidence across multiple tables until you
   identify the murderer.

   The investigation requires exploring the database,
   joining related tables, and interpreting clues written
   in text descriptions.

   Your objective is to determine who committed the murder.

   After identifying the murderer, you may discover that
   there is more to the story, and further investigation
   may reveal additional information about the true
   mastermind behind the crime.

   ============================================================
   DATABASE SCHEMA
   ------------------------------------------------------------
   The investigation database contains several tables that
   represent people, locations, events, and records that may
   help solve the mystery.
   ============================================================


   TABLE: crime_scene_report
   ------------------------------------------------------------
   Contains official police reports for crimes.

   Columns:
   - date        : INTEGER  (date the crime occurred)
   - type        : TEXT     (type of crime)
   - description : TEXT     (written report of the crime)
   - city        : TEXT     (city where crime happened)



   TABLE: person
   ------------------------------------------------------------
   Contains personal records for individuals in the database.

   Columns:
   - id                   : INTEGER  (unique person identifier)
   - name                 : TEXT
   - license_id           : INTEGER  (links to drivers_license)
   - address_number       : INTEGER
   - address_street_name  : TEXT
   - ssn                  : CHAR



   TABLE: interview
   ------------------------------------------------------------
   Stores interview transcripts taken from witnesses
   or persons involved in the investigation.

   Columns:
   - person_id : INTEGER  (references person.id)
   - transcript: TEXT     (full interview text)



   TABLE: drivers_license
   ------------------------------------------------------------
   Contains driver license information.

   Columns:
   - id            : INTEGER
   - age           : INTEGER
   - height        : INTEGER
   - eye_color     : TEXT
   - hair_color    : TEXT
   - gender        : TEXT
   - plate_number  : TEXT
   - car_make      : TEXT
   - car_model     : TEXT



   TABLE: get_fit_now_member
   ------------------------------------------------------------
   Records members of a gym organization.

   Columns:
   - id                    : TEXT
   - person_id             : INTEGER
   - name                  : TEXT
   - membership_start_date : INTEGER
   - membership_status     : TEXT



   TABLE: get_fit_now_check_in
   ------------------------------------------------------------
   Records gym visits by members.

   Columns:
   - membership_id : TEXT
   - check_in_date : INTEGER
   - check_in_time : INTEGER
   - check_out_time: INTEGER



   TABLE: facebook_event_checkin
   ------------------------------------------------------------
   Records attendance at social events.

   Columns:
   - person_id  : INTEGER
   - event_id   : INTEGER
   - event_name : TEXT
   - date       : INTEGER



   TABLE: income
   ------------------------------------------------------------
   Stores income data for individuals.

   Columns:
   - ssn           : CHAR
   - annual_income : INTEGER



   TABLE: solution
   ------------------------------------------------------------
   Used to submit the final answer for the investigation.

   Columns:
   - user  : INTEGER
   - value : TEXT



   ============================================================
   INVESTIGATION OBJECTIVE
   ------------------------------------------------------------
   Use SQL queries to explore the database, uncover clues,
   identify witnesses, follow evidence across tables, and
   ultimately determine who committed the murder.

   Carefully read descriptions, interview transcripts,
   and records to logically deduce the suspect.

   The entire mystery must be solved using SQL queries.
   ============================================================
*/