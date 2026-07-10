-- View 1: attendees who have purchased at least one VIP ticket.
CREATE VIEW vip_attendees AS
SELECT DISTINCT a.attendee_id,
       a.first_name,
       a.last_name,
       a.email,
       a.city
FROM attendees AS a
JOIN tickets AS t ON t.attendee_id = a.attendee_id
WHERE t.ticket_type = 'VIP';

-- Verify the VIP attendee view.
SELECT * FROM vip_attendees;

-- View 2: a reusable artist performance schedule.
CREATE VIEW artist_schedule AS
SELECT ar.name AS artist_name,
       st.name AS stage_name,
       p.festival_day,
       p.start_time,
       p.end_time
FROM performances AS p
JOIN artists AS ar ON ar.artist_id = p.artist_id
JOIN stages AS st ON st.stage_id = p.stage_id;

-- Verify the artist schedule view.
SELECT * FROM artist_schedule
ORDER BY festival_day, start_time;

-- View 3: sales totals and averages for each vendor.
CREATE VIEW vendor_sales_summary AS
SELECT v.vendor_id,
       v.name AS vendor_name,
       ROUND(SUM(s.amount), 2) AS total_sales,
       ROUND(AVG(s.amount), 2) AS average_sale_value,
       COUNT(s.sale_id) AS transaction_count
FROM vendors AS v
LEFT JOIN sales AS s ON s.vendor_id = v.vendor_id
GROUP BY v.vendor_id, v.name;

-- Verify the vendor sales summary view.
SELECT * FROM vendor_sales_summary
ORDER BY total_sales DESC;
