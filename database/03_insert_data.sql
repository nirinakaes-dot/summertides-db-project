 
ALTER TABLE attendees ADD COLUMN phone VARCHAR;
ALTER TABLE attendees ADD COLUMN age INTEGER;
ALTER TABLE attendees ADD COLUMN city VARCHAR;
ALTER TABLE tickets ADD COLUMN price DECIMAL;
ALTER TABLE tickets ADD COLUMN festival_day DATE;
ALTER TABLE vendors ADD COLUMN rating DECIMAL;
 
-- Attendees (20)
-- 3 attendees left with NULL phone on purpose, for the
-- "phone number missing" filtering exercise.

INSERT INTO attendees (first_name, last_name, email, phone, age, city) VALUES
('Wanjiru', 'Kamau', 'wanjiru.kamau@gmail.com', '0722111222', 24, 'Nairobi'),
('Brian', 'Otieno', 'brian.otieno@gmail.com', '0733222333', 29, 'Kisumu'),
('Amina', 'Hassan', 'amina.hassan@gmail.com', NULL, 22, 'Mombasa'),
('Kevin', 'Mwangi', 'kevin.mwangi@gmail.com', '0711333444', 31, 'Nairobi'),
('Faith', 'Chebet', 'faith.chebet@gmail.com', '0700444555', 19, 'Eldoret'),
('David', 'Kiptoo', 'david.kiptoo@gmail.com', '0722555666', 35, 'Nakuru'),
('Grace', 'Wambui', 'grace.wambui@gmail.com', NULL, 27, 'Nairobi'),
('Peter', 'Njoroge', 'peter.njoroge@gmail.com', '0733666777', 41, 'Thika'),
('Mercy', 'Adhiambo', 'mercy.adhiambo@gmail.com', '0711777888', 23, 'Kisumu'),
('Samuel', 'Kimani', 'samuel.kimani@gmail.com', '0700888999', 26, 'Nairobi'),
('Linet', 'Achieng', 'linet.achieng@gmail.com', '0722999000', 30, 'Mombasa'),
('John', 'Mutua', 'john.mutua@gmail.com', NULL, 45, 'Machakos'),
('Esther', 'Nyambura', 'esther.nyambura@gmail.com', '0733000111', 21, 'Nairobi'),
('Collins', 'Odhiambo', 'collins.odhiambo@gmail.com', '0711222111', 33, 'Kisumu'),
('Ann', 'Wairimu', 'ann.wairimu@gmail.com', '0700333222', 28, 'Nakuru'),
('Moses', 'Barasa', 'moses.barasa@gmail.com', '0722444333', 37, 'Eldoret'),
('Sarah', 'Njeri', 'sarah.njeri@gmail.com', '0733555444', 24, 'Nairobi'),
('Dennis', 'Kiplagat', 'dennis.kiplagat@gmail.com', '0711666555', 29, 'Malindi'),
('Purity', 'Wangui', 'purity.wangui@gmail.com', '0700777666', 20, 'Nairobi'),
('Victor', 'Omondi', 'victor.omondi@gmail.com', '0722888777', 32, 'Mombasa');
 
-- Artists (15)
INSERT INTO artists (name, genre, country) VALUES
('Sauti Sol', 'Afrobeats', 'Kenya'),
('Nyashinski', 'Hip Hop', 'Kenya'),
('Bien', 'RnB', 'Kenya'),
('Diamond Platnumz', 'Bongo Flava', 'Tanzania'),
('Burna Boy', 'Afrobeats', 'Nigeria'),
('Wizkid', 'Afrobeats', 'Nigeria'),
('Eddy Kenzo', 'Afrobeats', 'Uganda'),
('Sho Madjozi', 'Amapiano', 'South Africa'),
('Femi One', 'Gengetone', 'Kenya'),
('Khaligraph Jones', 'Hip Hop', 'Kenya'),
('Suzanna Owiyo', 'Benga', 'Kenya'),
('Protoje', 'Reggae', 'Jamaica'),
('Black Coffee', 'EDM', 'South Africa'),
('Vybz Kartel', 'Dancehall', 'Jamaica'),
('Ayra Starr', 'Afrobeats', 'Nigeria');
 
-- Stages (6)
INSERT INTO stages (name, capacity, location) VALUES
('Main Stage', 8000, 'Beachfront'),
('Sunset Stage', 4000, 'North Beach'),
('Beach Arena', 6000, 'South Beach'),
('Acoustic Tent', 1500, 'Garden Area'),
('Electronic Dome', 3000, 'East Field'),
('Cultural Stage', 2000, 'Village Square');
 
