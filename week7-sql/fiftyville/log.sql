-- Step 1: Look up the crime report
-- Goal: Identify more details of the crime on Humphrey Street on July 28
SELECT
    description
FROM crime_scene_reports
WHERE
    year = 2024
    AND month = 7
    AND day = 28
    AND street = 'Humphrey Street';
-- Just found that: Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery.
************************************************************************************************

-- Step 2: Review interviews conducted on the day of the crime
-- Goal: Extract clues mentioned by witnesses
SELECT
    name,
    transcript
FROM interviews
WHERE
    year = 2024
    AND month = 7
    AND day = 28;

-- Result:
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|  name   |                                                                                                                                                     transcript                                                                                                                                                      |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Jose    | “Ah,” said he, “I forgot that I had not seen you for some weeks. It is a little souvenir from the King of Bohemia in return for my assistance in the case of the Irene Adler papers.”                                                                                                                               |
| Eugene  | “I suppose,” said Holmes, “that when Mr. Windibank came back from France he was very annoyed at your having gone to the ball.”                                                                                                                                                                                      |
| Barbara | “You had my note?” he asked with a deep harsh voice and a strongly marked German accent. “I told you that I would call.” He looked from one to the other of us, as if uncertain which to address.                                                                                                                   |
| Ruth    | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.                                                          |
| Eugene  | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.                                                                                                 |
| Raymond | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket. |
| Lily    | Our neighboring courthouse has a very annoying rooster that crows loudly at 6am every day. My sons Robert and Patrick took the rooster to a city far, far away, so it may never bother us again. My sons have successfully arrived in Paris.'                                                                       |
+---------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

************************************************************************************************

-- Step 3: Check bakery security logs, based on Ruth´s interview
-- Goal: Identify cars that exited the bakery parking lot shortly after the crime
SELECT
    license_plate,
    hour,
    minute
FROM bakery_security_logs
WHERE
    year = 2024
    AND month = 7
    AND day = 28
    AND activity = 'exit';

-- Result:
+---------------+------+--------+
| license_plate | hour | minute |
+---------------+------+--------+
| 1M92998       | 8    | 2      |
| N507616       | 8    | 2      |
| 7Z8B130       | 8    | 7      |
| 47MEFVA       | 8    | 13     |
| D965M59       | 8    | 15     |
| HW0488P       | 8    | 15     |
| HOD8639       | 8    | 25     |
| L68E5I0       | 8    | 34     |
| W2CT78U       | 8    | 34     |
| 3933NUH       | 8    | 38     |
| 1FBL6TH       | 8    | 44     |
| P14PE2Q       | 8    | 49     |
| 4V16VO0       | 8    | 50     |
| 8LLB02B       | 8    | 57     |
| O784M2U       | 8    | 59     |
| 5P2BI95       | 10   | 16     |*suspect based on Ruth´s testimony - no
| 94KL13X       | 10   | 18     |*suspect based on Ruth´s testimony - Bruce
| 6P58WS2       | 10   | 18     |*suspect based on Ruth´s testimony - no
| 4328GD8       | 10   | 19     |*suspect based on Ruth´s testimony - no (Luca)
| G412CB7       | 10   | 20     |*suspect based on Ruth´s testimony - no (Sofia)
| L93JTIZ       | 10   | 21     |*suspect based on Ruth´s testimony - no
| 322W7JE       | 10   | 23     |*suspect based on Ruth´s testimony - no (Diana)
| 0NTHK55       | 10   | 23     |*suspect based on Ruth´s testimony - no
| 1106N58       | 10   | 35     |
| NAW9653       | 14   | 18     |
| RS7I6A0       | 15   | 6      |
| 94MV71O       | 15   | 16     |
| WD5M8I6       | 16   | 6      |
| 4468KVT       | 16   | 38     |
| 207W38T       | 16   | 42     |
| C194752       | 16   | 47     |
| NRYN856       | 17   | 11     |
| 13FNH73       | 17   | 15     |
| V47T75I       | 17   | 16     |
| R3G7486       | 17   | 18     |
| FLFN3W0       | 17   | 36     |
| 4963D92       | 17   | 47     |
+---------------+------+--------+

-- Ruth: "within ten minutes of the theft"

************************************************************************************************

-- Step 4: Match license plates (from step 3) to registered owners, so we have a list of suspect´s names
-- Goal: Identify people who own the suspicious vehicles
SELECT
    name,
    phone_number,
    passport_number,
    license_plate,
