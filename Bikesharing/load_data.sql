-- Grant access to local files from the client side
-- SET GLOBAL local_infile = 1;

-- create database
-- CREATE DATABASE IF NOT EXISTS BikeSharing;

-- use database
USE BikeSharing_v2;

-- Setting safe update mode to off
SET SQL_SAFE_UPDATES = 0;

-- create tables 
CREATE TABLE IF NOT EXISTS jan_22 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS feb_22 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS mar_22 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);


CREATE TABLE IF NOT EXISTS apr_22 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS may_22 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS jun_22 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS jul_22 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS aug_22 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS sep_22 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS oct_22 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS nov_22 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS dec_22 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);


-- Load data into tables from csv files
LOAD DATA LOCAL INFILE 'C:/Users/kim/OneDrive - Universidad de los Andes/DATA ANALYSIS/Google Capstone Project/202201-divvy-tripdata/202201-divvy-tripdata.csv'
INTO TABLE jan_22
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/kim/OneDrive - Universidad de los Andes/DATA ANALYSIS/Google Capstone Project/202202-divvy-tripdata/202202-divvy-tripdata.csv'
INTO TABLE feb_22
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/kim/OneDrive - Universidad de los Andes/DATA ANALYSIS/Google Capstone Project/202203-divvy-tripdata/202203-divvy-tripdata.csv'
INTO TABLE mar_22
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/kim/OneDrive - Universidad de los Andes/DATA ANALYSIS/Google Capstone Project/202204-divvy-tripdata/202204-divvy-tripdata.csv'
INTO TABLE apr_22
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
    
LOAD DATA LOCAL INFILE 'C:/Users/kim/OneDrive - Universidad de los Andes/DATA ANALYSIS/Google Capstone Project/202205-divvy-tripdata/202205-divvy-tripdata.csv'
INTO TABLE may_22
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/kim/OneDrive - Universidad de los Andes/DATA ANALYSIS/Google Capstone Project/202206-divvy-tripdata/202206-divvy-tripdata.csv'
INTO TABLE jun_22
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/kim/OneDrive - Universidad de los Andes/DATA ANALYSIS/Google Capstone Project/202207-divvy-tripdata/202207-divvy-tripdata.csv'
INTO TABLE jul_22
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/kim/OneDrive - Universidad de los Andes/DATA ANALYSIS/Google Capstone Project/202208-divvy-tripdata/202208-divvy-tripdata.csv'
INTO TABLE aug_22
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/kim/OneDrive - Universidad de los Andes/DATA ANALYSIS/Google Capstone Project/202209-divvy-tripdata/202209-divvy-tripdata.csv'
INTO TABLE sep_22
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/kim/OneDrive - Universidad de los Andes/DATA ANALYSIS/Google Capstone Project/202210-divvy-tripdata/202210-divvy-tripdata.csv'
INTO TABLE oct_22
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/kim/OneDrive - Universidad de los Andes/DATA ANALYSIS/Google Capstone Project/202211-divvy-tripdata/202211-divvy-tripdata.csv'
INTO TABLE nov_22
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'C:/Users/kim/OneDrive - Universidad de los Andes/DATA ANALYSIS/Google Capstone Project/202212-divvy-tripdata/202212-divvy-tripdata.csv'
INTO TABLE dec_22
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- 90903 row(s) affected, 1024 warning(s): 1262 Row 1 was truncated; it contained more data than there were input columns
-- Hay errores en la carga de las tablas, REVISAR! -- Listo, habia que poner "LINES TERMINATED BY '\r\n' y teníamos solo la '\n'
-- Siguen saliendo truncated las latitudes y longitudes del end. La vamos a dejar así porque ahora no vamos a trabajar con mapas. 

-- Combine all data in a single table
-- Create a table
CREATE TABLE IF NOT EXISTS trips_combined (
	ride_id VARCHAR(255) UNIQUE,
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual VARCHAR(255)
);

-- Cargar los datos de todas las tablas con union all

INSERT INTO trips_combined
SELECT * FROM jan_22
UNION ALL
SELECT * FROM feb_22
UNION ALL
SELECT * FROM mar_22
;

INSERT INTO trips_combined
SELECT * FROM apr_22
UNION ALL
SELECT * FROM may_22
UNION ALL
SELECT * FROM jun_22
;

INSERT INTO trips_combined
SELECT * FROM jul_22
UNION ALL
SELECT * FROM aug_22
;

INSERT INTO trips_combined
SELECT * FROM sep_22
;

INSERT INTO trips_combined
SELECT * FROM oct_22
UNION ALL
SELECT * FROM nov_22
UNION ALL
SELECT * FROM dec_22
;