-- Vendors (10) - rating added via patch above
INSERT INTO vendors (name, category, location, rating) VALUES
('Coastal Grill', 'Food', 'Main Stage Row', 4.5),
('Mama Oliech Eats', 'Food', 'Main Stage Row', 4.8),
('Tropical Juice Bar', 'Beverages', 'Sunset Stage Row', 4.2),
('Craft Beer Co', 'Beverages', 'Beach Arena Row', 4.0),
('Kitenge Fashion', 'Merchandise', 'Village Square', 4.6),
('Beach Art Gallery', 'Art', 'Garden Area', 4.9),
('Nyama Choma Corner', 'Food', 'Beach Arena Row', 4.3),
('SummerTides Merch', 'Merchandise', 'Main Stage Row', 4.1),
('Chapati Junction', 'Food', 'Village Square', 3.8),
('Cold Coffee Cart', 'Beverages', 'East Field', 4.4);
 
-- Sponsors (8)
INSERT INTO sponsors (name, contribution_amount) VALUES
('Safaricom', 5000000.00),
('KCB Bank', 3000000.00),
('Tusker', 2500000.00),
('Coca-Cola', 2000000.00),
('Airtel Kenya', 1500000.00),
('Java House', 1000000.00),
('Absa Bank', 1800000.00),
('Betika', 1200000.00);

-- Tickets (40) - price / festival_day added via patch above
-- ticket_type restricted to VIP/General by the CHECK constraint,
-- but prices are varied within 'General' so Part 7's CASE
-- exercise (Budget / Standard / VIP) still has 3 real bands.
INSERT INTO tickets (attendee_id, ticket_type, price, purchase_date, festival_day) VALUES
(1, 'General', 2800.00, '2026-07-01', '2026-08-14'),
(1, 'VIP', 9500.00, '2026-07-15', '2026-08-15'),
(2, 'General', 2800.00, '2026-07-02', '2026-08-14'),
(2, 'General', 6200.00, '2026-07-20', '2026-08-16'),
(3, 'VIP', 9500.00, '2026-07-05', '2026-08-14'),
(3, 'General', 2800.00, '2026-07-10', '2026-08-15'),
(4, 'VIP', 11000.00, '2026-06-25', '2026-08-14'),
(4, 'General', 2800.00, '2026-07-18', '2026-08-16'),
(5, 'General', 6200.00, '2026-07-03', '2026-08-15'),
(5, 'VIP', 9500.00, '2026-07-22', '2026-08-16'),
(6, 'General', 2800.00, '2026-07-01', '2026-08-14'),
(6, 'General', 2800.00, '2026-07-01', '2026-08-15'),
(7, 'VIP', 9500.00, '2026-06-30', '2026-08-14'),
(7, 'General', 6200.00, '2026-07-25', '2026-08-16'),
(8, 'General', 2800.00, '2026-07-04', '2026-08-14'),
(8, 'VIP', 11000.00, '2026-07-04', '2026-08-15'),
(9, 'General', 2800.00, '2026-07-06', '2026-08-15'),
(9, 'General', 2800.00, '2026-07-06', '2026-08-16'),
(10, 'VIP', 9500.00, '2026-07-07', '2026-08-14'),
(10, 'General', 6200.00, '2026-07-07', '2026-08-15'),
(11, 'General', 2800.00, '2026-07-08', '2026-08-16'),
(11, 'General', 2800.00, '2026-07-08', '2026-08-14'),
(12, 'VIP', 9500.00, '2026-07-09', '2026-08-15'),
(12, 'General', 2800.00, '2026-07-09', '2026-08-16'),
(13, 'General', 6200.00, '2026-07-11', '2026-08-14'),
(13, 'General', 2800.00, '2026-07-11', '2026-08-15'),
(14, 'VIP', 11000.00, '2026-06-28', '2026-08-16'),
(14, 'General', 2800.00, '2026-07-12', '2026-08-14'),
(15, 'General', 2800.00, '2026-07-13', '2026-08-15'),
(15, 'VIP', 9500.00, '2026-07-13', '2026-08-16'),
(16, 'General', 2800.00, '2026-07-14', '2026-08-14'),
(16, 'General', 6200.00, '2026-07-14', '2026-08-16'),
(17, 'VIP', 9500.00, '2026-07-16', '2026-08-15'),
(17, 'General', 2800.00, '2026-07-16', '2026-08-14'),
(18, 'General', 2800.00, '2026-07-17', '2026-08-16'),
(18, 'General', 6200.00, '2026-07-17', '2026-08-15'),
(19, 'VIP', 9500.00, '2026-07-19', '2026-08-14'),
(19, 'General', 2800.00, '2026-07-19', '2026-08-16'),
(20, 'General', 2800.00, '2026-07-21', '2026-08-15'),
(20, 'VIP', 11000.00, '2026-07-21', '2026-08-14');
 
