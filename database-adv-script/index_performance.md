# SQL Index Optimization

## 1. Identifying High-Usage Columns

Based on common query patterns and the schema, these columns are frequently used in operations:

**User Table:**
- `email` (frequent lookups during authentication)
- `role` (often filtered in admin queries)
- `user_id` (primary key, already indexed)

**Booking Table:**
- `property_id` (foreign key, join condition)
- `user_id` (foreign key, join condition)
- `status` (frequently filtered)
- `start_date` and `end_date` (common filtering for availability)

**Property Table:**
- `host_id` (foreign key, join condition)
- `location` (common filtering)
- `pricepernight` (common sorting/filtering)

## 2. Index Creation Script (database_index.sql)

```sql
-- Indexes for User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Indexes for Booking table
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);

-- Indexes for Property table
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);
CREATE INDEX idx_property_location_price ON Property(location, pricepernight);
```

## 3. Performance Measurement Examples

### Before Indexes:

```sql
-- Example 1: Find bookings for a specific user
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890';

-- Example 2: Find properties in a location within price range
EXPLAIN ANALYZE
SELECT * FROM Property 
WHERE location = 'Miami, FL' AND pricepernight BETWEEN 200 AND 300;
```

### After Indexes:

```sql
-- Example 1 with indexes
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE user_id = 'a1b2c3d4-e5f6-7890-abcd-ef1234567890';

-- Example 2 with indexes
EXPLAIN ANALYZE
SELECT * FROM Property 
WHERE location = 'Miami, FL' AND pricepernight BETWEEN 200 AND 300;
```

## 4. Expected Performance Improvements

1. **User Authentication Queries**:
    - Before: Full table scan to find by email
    - After: Direct lookup via `idx_user_email`

2. **Booking Queries**:
    - Before: Full scan to find bookings by user/property
    - After: Index seek via `idx_booking_user_id` or `idx_booking_property_id`

3. **Property Search Queries**:
    - Before: Full scan for location/price filters
    - After: Index range scan via `idx_property_location_price`

## 5. Additional Optimization Notes

1. Composite indexes (like `idx_property_location_price`) are especially valuable for queries that filter on multiple columns.

2. The `idx_booking_dates` composite index will significantly speed up availability queries:
    ```sql
    SELECT * FROM Booking 
    WHERE property_id = '...' 
    AND start_date <= '2023-12-31' 
    AND end_date >= '2023-12-01';
    ```

3. Monitor index usage periodically and remove unused indexes as they add overhead to write operations:
    ```sql
    SELECT * FROM sys.schema_unused_indexes;
    ```

4. For very large tables, consider adding covering indexes that include all columns needed by frequent queries to avoid table lookups entirely.