-- 1. Group ticket prices into useful price bands.
SELECT ticket_id,
       price,
       CASE
           WHEN price < 5000 THEN 'Budget'
           WHEN price < 9000 THEN 'Standard'
           ELSE 'VIP'
       END AS price_category
FROM tickets;

-- 2. Classify attendees by age group.
SELECT first_name || ' ' || last_name AS attendee_name,
       age,
       CASE
           WHEN age < 25 THEN 'Youth'
           WHEN age < 60 THEN 'Adult'
           ELSE 'Senior'
       END AS age_group
FROM attendees;

-- 3. Categorise vendor ratings.
SELECT name AS vendor_name,
       rating,
       CASE
           WHEN rating >= 4.5 THEN 'Excellent'
           WHEN rating >= 4.0 THEN 'Good'
           ELSE 'Needs Improvement'
       END AS rating_category
FROM vendors;

-- 4. Label artists as local or international acts.
SELECT name AS artist_name,
       country,
       CASE
           WHEN country = 'Kenya' THEN 'Local'
           ELSE 'International'
       END AS artist_category
FROM artists;
