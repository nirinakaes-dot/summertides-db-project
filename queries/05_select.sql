-- 1. Display all registered attendees.
SELECT *
FROM attendees;

-- 2. Display all artists on the festival line-up.
SELECT *
FROM artists;

-- 3. Show attendee names and email addresses only.
SELECT first_name, last_name, email
FROM attendees;

-- 4. Show each city represented by registered attendees once.
SELECT DISTINCT city
FROM attendees;

-- 5. Use clear aliases for an attendee contact list.
SELECT first_name || ' ' || last_name AS attendee_name,
       email AS contact_email
FROM attendees;

-- 6. Retrieve the available ticket types.
SELECT DISTINCT ticket_type
FROM tickets;

-- 7. Display all festival vendors.
SELECT *
FROM vendors;

-- 8. Display all festival stages.
SELECT *
FROM stages;
