-- Grant access to local files from the client side
SET GLOBAL local_infile = 1;

-- create database
CREATE DATABASE IF NOT EXISTS BikeSharing_v3;

-- use database
USE BikeSharing_v3;

-- Setting safe update mode to off
SET SQL_SAFE_UPDATES = 0;

CREATE TABLE IF NOT EXISTS rides2022 (
	ride_id VARCHAR(255),
	rideable_type VARCHAR(255),
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(255),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(255),
    start_lat VARCHAR(255),
    start_lng VARCHAR(255),
    end_lat VARCHAR(255),
    end_lng VARCHAR(255),
    member_casual VARCHAR(255)
);

-- TRUNCATE TABLE rides2022;	

LOAD DATA LOCAL INFILE '/Users/Kim/Library/CloudStorage/OneDrive-Universidaddelosandes/DATA ANALYSIS/Google Capstone Project/rides_2022/202212-divvy-tripdata.csv'
INTO TABLE rides2022
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


/* Script to load data from python
# Database connection details
database = 'Bikesharing_v3'
username = 'root'
password = 'toor'
host = '127.0.0.1'
port = '3306'
table_name = 'rides2022'

# Directory containing the CSV files
directory = 'C:/Users/usuario/OneDrive - Universidad de los andes/DATA ANALYSIS/Google Capstone Project/rides_2022'

# Get a list of CSV files in the directory
file_list = [f for f in os.listdir(directory) if f.endswith('.csv')]

# Database connection URL
connection_url = f'mysql+pymysql://{username}:{password}@{host}:{port}/{database}'

# Create SQLAlchemy engine
engine = create_engine(connection_url)

# Loop through the files and load each one into the database
for file in file_list:
    filepath = os.path.join(directory, file)
    df = pd.read_csv(filepath)
    df.to_sql(table_name, engine, if_exists='append', index=False)

# Close the database engine
engine.dispose()
*/


-- Count for total records 5667717
SELECT COUNT(*) 
FROM rides2022;

-- Count for duplicate ride IDs  -- No id duplicates
SELECT COUNT(*), ride_id
FROM rides2022
GROUP BY ride_id
HAVING COUNT(*) > 1;


-- Count for null values 
SELECT
    SUM(CASE WHEN rideable_type IS NULL OR rideable_type = '' THEN 1 ELSE 0 END) AS rideable_type_null_count,
    SUM(CASE WHEN started_at IS NULL THEN 1 ELSE 0 END) AS started_at_null_count,
    SUM(CASE WHEN ended_at IS NULL THEN 1 ELSE 0 END) AS ended_at_null_count,
    SUM(CASE WHEN start_station_name IS NULL OR start_station_name = '' THEN 1 ELSE 0 END) AS start_station_name_null_count,
    SUM(CASE WHEN start_station_id IS NULL OR start_station_id = '' THEN 1 ELSE 0 END) AS start_station_id_null_count,
    SUM(CASE WHEN end_station_name IS NULL OR end_station_name = '' THEN 1 ELSE 0 END) AS end_station_name_null_count,
    SUM(CASE WHEN end_station_id IS NULL OR end_station_id = '' THEN 1 ELSE 0 END) AS end_station_id_null_count,
    SUM(CASE WHEN member_casual IS NULL OR member_casual = '' THEN 1 ELSE 0 END) AS member_casual_null_count
FROM
    rides2022;


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

-- Limpiar outliers de la columna trip duration la regla de los tres sigmas. Evaluar si se reduce considerablemente la cantidad de datos, poder graficar en tableau directament
-- Make a view with key summary statistics
/*
CREAR STORE PROCEDURE
END
1) COUNT user_type, COUNT(*).  - grafico de lineas agrupado por usertype eje X linea temporal
2) SELECT usert_type, AVG(trip_duration) GROUP BY user_type - 
3)SELECT user_tpye, COUNT(*) GROUP BY started_hour ORDER BY DESC
4) Calcular distancia promedio de viajes agrupado por usuarios. Crear una nueva columna donde ira el dato tipo POINT(revisar chat gpt)

BEGIN
CREAR VIEWS PARA CADA CALCULO
*/

SELECT 'ride_id', 'rideable_type', 'started_at', 'ended_at', 'start_station_name', 'end_station_name', 'user_type', 'started_day', 'started_month',  'trip_duration'
UNION ALL
SELECT *
FROM trips_combined
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/trips_combined.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
-- 5440115 rows affected


