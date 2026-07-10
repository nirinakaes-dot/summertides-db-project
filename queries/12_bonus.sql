-- 1. Find the artist with the most scheduled performances.
SELECT ar.name AS artist_name,
       COUNT(p.performance_id) AS performance_count
FROM artists AS ar
JOIN performances AS p ON p.artist_id = ar.artist_id
GROUP BY ar.artist_id, ar.name
ORDER BY performance_count DESC, artist_name ASC
LIMIT 1;

-- 2. Find the stage hosting the highest number of performances.
SELECT st.name AS stage_name,
       COUNT(p.performance_id) AS performance_count
FROM stages AS st
JOIN performances AS p ON p.stage_id = st.stage_id
GROUP BY st.stage_id, st.name
ORDER BY performance_count DESC, stage_name ASC
LIMIT 1;

-- 3. Find the vendor that generated the highest revenue.
SELECT v.name AS vendor_name,
       ROUND(SUM(s.amount), 2) AS total_revenue
FROM vendors AS v
JOIN sales AS s ON s.vendor_id = v.vendor_id
GROUP BY v.vendor_id, v.name
ORDER BY total_revenue DESC
LIMIT 1;

-- 4. Find the attendee who spent the most with vendors.
SELECT a.first_name || ' ' || a.last_name AS attendee_name,
       ROUND(SUM(s.amount), 2) AS total_spent
FROM attendees AS a
JOIN sales AS s ON s.attendee_id = a.attendee_id
GROUP BY a.attendee_id, a.first_name, a.last_name
ORDER BY total_spent DESC
LIMIT 1;

-- 5. Find the city with the highest number of attendees.
SELECT city,
       COUNT(*) AS attendee_count
FROM attendees
GROUP BY city
ORDER BY attendee_count DESC, city ASC
LIMIT 1;

-- 6. Find the festival day with the highest ticket revenue.
SELECT festival_day,
       ROUND(SUM(price), 2) AS ticket_revenue
FROM tickets
GROUP BY festival_day
ORDER BY ticket_revenue DESC, festival_day ASC
LIMIT 1;

-- 7. Find the sponsor making the largest contribution.
SELECT name AS sponsor_name,
       contribution_amount
FROM sponsors
ORDER BY contribution_amount DESC
LIMIT 1;

-- 8. Calculate total expected ticket revenue.
SELECT ROUND(SUM(price), 2) AS expected_ticket_revenue
FROM tickets;

-- 9. Find the ticket type purchased most often.
SELECT ticket_type,
       COUNT(*) AS tickets_purchased
FROM tickets
GROUP BY ticket_type
ORDER BY tickets_purchased DESC, ticket_type ASC
LIMIT 1;
