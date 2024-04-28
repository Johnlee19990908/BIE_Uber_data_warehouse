DROP TABLE IF EXISTS HVFHS_License CASCADE;
DROP TABLE IF EXISTS License CASCADE;
DROP TABLE IF EXISTS Trip_Flag CASCADE;
DROP TABLE IF EXISTS Pickup_Location CASCADE;
DROP TABLE IF EXISTS Dropoff_Location CASCADE;
DROP TABLE IF EXISTS DateTime_Dim CASCADE;
DROP TABLE IF EXISTS Trip CASCADE;
DROP TABLE IF EXISTS Weather CASCADE;


-- Create HVFHS_License table
CREATE TABLE HVFHS_License (
    hvfhs_license_num VARCHAR(255) PRIMARY KEY,
    Licensee_name VARCHAR(255),
    trip_id INTEGER -- No foreign key constraint added here yet
);

-- Create License table
CREATE TABLE License (
    license_id SERIAL PRIMARY KEY,
    hvfhs_license_num VARCHAR(255) REFERENCES HVFHS_License(hvfhs_license_num),
    originating_base_num VARCHAR(255),
    dispatching_base_num VARCHAR(255),
    trip_id INTEGER -- No foreign key constraint added here yet
);

-- Create Weather table
CREATE TABLE Weather (
    weather_id SERIAL PRIMARY KEY,
    datetime TIMESTAMP,
    temp FLOAT,
    feelslike FLOAT,
    dew FLOAT,
    humidity FLOAT,
    precip FLOAT,
    preciptype VARCHAR(255),
    snow FLOAT,
    snowdepth FLOAT,
    windgust FLOAT,
    visibility FLOAT,
    trip_id INTEGER -- No foreign key constraint added here yet
);

-- Create Trip_Flag table
CREATE TABLE Trip_Flag (
    trip_status_id SERIAL PRIMARY KEY,
    shared_match_flag CHAR(1),
    access_a_ride_flag CHAR(1),
    wav_request_flag CHAR(1),
    wav_match_flag CHAR(1),
    trip_id INTEGER -- No foreign key constraint added here yet
);

-- Create Pickup_Location table
CREATE TABLE Pickup_Location (
    PULocationID INTEGER PRIMARY KEY,
    borough VARCHAR(255),
    zone VARCHAR(255),
    service_zone VARCHAR(255),
    trip_id INTEGER -- No foreign key constraint added here yet
);

-- Create Dropoff_Location table
CREATE TABLE Dropoff_Location (
    DOLocationID INTEGER PRIMARY KEY,
    borough VARCHAR(255),
    zone VARCHAR(255),
    service_zone VARCHAR(255),
    trip_id INTEGER -- No foreign key constraint added here yet
);

-- Create DateTime_Dim table
CREATE TABLE DateTime_Dim (
    datetime_id SERIAL PRIMARY KEY,
    pickup_datetime TIMESTAMP,
    dropoff_datetime TIMESTAMP,
    request_datetime TIMESTAMP,
    on_scene_datetime TIMESTAMP,
    trip_id INTEGER -- No foreign key constraint added here yet
);

-- Create Trip table (Fact Table)
CREATE TABLE Trip (
    trip_id SERIAL PRIMARY KEY,
    license_id INTEGER REFERENCES License(license_id),
    PULocationID INTEGER REFERENCES Pickup_Location(PULocationID),
    DOLocationID INTEGER REFERENCES Dropoff_Location(DOLocationID),
    weather_id INTEGER REFERENCES Weather(weather_id),
    datetime_id INTEGER REFERENCES DateTime_Dim(datetime_id),
    trip_status_id INTEGER REFERENCES Trip_Flag(trip_status_id),
    base_passenger_fare FLOAT,
    tolls FLOAT,
    bcf FLOAT,
    sales_tax FLOAT,
    congestion_surcharge FLOAT,
    airport_fee FLOAT,
    tips FLOAT,
    driver_pay FLOAT,
    trip_miles FLOAT,
    trip_time INTEGER -- Assuming trip_time is in minutes
);

