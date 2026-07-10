-- 1. Find attendees older than 25.
SELECT * FROM attendees
WHERE age > 25;

-- 2. Find attendees from Nairobi.
SELECT * FROM attendees
WHERE city = 'Nairobi';

-- 3. Display VIP tickets only.
SELECT * FROM tickets
WHERE ticket_type = 'VIP';

-- 4. Show tickets costing more than KES 5,000.
SELECT * FROM tickets
WHERE price > 5000;

-- 5. Find artists from Kenya.
SELECT * FROM artists
WHERE country = 'Kenya';

-- 6. Display vendors rated above 4.
SELECT * FROM vendors
WHERE rating > 4;

-- 7. Find attendees whose first names start with A.
SELECT * FROM attendees
WHERE first_name LIKE 'A%';

-- 8. Display performances starting between 6:00 PM and 10:00 PM.
SELECT * FROM performances
WHERE start_time BETWEEN '18:00:00' AND '22:00:00';

-- 9. Show tickets purchased on 7 July 2026.
SELECT * FROM tickets
WHERE purchase_date = '2026-07-07';

-- 10. Find attendees whose phone number is missing.
SELECT * FROM attendees
WHERE phone IS NULL;
