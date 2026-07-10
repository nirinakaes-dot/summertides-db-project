-- 1. Display attendees alphabetically by surname, then first name.
SELECT * FROM attendees
ORDER BY last_name ASC, first_name ASC;

-- 2. Show artists ordered by genre.
SELECT * FROM artists
ORDER BY genre ASC, name ASC;

-- 3. List vendors from highest to lowest rating.
SELECT * FROM vendors
ORDER BY rating DESC, name ASC;

-- 4. Display the five most expensive ticket purchases.
SELECT * FROM tickets
ORDER BY price DESC, purchase_date DESC
LIMIT 5;

-- 5. Show the first ten attendees registered.
SELECT * FROM attendees
ORDER BY attendee_id ASC
LIMIT 10;

-- 6. Display the latest ticket purchases.
SELECT * FROM tickets
ORDER BY purchase_date DESC, ticket_id DESC;

-- 7. Retrieve the three highest-rated vendors.
SELECT * FROM vendors
ORDER BY rating DESC, name ASC
LIMIT 3;
