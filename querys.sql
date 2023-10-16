SELECT * FROM BikeSharing.rides_2022;

-- Verify distinct values
SELECT DISTINCT rideable_type
FROM rides_2022;

SELECT DISTINCT member_casual
FROM rides_2022;

-- Verify matching IDs between start and end stations.
SELECT start.start_station_name, start.start_station_id, end.end_station_name, end.end_station_id
FROM (
    SELECT DISTINCT start_station_name, start_station_id
    FROM rides_2022
    WHERE start_station_name IS NOT NULL
) AS start
LEFT JOIN (
    SELECT DISTINCT end_station_name, end_station_id
    FROM rides_2022
    WHERE end_station_name IS NOT NULL
) AS end
ON start.start_station_id = end.end_station_id
ORDER BY start.start_station_name, end.end_station_id;


SELECT station_id, COUNT(*) AS conteo_id
FROM BikeSharing.aux_stations
GROUP BY station_id
HAVING conteo_id > 1 ;

SELECT station_name, COUNT(*) AS conteo_names
FROM BikeSharing.aux_stations
GROUP BY station_name
HAVING conteo_names > 1 ;

SELECT * FROM aux_stations
WHERE station_name = 'Lakefront Trail & Bryn Mawr Ave';

SELECT * FROM aux_stations
WHERE station_id = 637;

SELECT count(*) FROM aux_stations
WHERE station_id IS NULL;





