PRAGMA foreign_keys = ON;

-- Check 1: no ticket has a negative price
SELECT 'Bad ticket price' AS issue, * FROM tickets WHERE price < 0;

-- Check 2: no ticket_type outside VIP/General
SELECT 'Invalid ticket_type' AS issue, * FROM tickets
WHERE ticket_type NOT IN ('VIP', 'General');

-- Check 3: no performance where end_time is before or equal to start_time
SELECT 'Invalid performance time range' AS issue, * FROM performances
WHERE end_time <= start_time;

-- Check 4: no stage with zero or negative capacity
SELECT 'Invalid stage capacity' AS issue, * FROM stages
WHERE capacity <= 0;

-- Check 5: no negative sponsor contributions
SELECT 'Negative sponsor contribution' AS issue, * FROM sponsors
WHERE contribution_amount < 0;

-- Check 6: no zero or negative vendor sales
SELECT 'Invalid sale amount' AS issue, * FROM sales
WHERE amount <= 0;

-- Check 7: double-booked artist (same artist, same start_time, different stage)
SELECT 'Double-booked artist' AS issue, artist_id, start_time, COUNT(*) AS bookings
FROM performances
GROUP BY artist_id, start_time
HAVING COUNT(*) > 1;

-- Check 8: double-booked stage (same stage, same start_time, different artist)
SELECT 'Double-booked stage' AS issue, stage_id, start_time, COUNT(*) AS bookings
FROM performances
GROUP BY stage_id, start_time
HAVING COUNT(*) > 1;

-- Check 9: tickets referencing an attendee_id that doesn't exist
SELECT 'Orphaned ticket' AS issue, * FROM tickets
WHERE attendee_id IS NOT NULL
  AND attendee_id NOT IN (SELECT attendee_id FROM attendees);

-- Check 10: sales referencing a vendor_id or attendee_id that doesn't exist
SELECT 'Orphaned sale' AS issue, * FROM sales
WHERE vendor_id NOT IN (SELECT vendor_id FROM vendors)
   OR attendee_id NOT IN (SELECT attendee_id FROM attendees);