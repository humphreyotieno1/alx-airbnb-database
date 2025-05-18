-- Retrieve all bookings and the respective users who made the bookings
SELECT u.user_id, u.first_name, u.last_name, u.email, u.phone_number, b.status, p.name FROM
Booking b
INNER JOIN User u
USING (user_id)
INNER JOIN Property p
USING (property_id);

-- Retrieve all properties and their reviews + properties that have no reviews
SELECT p.property_id, p.name, p.location, r.rating, r.comment, u.first_name, u.last_name FROM
Property p
LEFT JOIN Review r
USING (property_id)
LEFT JOIN User u
USING (user_id);

-- Retrieve all users and all bookings even if the user has no booking or a booking is not linked to a user
SELECT u.user_id, u.first_name, u.last_name, u.email, u.phone_number, b.booking_id, b.property_id, b.status FROM
User u
LEFT JOIN Booking b
USING (user_id)
UNION
SELECT u.user_id, u.first_name, u.last_name, u.email, u.phone_number, b.booking_id, b.property_id, b.status FROM
User u
LEFT JOIN Booking b
USING (user_id)
WHERE user_id IS NULL;
