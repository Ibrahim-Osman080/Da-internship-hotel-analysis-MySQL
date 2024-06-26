CREATE DATABASE hotel_reservation;
USE hotel_reservation;

CREATE TABLE reservations (
    Booking_ID INT PRIMARY KEY,
    no_of_adults INT,
    no_of_children INT,
    no_of_weekend_nights INT,
    no_of_week_nights INT,
    type_of_meal_plan VARCHAR(50),
    room_type_reserved VARCHAR(50),
    lead_time INT,
    arrival_date DATE,
    market_segment_type VARCHAR(50),
    avg_price_per_room DECIMAL(10, 2),
    booking_status VARCHAR(50)
);

USE hotel_reservation;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Hotel_Reservation_Dataset.csv'
INTO TABLE reservations
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Booking_ID, no_of_adults, no_of_children, no_of_weekend_nights, no_of_week_nights, 
 type_of_meal_plan, room_type_reserved, lead_time, arrival_date, market_segment_type, 
 avg_price_per_room, booking_status);



-- local
-- infile = 1

DESCRIBE reservations;

ALTER TABLE reservations
MODIFY Booking_ID VARCHAR(255);

USE hotel_reservation;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hotel_Reservation_Dataset.csv'
INTO TABLE reservations
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Booking_ID, no_of_adults, no_of_children, no_of_weekend_nights, no_of_week_nights, 
 type_of_meal_plan, room_type_reserved, lead_time, arrival_date, market_segment_type, 
 avg_price_per_room, booking_status);

DESCRIBE reservations;


SELECT *
FROM reservations;



CREATE TEMPORARY TABLE temp_reservations (
    Booking_ID VARCHAR(255),
    no_of_adults INT,
    no_of_children INT,
    no_of_weekend_nights INT,
    no_of_week_nights INT,
    type_of_meal_plan VARCHAR(255),
    room_type_reserved VARCHAR(255),
    lead_time INT,
    arrival_date VARCHAR(255),
    market_segment_type VARCHAR(255),
    avg_price_per_room DECIMAL(10, 2),
    booking_status VARCHAR(255)
);

SELECT *
FROM temp_reservations;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Hotel_Reservation_Dataset.csv'
INTO TABLE temp_reservations
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Booking_ID, no_of_adults, no_of_children, no_of_weekend_nights, no_of_week_nights, 
 type_of_meal_plan, room_type_reserved, lead_time, arrival_date, market_segment_type, 
 avg_price_per_room, booking_status);
 
 INSERT INTO reservations (Booking_ID, no_of_adults, no_of_children, no_of_weekend_nights, no_of_week_nights, 
                          type_of_meal_plan, room_type_reserved, lead_time, arrival_date, market_segment_type, 
                          avg_price_per_room, booking_status)
SELECT Booking_ID, no_of_adults, no_of_children, no_of_weekend_nights, no_of_week_nights, 
       type_of_meal_plan, room_type_reserved, lead_time, 
       STR_TO_DATE(arrival_date, '%m/%d/%Y'), 
       market_segment_type, avg_price_per_room, booking_status
FROM temp_reservations;

SELECT *
FROM reservations;

