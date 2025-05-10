USE airbnb_database;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Message;
TRUNCATE TABLE Review;
TRUNCATE TABLE Payment;
TRUNCATE TABLE Booking;
TRUNCATE TABLE Property;
TRUNCATE TABLE User;
SET FOREIGN_KEY_CHECKS = 1;

-- Seed User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'John', 'Doe', 'john@example.com', '$2a$10$XdS5CQgNX9EreW.9kH9V/e1jf0l5r7O/LVIO8xM5q5IrLtj.BxLe.', '+1234567890', 'guest'),
('b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Jane', 'Smith', 'jane@example.com', '$2a$10$pKgnmfT6AW.FpSxR3pmZLO5wvTFMVq6LVYYw9A1p8g17O/YmI1.Ny', '+2345678901', 'host'),
('c3d4e5f6-a7b8-9012-cdef-345678901234', 'Michael', 'Johnson', 'michael@example.com', '$2a$10$6xpCDYe0DUUvj6/XLAkOZuzG73IHm2CxOe6Qgoz16.vAm7VnFDK3a', '+3456789012', 'guest'),
('d4e5f6a7-b8c9-0123-defg-456789012345', 'Sarah', 'Williams', 'sarah@example.com', '$2a$10$KJYfxN.O7ZEZwIkNP2sY3e5H.V7Zmk9DYg1s1PAzp5vUEt/J9Sgdi', '+4567890123', 'host'),
('e5f6a7b8-c9d0-1234-efgh-567890123456', 'Admin', 'User', 'admin@example.com', '$2a$10$LfQwDgOp4t.wT9wHnYPT3exA6yVgNn2vr.XrF/QkdxwBVWdNWFOp2', '+5678901234', 'admin');

-- Seed Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight) VALUES
('f6a7b8c9-d0e1-2345-fghi-678901234567', 'b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Beachfront Villa', 'Luxurious villa with stunning ocean views', 'Miami, FL', 299.99),
('a7b8c9d0-e1f2-3456-ghij-789012345678', 'b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Mountain Cabin', 'Cozy cabin in the mountains', 'Aspen, CO', 149.99),
('b8c9d0e1-f2a3-4567-hijk-890123456789', 'd4e5f6a7-b8c9-0123-defg-456789012345', 'Downtown Loft', 'Modern loft in the heart of the city', 'New York, NY', 199.99),
('c9d0e1f2-a3b4-5678-ijkl-901234567890', 'd4e5f6a7-b8c9-0123-defg-456789012345', 'Country Cottage', 'Charming cottage in the countryside', 'Nashville, TN', 129.99);

-- Seed Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
('d0e1f2a3-b4c5-6789-jklm-012345678901', 'f6a7b8c9-d0e1-2345-fghi-678901234567', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', '2023-06-15', '2023-06-20', 1499.95, 'confirmed'),
('e1f2a3b4-c5d6-7890-klmn-123456789012', 'a7b8c9d0-e1f2-3456-ghij-789012345678', 'c3d4e5f6-a7b8-9012-cdef-345678901234', '2023-07-01', '2023-07-05', 599.96, 'confirmed'),
('f2a3b4c5-d6e7-8901-lmno-234567890123', 'b8c9d0e1-f2a3-4567-hijk-890123456789', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', '2023-08-10', '2023-08-15', 999.95, 'pending'),
('a3b4c5d6-e7f8-9012-mnop-345678901234', 'c9d0e1f2-a3b4-5678-ijkl-901234567890', 'c3d4e5f6-a7b8-9012-cdef-345678901234', '2023-09-20', '2023-09-25', 649.95, 'confirmed');

-- Seed Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
('b4c5d6e7-f8a9-0123-nopq-456789012345', 'd0e1f2a3-b4c5-6789-jklm-012345678901', 1499.95, 'credit_card'),
('c5d6e7f8-a9b0-1234-opqr-567890123456', 'e1f2a3b4-c5d6-7890-klmn-123456789012', 599.96, 'paypal'),
('d6e7f8a9-b0c1-2345-pqrs-678901234567', 'a3b4c5d6-e7f8-9012-mnop-345678901234', 649.95, 'stripe');

-- Seed Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
('e7f8a9b0-c1d2-3456-qrst-789012345678', 'f6a7b8c9-d0e1-2345-fghi-678901234567', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', 5, 'Amazing experience! The views were incredible.'),
('f8a9b0c1-d2e3-4567-rstu-890123456789', 'a7b8c9d0-e1f2-3456-ghij-789012345678', 'c3d4e5f6-a7b8-9012-cdef-345678901234', 4, 'Very cozy place. Perfect for our weekend getaway.'),
('a9b0c1d2-e3f4-5678-stuv-901234567890', 'c9d0e1f2-a3b4-5678-ijkl-901234567890', 'c3d4e5f6-a7b8-9012-cdef-345678901234', 5, 'Absolutely loved the cottage. Very peaceful and relaxing.');

-- Seed Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
('b0c1d2e3-f4a5-6789-tuvw-012345678901', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'b2c3d4e5-f6a7-8901-bcde-f23456789012', 'Hi, is the villa available for early check-in?'),
('c1d2e3f4-a5b6-7890-uvwx-123456789012', 'b2c3d4e5-f6a7-8901-bcde-f23456789012', 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'Yes, you can check in at 1pm instead of 3pm.'),
('d2e3f4a5-b6c7-8901-vwxy-234567890123', 'c3d4e5f6-a7b8-9012-cdef-345678901234', 'd4e5f6a7-b8c9-0123-defg-456789012345', 'Is the loft pet-friendly?'),
('e3f4a5b6-c7d8-9012-wxyz-345678901234', 'd4e5f6a7-b8c9-0123-defg-456789012345', 'c3d4e5f6-a7b8-9012-cdef-345678901234', 'Sorry, we do not allow pets in the loft.');