FROM people
WHERE license_plate IN (
    SELECT license_plate
    -- license plates identified in Step 3
    FROM bakery_security_logs
    WHERE
        year = 2024
        AND month = 7
        AND day = 28
        AND activity = 'exit'
);

-- Result:
+---------+----------------+-----------------+---------------+
|  name   |  phone_number  | passport_number | license_plate |
+---------+----------------+-----------------+---------------+
| Jordan  | (328) 555-9658 | 7951366683      | HW0488P       |
| Vanessa | (725) 555-4692 | 2963008352      | 5P2BI95       |
| Barry   | (301) 555-4174 | 7526138472      | 6P58WS2       |
| Martha  | (007) 555-2874 | NULL            | O784M2U       |
| Brandon | (771) 555-6667 | 7874488539      | R3G7486       |
| Carolyn | (234) 555-1294 | 3925120216      | P14PE2Q       |
| Joshua  | (267) 555-2761 | 3761239013      | 1FBL6TH       |
| Debra   | NULL           | 2750542732      | 47MEFVA       |
| Iman    | (829) 555-5269 | 7049073643      | L93JTIZ       |
| Sofia   | (130) 555-0289 | 1695452385      | G412CB7       |
| Taylor  | (286) 555-6063 | 1988161715      | 1106N58       |*suspect
| Luca    | (389) 555-5198 | 8496433585      | 4328GD8       |
| Wayne   | (056) 555-0309 | NULL            | D965M59       |
| Diana   | (770) 555-1861 | 3592750733      | 322W7JE       |*suspect
| Michael | (529) 555-7276 | 6117294637      | HOD8639       |
| Kelsey  | (499) 555-9472 | 8294398571      | 0NTHK55       |
| Vincent | NULL           | 3011089587      | 94MV71O       |
| Mary    | (188) 555-4719 | NULL            | C194752       |
| Ralph   | (771) 555-7880 | 6464352048      | 3933NUH       |
| Peter   | (751) 555-6567 | 9224308981      | N507616       |
| Amanda  | (821) 555-5262 | 1618186613      | RS7I6A0       |
| Denise  | (994) 555-3373 | 4001449165      | NRYN856       |
| Thomas  | (286) 555-0131 | 6034823042      | WD5M8I6       |
| John    | (016) 555-9166 | 8174538026      | 4468KVT       |
| Ethan   | (594) 555-6254 | 2996517496      | NAW9653       |
| Bruce   | (367) 555-5533 | 5773159633      | 94KL13X       |*suspect
| Rachel  | (006) 555-0505 | NULL            | 7Z8B130       |
| Donna   | NULL           | NULL            | 8LLB02B       |
| Sophia  | (027) 555-1068 | 3642612721      | 13FNH73       |
| Judith  | NULL           | 8284363264      | 4963D92       |
| Jeremy  | (194) 555-5027 | 1207566299      | V47T75I       |
| Daniel  | (971) 555-6468 | 7597790505      | FLFN3W0       |
| George  | NULL           | 4977790793      | L68E5I0       |
| Alice   | (031) 555-9915 | 1679711307      | 1M92998       |
| Andrew  | (579) 555-5030 | NULL            | W2CT78U       |
| Robin   | (375) 555-8161 | NULL            | 4V16VO0       |
| Frank   | (356) 555-6641 | 8336437534      | 207W38T       |
+---------+----------------+-----------------+---------------+

************************************************************************************************

-- Step 5: Identify people who withdrew cash on the day of the crime, based on Eugene´s testimony
-- Goal: Narrow suspects using ATM withdrawal records
SELECT
    people.name,
    atm_transactions.amount,
    atm_transactions.atm_location
FROM atm_transactions
JOIN bank_accounts ON atm_transactions.account_number = bank_accounts.account_number
JOIN people ON bank_accounts.person_id = people.id
WHERE
    atm_transactions.year = 2024
    AND atm_transactions.month = 7
    AND atm_transactions.day = 28
    AND atm_location = 'Leggett Street' -- from Eugene´s testimony
    AND atm_transactions.transaction_type = 'withdraw';

-- Result:
+---------+--------+----------------+
|  name   | amount |  atm_location  |
+---------+--------+----------------+
| Bruce   | 50     | Leggett Street |
| Diana   | 35     | Leggett Street |
| Brooke  | 80     | Leggett Street |
| Kenny   | 20     | Leggett Street |
| Iman    | 20     | Leggett Street |
| Luca    | 48     | Leggett Street |
| Taylor  | 60     | Leggett Street |
| Benista | 30     | Leggett Street |
+---------+--------+----------------+

