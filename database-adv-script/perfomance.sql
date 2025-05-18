-- Initial unoptimized query
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    py.payment_id,
    py.amount,
    py.payment_date,
    py.payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment py ON b.booking_id = py.booking_id
ORDER BY 
    b.start_date DESC;

-- EXPLAIN()
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    py.payment_id,
    py.amount,
    py.payment_date,
    py.payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment py ON b.booking_id = py.booking_id
ORDER BY 
    b.start_date DESC;

-- Optimized query
-- Optimized query
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    (
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'payment_id', py.payment_id,
                'amount', py.amount,
                'payment_date', py.payment_date,
                'payment_method', py.payment_method
            )
        )
        FROM Payment py
        WHERE py.booking_id = b.booking_id
    ) AS payments
FROM 
    Booking b
FORCE INDEX (idx_booking_user_id, idx_booking_property_id)
JOIN 
    User u FORCE INDEX (PRIMARY) ON b.user_id = u.user_id
JOIN 
    Property p FORCE INDEX (PRIMARY) ON b.property_id = p.property_id
WHERE
    b.start_date BETWEEN DATE_SUB(NOW(), INTERVAL 1 YEAR) AND NOW()
ORDER BY 
    b.start_date DESC
LIMIT 1000;