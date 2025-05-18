-- Total number of bookings made by a user
SELECT u.user_id, u.first_name, u.last_name, u.email, u.phone_number, COUNT(b.booking_id) AS total_bookings
FROM User u
LEFT JOIN Booking b
USING (user_id)
GROUP BY u.user_id, u.first_name, u.last_name, u.email, u.phone_number
ORDER BY total_bookings;

-- Rank properties based on bookings received
SELECT p.property_id, p.name, p.location, p.description, COUNT(b.booking_id) AS booking_count,
ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b
USING (property_id)
GROUP BY p.property_id, p.name, p.location, p.description
ORDER BY booking_count DESC;