-- Count for total records 5667717
SELECT COUNT(*) 
FROM trips_combined;

SELECT COUNT(DISTINCT(ride_id)) -- total distincts 5667717 no duplicates
FROM trips_combined;

-- count for null or empty values
SELECT 
    COUNT(*)
FROM
    trips_combined
WHERE
    rideable_type IS NULL
        OR rideable_type = '';
-- No NULLS 

SELECT 
    COUNT(*)
FROM
    trips_combined
WHERE
    started_at IS NULL;
-- No NULLS

SELECT 
    COUNT(*)
FROM
    trips_combined
WHERE
    ended_at IS NULL;
-- No NULLS

SELECT 
    COUNT(*)
FROM
    trips_combined
WHERE
    start_station_name IS NULL
        OR start_station_name = '';
-- 833064 rows with nulls

SELECT 
    COUNT(*)
FROM
    trips_combined
WHERE
    start_station_id IS NULL
        OR start_station_id = '';
-- Same nulls as start_station_name 833064

SELECT 
    COUNT(*)
FROM
    trips_combined
WHERE
    end_station_name IS NULL
        OR end_station_name = '';
-- 892742 rows with nulls

SELECT 
    COUNT(*)
FROM
    trips_combined
WHERE
    end_station_id IS NULL
        OR end_station_id = '';
-- Same null as end_station_name 892742

SELECT 
    COUNT(*)
FROM
    trips_combined
WHERE
    member_casual IS NULL
        OR member_casual = '';
-- No NULLS

-- Replace all empty fields with NULL. We won't delete them because we'll use other fields information
UPDATE trips_combined 
SET 
    start_station_name = 'null',
    start_station_id = 'null',
    end_station_name = 'null',
    end_station_id = 'null'
WHERE
    start_station_name = ''
        OR start_station_id = ''
        OR end_station_name = ''
        OR end_station_id = '';
-- Total rows affected: 1298357 

-- Rename and delete unwanted columns
ALTER TABLE trips_combined
DROP COLUMN start_station_id;

ALTER TABLE trips_combined
DROP COLUMN end_station_id;

ALTER TABLE trips_combined
DROP COLUMN start_lat;

ALTER TABLE trips_combined
DROP COLUMN start_lng;

ALTER TABLE trips_combined
DROP COLUMN end_lat;

ALTER TABLE trips_combined
DROP COLUMN end_lng;

ALTER TABLE trips_combined
RENAME COLUMN member_casual TO user_type;
    
-- Extract day of the week and month
-- Create new columns for day of the week and month
ALTER TABLE trips_combined
ADD COLUMN started_day VARCHAR(255),
ADD COLUMN started_month VARCHAR(255);
#ADD COLUMN ended_day VARCHAR(255),
#ADD COLUMN ended_month VARCHAR(255);


UPDATE trips_combined
SET started_day = DATE_FORMAT(started_at, '%W'),
	started_month = DATE_FORMAT(started_at, '%M');
    #ended_day = DATE_FORMAT(ended_date, '%W'),
	#ended_month = DATE_FORMAT(ended_date, '%M');
    	
    
-- Calculate trips duration and delete trips with less than or equal to 1 min length and more than 1440 min (24h)
-- Create a column to store trips duration

ALTER TABLE trips_combined ADD COLUMN trip_duration INT;

UPDATE trips_combined
SET trip_duration = TIMESTAMPDIFF(MINUTE, started_at, ended_at);

-- There are negative trip_duration numbers due to errors in the ended_at column, that were in some cases previous to the started_at.
-- All were deleted (74 rows)

DELETE
FROM trips_combined
WHERE trip_duration < 0;

-- Also deleted rows with trip_duration less than 1 min (222170 rows)
DELETE
FROM trips_combined
WHERE trip_duration <= 1;

-- Besides, there are some trips with more than 24h duration, which means there was some error in the time measure or the bike might be lost or stolen. Will delete them
-- 5359 rows
DELETE
FROM trips_combined
WHERE trip_duration > 1440;

-- Calculate mean, max and min of trip duration (round to 2 decimals) for total and for hours of the day, weekdays and months, for each user type.


-- Calculate total, mean, max and min of trip count (round to 2 decimals) for total and for hours of the day, weekdays and months, and for each user type.


-- Make a list of the most common start and end stations per user type. Try to relate with tusristics areas or something like that. 


-- Export table to explore on python pandas
SELECT 'ride_id', 'rideable_type', 'started_at', 'ended_at', 'start_station_name', 'end_station_name', 'user_type', 'started_day', 'started_month',  'trip_duration'
UNION ALL
SELECT *
FROM trips_combined
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/trips_combined.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
-- 5440115 rows affected