-- Performances (30) - festival_day added via patch above
-- Sauti Sol (artist_id 1) deliberately booked 3 times, so
-- "which artist performs the most" has a clear winner.
INSERT INTO performances (artist_id, stage_id, start_time, end_time, festival_day) VALUES
(1, 1, '20:00:00', '21:30:00', '2026-08-14'),
(2, 2, '18:00:00', '19:00:00', '2026-08-14'),
(3, 1, '22:00:00', '23:00:00', '2026-08-14'),
(4, 3, '19:00:00', '20:30:00', '2026-08-14'),
(5, 1, '21:00:00', '22:30:00', '2026-08-15'),
(6, 2, '19:30:00', '20:30:00', '2026-08-15'),
(7, 4, '16:00:00', '17:00:00', '2026-08-14'),
(8, 5, '22:00:00', '23:30:00', '2026-08-15'),
(9, 6, '14:00:00', '15:00:00', '2026-08-14'),
(10, 2, '20:00:00', '21:00:00', '2026-08-15'),
(11, 4, '15:00:00', '16:00:00', '2026-08-16'),
(12, 3, '19:00:00', '20:00:00', '2026-08-16'),
(13, 5, '21:00:00', '23:00:00', '2026-08-16'),
(14, 3, '22:30:00', '23:59:00', '2026-08-15'),
(15, 1, '20:00:00', '21:00:00', '2026-08-16'),
(1, 3, '18:00:00', '19:00:00', '2026-08-16'),
(5, 2, '20:30:00', '21:30:00', '2026-08-16'),
(6, 1, '17:00:00', '18:00:00', '2026-08-14'),
(9, 6, '15:00:00', '16:00:00', '2026-08-15'),
(10, 4, '17:00:00', '18:00:00', '2026-08-16'),
(1, 1, '14:00:00', '15:00:00', '2026-08-15'),
(3, 2, '14:30:00', '15:30:00', '2026-08-16'),
(4, 1, '17:30:00', '18:30:00', '2026-08-15'),
(7, 3, '16:00:00', '17:00:00', '2026-08-15'),
(8, 6, '19:30:00', '20:30:00', '2026-08-14'),
(11, 5, '21:00:00', '22:00:00', '2026-08-14'),
(12, 6, '16:30:00', '17:30:00', '2026-08-16'),
(13, 4, '18:30:00', '19:30:00', '2026-08-14'),
(14, 1, '22:00:00', '23:00:00', '2026-08-16'),
(15, 5, '18:00:00', '19:00:00', '2026-08-15');
 

-- Sales (50),
-- attendee_id is NOT NULL per the team schema, so every
-- sale is tied to a real attendee (no anonymous sales here).
INSERT INTO sales (vendor_id, attendee_id, amount) VALUES
(1, 1, 350.00), (2, 2, 450.00), (3, 3, 200.00), (4, 4, 300.00), (5, 5, 1500.00),
(6, 6, 3500.00), (7, 7, 600.00), (8, 8, 1200.00), (9, 9, 250.00), (10, 10, 180.00),
(1, 11, 360.00), (2, 12, 470.00), (3, 13, 210.00), (4, 14, 320.00), (5, 15, 1550.00),
(6, 16, 3600.00), (7, 17, 620.00), (8, 18, 1250.00), (9, 19, 260.00), (10, 20, 190.00),
(1, 1, 340.00), (2, 2, 460.00), (3, 3, 220.00), (4, 4, 310.00), (5, 5, 1600.00),
(6, 6, 3400.00), (7, 7, 610.00), (8, 8, 1150.00), (9, 9, 240.00), (10, 10, 170.00),
(1, 11, 355.00), (2, 12, 440.00), (3, 13, 230.00), (4, 14, 330.00), (5, 15, 1450.00),
(6, 16, 3550.00), (7, 17, 595.00), (8, 18, 1225.00), (9, 19, 255.00), (10, 20, 175.00),
(1, 10, 345.00), (2, 9, 455.00), (3, 8, 205.00), (4, 7, 295.00), (5, 6, 1525.00),
(6, 5, 3480.00), (7, 15, 615.00), (8, 16, 1275.00), (9, 20, 245.00), (10, 3, 165.00);
 
-- Stage_Sponsors (14)
INSERT INTO stage_sponsors (stage_id, sponsor_id) VALUES
(1, 1), (1, 2),
(2, 3), (2, 4),
(3, 1), (3, 5),
(4, 6),
(5, 7), (5, 8),
(6, 3), (6, 6),
(1, 8),
(2, 7),
(4, 4);
 