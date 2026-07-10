-- 1. Count all registered attendees.
SELECT COUNT(*) AS total_attendees
FROM attendees;

-- 2. Find the average ticket price.
SELECT ROUND(AVG(price), 2) AS average_ticket_price
FROM tickets;

-- 3. Find the highest and lowest ticket prices.
SELECT MAX(price) AS highest_ticket_price,
       MIN(price) AS lowest_ticket_price
FROM tickets;

-- 4. Count attendees from each city.
SELECT city,
       COUNT(*) AS attendee_count
FROM attendees
GROUP BY city
ORDER BY attendee_count DESC, city ASC;

-- 5. Count artists in each genre.
SELECT genre,
       COUNT(*) AS artist_count
FROM artists
GROUP BY genre
ORDER BY artist_count DESC, genre ASC;

-- 6. Calculate the total sales amount for each vendor.
SELECT v.name AS vendor_name,
       ROUND(SUM(s.amount), 2) AS total_sales
FROM vendors AS v
JOIN sales AS s ON s.vendor_id = v.vendor_id
GROUP BY v.vendor_id, v.name
ORDER BY total_sales DESC;

-- 7. Find the festival day with the most ticket sales.
SELECT festival_day,
       COUNT(*) AS tickets_sold
FROM tickets
GROUP BY festival_day
ORDER BY tickets_sold DESC, festival_day ASC
LIMIT 1;

-- 8. Show vendors whose sales exceed KES 2,000.
SELECT v.name AS vendor_name,
       ROUND(SUM(s.amount), 2) AS total_sales
FROM vendors AS v
JOIN sales AS s ON s.vendor_id = v.vendor_id
GROUP BY v.vendor_id, v.name
HAVING SUM(s.amount) > 2000
ORDER BY total_sales DESC;
