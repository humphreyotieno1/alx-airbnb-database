# Database Advanced Scripts

This repository contains a series of advanced SQL scripts for managing and querying a database for an Airbnb-like application.

## Table of Contents
- [Complex Queries with Joins](#complex-queries-with-joins)
- [Practice Subqueries](#practice-subqueries)
- [Apply Aggregations and Window Functions](#apply-aggregations-and-window-functions)
- [Implement Indexes for Optimization](#implement-indexes-for-optimization)
- [Optimize Complex Queries](#optimize-complex-queries)
- [Partitioning Large Tables](#partitioning-large-tables)
- [Monitor and Refine Database Performance](#monitor-and-refine-database-performance)

## Complex Queries with Joins

This section demonstrates the use of different types of SQL joins to retrieve data from multiple tables.

### Files:
- `joins_queries.sql`: Contains SQL queries using INNER JOIN, LEFT JOIN, and FULL OUTER JOIN

### Tasks:
- Retrieve all bookings and the respective users who made those bookings using INNER JOIN
- Retrieve all properties and their reviews, including properties with no reviews using LEFT JOIN
- Retrieve all users and all bookings using FULL OUTER JOIN

## Practice Subqueries

This section explores the use of correlated and non-correlated subqueries.

### Files:
- `subqueries.sql`: Contains SQL queries using different types of subqueries

### Tasks:
- Find all properties where the average rating is greater than 4.0 using a subquery
- Find users who have made more than 3 bookings using a correlated subquery

## Apply Aggregations and Window Functions

This section covers SQL aggregation and window functions for data analysis.

### Files:
- `aggregations_and_window_functions.sql`: Contains SQL queries using COUNT, GROUP BY, and window functions

### Tasks:
- Find the total number of bookings made by each user using COUNT and GROUP BY
- Rank properties based on the total number of bookings using window functions (ROW_NUMBER, RANK)

## Implement Indexes for Optimization

This section focuses on creating indexes to improve query performance.

### Files:
- `database_index.sql`: Contains SQL commands to create indexes
- `index_performance.md`: Documents performance improvements

### Tasks:
- Identify high-usage columns in User, Booking, and Property tables
- Create appropriate indexes for those columns
- Measure and document query performance before and after adding indexes

## Optimize Complex Queries

This section involves refactoring complex queries for better performance.

### Files:
- `performance.sql`: Contains the initial and refactored queries
- `optimization_report.md`: Documents the optimization process and results

### Tasks:
- Write a complex query retrieving booking details with user, property, and payment information
- Analyze and identify inefficiencies in the query
- Refactor the query to improve performance

## Partitioning Large Tables

This section demonstrates table partitioning for large datasets.

### Files:
- `partitioning.sql`: Contains SQL commands for implementing table partitioning
- `partition_performance.md`: Documents the performance improvements

### Tasks:
- Implement partitioning on the Booking table based on the start_date column
- Test and document the performance improvements

## Monitor and Refine Database Performance

This section covers continuous monitoring and refinement of database performance.

### Files:
- `performance_monitoring.md`: Documents the monitoring process and improvements

### Tasks:
- Monitor performance of frequently used queries
- Identify bottlenecks and implement improvements
- Document the process and results