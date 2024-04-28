DELETE FROM HVFHS_License;
DELETE FROM License;
DELETE FROM Trip_Flag;
DELETE FROM Pickup_Location;
DELETE FROM Dropoff_Location;
DELETE FROM DateTime_Dim;
DELETE FROM Trip;

-- Insert data into HVFHS_License table
INSERT INTO HVFHS_License (hvfhs_license_num)
SELECT DISTINCT hvfhs_license_num
FROM trip_master_final;

-- Insert data into License table
INSERT INTO License (hvfhs_license_num, originating_base_num, dispatching_base_num)
SELECT DISTINCT hvfhs_license_num, originating_base_num, dispatching_base_num
FROM trip_master_final;

-- Insert data into Trip_Flag table
INSERT INTO Trip_Flag (shared_match_flag, access_a_ride_flag, wav_request_flag, wav_match_flag)
SELECT DISTINCT shared_match_flag, access_a_ride_flag, wav_request_flag, wav_match_flag
FROM trip_master_final;

-- Insert data into Pickup_Location table
INSERT INTO Pickup_Location (PULocationID)
SELECT DISTINCT PULocationID
FROM trip_master_final;

-- Insert data into Dropoff_Location table
INSERT INTO Dropoff_Location (DOLocationID)
SELECT DISTINCT DOLocationID
FROM trip_master_final;

-- Insert data into DateTime_Dim table
INSERT INTO DateTime_Dim (pickup_datetime, dropoff_datetime, request_datetime, on_scene_datetime)
SELECT DISTINCT pickup_datetime, dropoff_datetime, request_datetime, on_scene_datetime
FROM trip_master_final;

-- Trip Insert
INSERT INTO Trip (license_id, PULocationID, DOLocationID, datetime_id, trip_status_id, base_passenger_fare, tolls, bcf, sales_tax, congestion_surcharge, airport_fee, tips, driver_pay, trip_miles, trip_time)
SELECT DISTINCT l.license_id, t.PULocationID, t.DOLocationID, dt.datetime_id, tf.trip_status_id, t.base_passenger_fare, t.tolls, t.bcf, t.sales_tax, t.congestion_surcharge, t.airport_fee, t.tips, t.driver_pay, t.trip_miles, t.trip_time
FROM trip_master_final t
LEFT JOIN License l ON t.hvfhs_license_num = l.hvfhs_license_num 
                AND (t.originating_base_num = l.originating_base_num)
                AND (t.dispatching_base_num = l.dispatching_base_num)
LEFT JOIN DateTime_Dim dt ON t.pickup_datetime = dt.pickup_datetime 
                         AND t.dropoff_datetime = dt.dropoff_datetime 
                         AND t.request_datetime = dt.request_datetime 
                         AND t.on_scene_datetime = dt.on_scene_datetime
LEFT JOIN Trip_Flag tf ON tf.shared_match_flag = t.shared_match_flag 
                    AND tf.access_a_ride_flag = t.access_a_ride_flag 
                    AND tf.wav_request_flag = t.wav_request_flag 
                    AND tf.wav_match_flag = t.wav_match_flag
LEFT JOIN Pickup_Location pl ON pl.PULocationID = t.PULocationID
LEFT JOIN Dropoff_Location dl ON dl.DOLocationID = t.DOLocationID;




