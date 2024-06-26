-- 1 Total number of reservations in the dataset:
SELECT COUNT(*) AS total_reservations 
FROM reservations;

-- 2 Most popular meal plan among guests:
SELECT type_of_meal_plan, COUNT(*) AS count 
FROM reservations 
GROUP BY type_of_meal_plan 
ORDER BY count DESC 
LIMIT 1;

-- 3 Average price per room for reservations involving children:
SELECT AVG(avg_price_per_room) AS avg_price_per_room_with_children 
FROM reservations 
WHERE no_of_children > 0;

-- 4 Number of reservations made for the year 20XX (replace XX with the desired year):
SELECT COUNT(*) AS reservations_in_year 
FROM reservations 
WHERE YEAR(arrival_date) = 2020;

-- 5 Most commonly booked room type:
SELECT room_type_reserved, COUNT(*) AS count 
FROM reservations 
GROUP BY room_type_reserved 
ORDER BY count DESC 
LIMIT 1;

-- 6 Number of reservations that fall on a weekend:
SELECT COUNT(*) AS weekend_reservations 
FROM reservations 
WHERE no_of_weekend_nights > 0;

-- 7 Highest and lowest lead time for reservations:
SELECT MAX(lead_time) AS highest_lead_time, MIN(lead_time) AS lowest_lead_time 
FROM reservations;

-- 8 Most common market segment type for reservations:
SELECT market_segment_type, COUNT(*) AS count 
FROM reservations 
GROUP BY market_segment_type 
ORDER BY count DESC 
LIMIT 1;

-- 9 Number of reservations with a booking status of "Confirmed":
SELECT COUNT(*) AS confirmed_reservations 
FROM reservations 
WHERE booking_status = 'Confirmed';

-- 10 Total number of adults and children across all reservations:
SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children 
FROM reservations;

-- 11 Average number of weekend nights for reservations involving children:
SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights_with_children 
FROM reservations 
WHERE no_of_children > 0;

-- 12 Number of reservations made in each month of the year:
SELECT MONTH(arrival_date) AS month, COUNT(*) AS reservations_count 
FROM reservations 
GROUP BY month 
ORDER BY month;

-- 13 Average number of nights (both weekend and weekday) spent by guests for each room type:
SELECT room_type_reserved, 
       AVG(no_of_weekend_nights + no_of_week_nights) AS avg_nights 
FROM reservations 
GROUP BY room_type_reserved;

-- 14 Most common room type and average price for that room type for reservations involving children:
SELECT room_type_reserved, 
       COUNT(*) AS count, 
       AVG(avg_price_per_room) AS avg_price 
FROM reservations 
WHERE no_of_children > 0 
GROUP BY room_type_reserved 
ORDER BY count DESC 
LIMIT 1;

-- 15 Market segment type that generates the highest average price per room:
SELECT market_segment_type, 
       AVG(avg_price_per_room) AS avg_price 
FROM reservations 
GROUP BY market_segment_type 
ORDER BY avg_price DESC 
LIMIT 1;








