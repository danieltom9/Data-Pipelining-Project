CREATE OR REPLACE TABLE `psyched-canto-394618.uber_test_proj.tbl_analytics` AS (

SELECT 
f.trip_id
f.VendorID,
p.passenger_count,
t.trip_distance,
r.rate_code_name,
pick.pickup_latitude,
pick.pickup_longitude,
drop.dropoff_latitude,
drop.dropoff_longitude,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount

FROM 
`psyched-canto-394618.uber_test_proj.fact_table` as f
JOIN `psyched-canto-394618.uber_test_proj.datetime_dim` as d  
ON f.datetime_id=d.datetime_id
JOIN `psyched-canto-394618.uber_test_proj.passenger_count_dim` as p  
ON p.passenger_count_id=f.passenger_count_id  
JOIN `psyched-canto-394618.uber_test_proj.trip_distance_dim` as t  
ON t.trip_distance_id=f.trip_distance_id  
JOIN `psyched-canto-394618.uber_test_proj.rate_code_dim` as r 
ON r.rate_code_id=f.rate_code_id  
JOIN `psyched-canto-394618.uber_test_proj.pickup_location_dim` as pick 
ON pick.pickup_location_id=f.pickup_location_id
JOIN `psyched-canto-394618.uber_test_proj.dropoff_location_dim` as drop 
ON drop.dropoff_location_id=f.dropoff_location_id
JOIN `psyched-canto-394618.uber_test_proj.payment_type_dim` as pay 
ON pay.payment_type_id=f.payment_type_id
)
;