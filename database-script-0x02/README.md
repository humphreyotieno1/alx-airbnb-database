# AirBnB Database Sample Data

This directory contains Database Manipulation Language (DML) scripts for populating the AirBnB database with realistic sample data.

## Overview

The `seed.sql` file provides a comprehensive set of sample data that simulates a real-world AirBnB-like application environment. The script inserts records into all tables defined in the schema, creating a complete ecosystem of users, properties, bookings, payments, reviews, and messages.

## Sample Data Details

The seed script populates:

- **Users**: 5 users with different roles (2 hosts, 2 guests, 1 admin)
- **Properties**: 4 diverse property listings across different locations (Miami, Aspen, New York, Nashville)
- **Bookings**: 4 bookings with various statuses (3 confirmed, 1 pending)
- **Payments**: 3 payments using different payment methods (credit_card, paypal, stripe)
- **Reviews**: 3 property reviews with ratings and comments
- **Messages**: 4 messages demonstrating conversations between users

## Data Relationships

The sample data maintains referential integrity across all tables:
- Each property is linked to a valid host
- Each booking references a valid property and guest
- Each payment is associated with a confirmed booking
- Each review is tied to a property and user who booked it
- Each message occurs between valid users

## Usage

To populate your database with this sample data:

1. Ensure you have already created the database schema
2. Run the seed script:

```bash
mysql -u username -p airbnb_database < seed.sql
```

## Notes on the Sample Data

- All primary keys use predefined UUIDs for consistency and traceability
- The script includes a safety mechanism to clear existing data (TRUNCATE with FOREIGN_KEY_CHECKS)
- Password hashes are simulated (represented as bcrypt-like hashes)
- Booking dates follow a chronological pattern (June through September 2023)
- Property prices range from $129.99 to $299.99 per night

## Testing Considerations

This sample data enables testing of various application features:
- User authentication and authorization
- Property listing and searching
- Booking process flow
- Payment processing
- Review and rating system
- Messaging functionality
