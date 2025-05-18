-- Retrieve all bookings and the respective users who made the bookings
SELECT u.user_id, u.first_name, u.last_name, u.email, u.phone_number, b.status, p.name FROM
Booking b
INNER JOIN User u
USING (user_id)
INNER JOIN Property p
USING (property_id);

-- Retrieve all properties and their reviews + properties that have no reviews
SELECT p.property_id, p.name AS property_name, p.location, r.review_id, r.rating, r.comment, u.first_name AS reviewer_name
FROM 
Property p
LEFT JOIN 
Review r ON p.property_id = r.property_id
LEFT JOIN
User u ON r.user_id = u.user_id
ORDER BY 
p.property_id, r.review_id;

-- Retrieve all users and all bookings even if the user has no booking or a booking is not linked to a user
SELECT u.user_id, u.first_name, u.last_name, u.email, b.booking_id, b.start_date, b.end_date, b.status
FROM User u
LEFT JOIN Booking b ON u.user_id = b.user_id

UNION

SELECT u.user_id, u.first_name, u.last_name, u.email, b.booking_id, b.start_date, b.end_date, b.status
FROM Booking b
LEFT JOIN User u ON b.user_id = u.user_id
WHERE u.user_id IS NULL;
