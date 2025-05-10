# AirBnB Database Schema

This directory contains the Database Definition Language (DDL) scripts for the AirBnB database project.

## Overview

The `schema.sql` file defines the complete database schema for an AirBnB-like application, including:

- User management
- Property listings
- Booking system
- Payment processing
- Review system
- Messaging functionality

## Database Design

The schema follows the Third Normal Form (3NF) and includes:

- 6 main tables with appropriate relationships
- Primary and foreign key constraints
- Index optimizations for frequently queried columns
- Check constraints for data validation
- Automatic timestamp generation for audit fields

## Tables

1. **User**: Stores user information with fields for name, email, password, phone, and role (guest, host, admin)
2. **Property**: Contains property listings with details like name, description, location, and pricing
3. **Booking**: Manages reservations with dates, price, and status (pending, confirmed, canceled)
4. **Payment**: Tracks payment records with amount, date, and payment method
5. **Review**: Stores property ratings (1-5) and comments from users
6. **Message**: Facilitates communication between users with message body and timestamps

## Implementation Notes

- All primary keys use UUID format for security and scalability
- Foreign key constraints include CASCADE deletion where appropriate
- Indexes are added on email, host_id, property_id, user_id, booking_id, sender_id, and recipient_id
- Enumerations are used for roles, booking status, and payment methods
- Timestamps track creation and update times for relevant tables
- Check constraints ensure data validity (e.g., end_date > start_date, rating between 1-5)

## Usage

To initialize the database:

1. Ensure you have MySQL installed and running
2. Run the schema.sql script:

```bash
mysql -u username -p < schema.sql
```

## Special Considerations

- The schema uses MySQL syntax (e.g., ENUM types, UUID handling)
- For PostgreSQL, you would need to modify the UUID handling and ENUM definitions
- The CHECK constraints might need syntax adjustments depending on your MySQL version

## Additional Notes

- All tables include appropriate indexing for optimal query performance
- The schema includes validation constraints to ensure data integrity
- Timestamps are automatically managed for audit purposes