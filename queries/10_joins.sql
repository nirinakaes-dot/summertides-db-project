-- 1. Display attendees together with their ticket information.
SELECT a.first_name || ' ' || a.last_name AS attendee_name,
       t.ticket_type,
       t.price,
       t.festival_day
FROM attendees AS a
JOIN tickets AS t ON t.attendee_id = a.attendee_id
ORDER BY a.last_name, t.festival_day;

-- 2. Show artists and the stages where they perform.
SELECT DISTINCT ar.name AS artist_name,
       st.name AS stage_name
FROM artists AS ar
JOIN performances AS p ON p.artist_id = ar.artist_id
JOIN stages AS st ON st.stage_id = p.stage_id
ORDER BY artist_name, stage_name;

-- 3. Display every performance with its artist and stage.
SELECT p.festival_day,
       p.start_time,
       p.end_time,
       ar.name AS artist_name,
       st.name AS stage_name
FROM performances AS p
JOIN artists AS ar ON ar.artist_id = p.artist_id
JOIN stages AS st ON st.stage_id = p.stage_id
ORDER BY p.festival_day, p.start_time;

-- 4. List vendors together with attendees who purchased from them.
SELECT v.name AS vendor_name,
       a.first_name || ' ' || a.last_name AS attendee_name,
       s.amount AS sale_amount
FROM sales AS s
JOIN vendors AS v ON v.vendor_id = s.vendor_id
JOIN attendees AS a ON a.attendee_id = s.attendee_id
ORDER BY v.name, attendee_name;

-- 5. Display sponsors alongside the stages they sponsor.
SELECT sp.name AS sponsor_name,
       st.name AS stage_name,
       sp.contribution_amount
FROM stage_sponsors AS ss
JOIN sponsors AS sp ON sp.sponsor_id = ss.sponsor_id
JOIN stages AS st ON st.stage_id = ss.stage_id
ORDER BY stage_name, sponsor_name;

-- 6. Show artists without a scheduled performance.
SELECT ar.name AS artist_name,
       ar.genre,
       ar.country
FROM artists AS ar
LEFT JOIN performances AS p ON p.artist_id = ar.artist_id
WHERE p.performance_id IS NULL;

-- 7. Retrieve the 15 August 2026 performance schedule.
SELECT ar.name AS artist_name,
       st.name AS stage_name,
       p.start_time,
       p.end_time
FROM performances AS p
JOIN artists AS ar ON ar.artist_id = p.artist_id
JOIN stages AS st ON st.stage_id = p.stage_id
WHERE p.festival_day = '2026-08-15'
ORDER BY p.start_time, st.name;
