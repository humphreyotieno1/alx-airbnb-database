-- Find all properties with avg rating > 4.0
SELECT p.property_id, p.name, p.location, p.description, p.pricepernight, AVG(r.rating) AS avg_rating
FROM Property p
LEFT JOIN Review r
ON r.property_id = p.property_id
GROUP BY p.property_id, p.name, p.location, p.description, p.pricepernight
HAVING AVG(r.rating) > 4.0
ORDER BY avg_rating DESC;

-- Correlated subquery to find users who have made more than 3 bookings
SELECT u.user_id, u.first_name, u.last_name, u.email,
    (SELECT COUNT(*) FROM Booking b 
     WHERE b.user_id = u.user_id) AS booking_count
FROM User u
WHERE 
    (SELECT COUNT(*) FROM Booking b 
     WHERE b.user_id = u.user_id) > 3
ORDER BY booking_count DESC;