DROP DATABASE BikeSharing_v3;

CREATE DATABASE IF NOT EXISTS BikeSharing
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

USE BikeSharing;


-- Create a dimension table for bike types.

CREATE TABLE IF NOT EXISTS dim_rideable_type (
    rideable_id INT AUTO_INCREMENT NOT NULL,
    rideable_type VARCHAR(50), -- Type of rideable (e.g., bike, scooter).
    PRIMARY KEY (rideable_id)
);

-- Insert distinct values
INSERT INTO dim_rideable_type (rideable_type)
SELECT DISTINCT TRIM(rideable_type)
FROM rides_2022;


-- Create a dimension table for user types.

CREATE TABLE IF NOT EXISTS dim_user_type (
    user_type_id INT AUTO_INCREMENT NOT NULL,
    user_type VARCHAR(50), -- Type of user (e.g., casual, member).
    PRIMARY KEY (user_type_id)
);

-- Insert distinct values
INSERT INTO dim_user_type (user_type)
SELECT DISTINCT TRIM(member_casual)
FROM rides_2022;


-- Create a dimension table for station names

CREATE TABLE IF NOT EXISTS dim_station (
    station_id VARCHAR(255) NOT NULL,
    station_name VARCHAR(255) NOT NULL, -- Station name
    PRIMARY KEY (station_id)
);

-- Create and auxiliar table to retrieve all start and end station names and ids
CREATE TABLE IF NOT EXISTS aux_stations (
	station_name VARCHAR(255) DEFAULT NULL, 
    station_id VARCHAR(255) DEFAULT NULL
    );

-- Insert distinct values from start_stations UNION end_stations
INSERT INTO aux_stations (station_name, station_id)
SELECT DISTINCT start_station_name, start_station_id
FROM rides_2022
UNION 
SELECT DISTINCT end_station_name, end_station_id
FROM rides_2022; -- There are some station_names with different Ids that we could not address because of lack of business knowledge

-- Drop duplicate valuess
DELETE s1
FROM aux_stations s1
JOIN aux_stations s2
ON s1.station_id = s2.station_id
AND s1.station_name > s2.station_name;


-- Insert the distinct values in the dim_station_name table
INSERT INTO dim_station (station_id, station_name)
SELECT DISTINCT station_id, station_name
FROM aux_stations
WHERE station_id IS NOT NULL;

-- Insert the id columns in the fact table and drop the old ones

-- Add rideable_id
ALTER TABLE rides_2022 
ADD COLUMN rideable_id INT DEFAULT NULL AFTER ride_id;

UPDATE rides_2022 r
JOIN dim_rideable_type d ON r.rideable_type = d.rideable_type
SET r.rideable_id = d.rideable_id;

-- Add user_type_id
ALTER TABLE rides_2022 
ADD COLUMN user_type_id INT DEFAULT NULL AFTER member_casual;

UPDATE rides_2022 r
JOIN dim_user_type d ON r.member_casual = d.user_type
SET r.user_type_id = d.user_type_id;

-- Drop columns
ALTER TABLE rides_2022
DROP COLUMN rideable_type,
DROP COLUMN member_casual,
DROP COLUMN start_station_name,
DROP COLUMN end_station_name;

