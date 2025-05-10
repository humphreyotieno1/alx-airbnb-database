# AirBnB Database Project

## Overview

This project implements a relational database system for an AirBnB-clone application, featuring a normalized database schema that follows the Third Normal Form (3NF). The database is designed to support core functionalities including user management, property listings, bookings, payments, reviews, and a messaging system.

## Directory Structure

```
alx-airbnb-database/
├── database-script-0x01/      # Database schema definition
│   ├── schema.sql             # DDL script for creating tables
│   └── README.md              # Schema documentation
├── database-script-0x02/      # Sample data
│   ├── seed.sql               # DML script for populating database
│   └── README.md              # Sample data documentation
├── ERD/                       # Entity Relationship Diagrams
│   ├── airbnb-erd.png         # Database diagram
│   └── requirements.md        # Normalization documentation
└── normalization.md           # 3NF analysis
```

## Database Design

The database schema consists of 6 main tables:

1. **User**: Stores user information (guests, hosts, admins)
2. **Property**: Contains property listings with details and pricing
3. **Booking**: Manages reservations with dates, price, and status
4. **Payment**: Tracks payment records for confirmed bookings
5. **Review**: Stores property ratings and user comments
6. **Message**: Facilitates communication between users

### Key Features

- **Normalization**: All tables adhere to 3NF to minimize redundancy and improve data integrity
- **Primary Keys**: All tables use UUID format (CHAR(36)) for security and scalability
- **Foreign Keys**: Proper constraints with CASCADE deletion where appropriate
- **Indexes**: Optimized for frequently queried columns
- **Data Validation**: Check constraints (e.g., booking dates, rating values)
- **Enumerated Types**: Used for roles, booking status, and payment methods

## Installation and Setup

### Prerequisites

- MySQL Server 8.0 or higher

### Setting Up the Database

1. **Install MySQL** on Windows:
   - Download the MySQL Installer from the [MySQL website](https://dev.mysql.com/downloads/installer/)
   - Choose "Developer Default" setup type
   - Set a root password when prompted
   - Complete the installation

2. **Create the database schema**:
   - Using Command Prompt (not PowerShell):
     ```
     cd "C:\Program Files\MySQL\MySQL Server 8.0\bin"
     mysql -u root -p < "c:\Users\User\Desktop\PROJECTS\alx-airbnb-database\database-script-0x01\schema.sql"
     ```
   - Or using MySQL Command Line Client:
     ```
     source c:\Users\User\Desktop\PROJECTS\alx-airbnb-database\database-script-0x01\schema.sql
     ```

3. **Populate with sample data**:
   - Using Command Prompt:
     ```
     mysql -u root -p < "c:\Users\User\Desktop\PROJECTS\alx-airbnb-database\database-script-0x02\seed.sql"
     ```
   - Or using MySQL Command Line Client:
     ```
     source c:\Users\User\Desktop\PROJECTS\alx-airbnb-database\database-script-0x02\seed.sql
     ```

4. **Verify Installation**:
   - Connect to MySQL: `mysql -u root -p`
   - Check database: `SHOW DATABASES;`
   - Select database: `USE airbnb_database;`
   - Check tables: `SHOW TABLES;`

## Sample Data

The seed script provides test data including:
- 5 users (2 hosts, 2 guests, 1 admin)
- 4 properties in various locations
- 4 bookings with different statuses
- 3 payments using different methods
- 3 property reviews
- 4 messages between users

## Normalization Analysis

The database schema has been carefully designed to satisfy Third Normal Form (3NF) requirements:
- All tables have appropriate primary keys (1NF)
- All attributes depend fully on their respective primary keys (2NF)
- No transitive dependencies exist between non-key attributes (3NF)

For detailed analysis, refer to the `normalization.md` and `ERD/requirements.md` files.

## Considerations for Production Use

- Implement proper user authentication and access control
- Add appropriate backup and recovery procedures
- Consider adding database triggers for additional data validation
- Implement connection pooling for application use
- Set up replication for high availability

## License

This project is part of the ALX Software Engineering program.