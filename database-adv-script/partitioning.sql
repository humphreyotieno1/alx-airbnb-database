-- Create a new partitioned version of the Booking table
CREATE TABLE Booking_partitioned (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date),
    INDEX idx_property_id (property_id),
    INDEX idx_user_id (user_id),
    INDEX idx_status (status),
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    CHECK (end_date > start_date)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2020 VALUES LESS THAN (2021),
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Migrate data from original table to partitioned table
INSERT INTO Booking_partitioned
SELECT * FROM Booking;

-- Replace original table with partitioned version (after verifying data integrity)
RENAME TABLE Booking TO Booking_old, Booking_partitioned TO Booking;

-- Create a procedure to maintain partitions (add new yearly partitions)
DELIMITER //
CREATE PROCEDURE maintain_booking_partitions()
BEGIN
    DECLARE current_year INT;
    DECLARE partition_exists INT;
    
    SET current_year = YEAR(CURDATE());
    
    SELECT COUNT(*) INTO partition_exists
    FROM information_schema.PARTITIONS
    WHERE TABLE_SCHEMA = 'airbnb_database'
    AND TABLE_NAME = 'Booking'
    AND PARTITION_NAME = CONCAT('p', current_year);
    
    IF partition_exists = 0 THEN
        SET @sql = CONCAT('ALTER TABLE Booking ADD PARTITION (PARTITION p', 
                         current_year, ' VALUES LESS THAN (', current_year + 1, '))');
        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END IF;
END //
DELIMITER ;