************************************************************************************************

-- Step 6: Find short phone calls made on the day of the crime, because Raymond´s testimony
-- Goal: Identify possible communication between thief and accomplice
SELECT
    caller.name AS caller,
    receiver.name AS receiver,
    phone_calls.duration
FROM phone_calls
JOIN people AS caller ON phone_calls.caller = caller.phone_number
JOIN people AS receiver ON phone_calls.receiver = receiver.phone_number
WHERE
    phone_calls.year = 2024
    AND phone_calls.month = 7
    AND phone_calls.day = 28
    AND phone_calls.duration < 60;

-- Result:
+---------+------------+----------+
| caller  |  receiver  | duration |
+---------+------------+----------+
| Sofia   | Jack       | 51       |
| Kelsey  | Larry      | 36       |
| Bruce   | Robin      | 45       |*
| Kelsey  | Melissa    | 50       |
| Taylor  | James      | 43       |*
| Diana   | Philip     | 49       |*
| Carina  | Jacqueline | 38       |
| Kenny   | Doris      | 55       |*
| Benista | Anna       | 54       |*
+---------+------------+----------+

************************************************************************************************

-- Step 7A: Find the airport located in Fiftyville, also because Raymond´s testimony
SELECT
    id,
    abbreviation
FROM airports
WHERE city = 'Fiftyville';

-- Result (Location: Creil, France (near Paris)):
+----+--------------+
| id | abbreviation |
+----+--------------+
| 8  | CSF          |
+----+--------------+

************************************************************************************************

-- Step 8: Find flights leaving Fiftyville on July 29, also because Raymond´s testimony
-- Goal: Identify possible escape flights
SELECT
    id,
    destination_airport_id,
    hour,
    minute
FROM flights
WHERE
    year = 2024
    AND month = 7
    AND day = 29
    -- ID from step 7 = 8
    AND origin_airport_id = 8;

-- Result:
+----+------------------------+------+--------+
| id | destination_airport_id | hour | minute |
+----+------------------------+------+--------+
| 18 | 6                      | 16   | 0      |
| 23 | 11                     | 12   | 15     |
| 36 | 4                      | 8    | 20     |
| 43 | 1                      | 9    | 30     |
| 53 | 9                      | 15   | 20     |
+----+------------------------+------+--------+

-- earliest flight = id 36

************************************************************************************************

-- Step 9: Identify passengers on the flight ("they were planning to take the earliest flight out of Fiftyville")
-- Goal: Confirm which suspect escaped Fiftyville
SELECT
    people.name
FROM passengers
JOIN people ON passengers.passport_number = people.passport_number
WHERE
    passengers.flight_id = 36;

-- Result:
-- FLIGHT_ID = 36 (earliest)
+--------+
|  name  |
+--------+
| Doris  |
| Sofia  |
| Bruce  |
| Edward |
| Kelsey |
| Taylor |
| Kenny  |
| Luca   |
+--------+

************************************************************************************************

-- After analyzing the crime report, I identified the date, location, and approximate time of the theft.
-- From the witness interviews, I learned that the thief left the area shortly after the crime, withdrew money from an ATM, made a short phone call, and escaped Fiftyville on the earliest flight the next day.

-- I then checked the bakery security logs to find which cars exited around the time of the theft and matched those license plates to people in the database.
-- Next, I cross-referenced those suspects with ATM withdrawal records from the same day and identified which of them made a short phone call shortly after the crime.

-- Finally, I examined the passenger list of the earliest flight leaving Fiftyville on July 29 and found that Bruce was the only suspect who appeared consistently across all these pieces of evidence.

-- Therefore, based on vehicle movement, financial activity, phone records, and flight data, Bruce is the main suspect.


************************************************************************************************

-- Finding the destination airport of the earliest flight
-- Goal: Identify the city where the thief escaped to
SELECT
    airports.city,
    airports.full_name,
    airports.abbreviation
FROM flights
JOIN airports ON flights.destination_airport_id = airports.id
WHERE flights.id = 36;

-- Result:
+---------------+-------------------+--------------+
|     city      |     full_name     | abbreviation |
+---------------+-------------------+--------------+
| New York City | LaGuardia Airport | LGA          |
+---------------+-------------------+--------------+
************************************************************************************************
