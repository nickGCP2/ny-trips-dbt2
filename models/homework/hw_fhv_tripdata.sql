{{ config(materialized='view') }}

select
  dispatching_base_num,

  cast(pulocationid as integer) as  pickup_locationid,
  cast(dolocationid as integer) as dropoff_locationid,
  
  -- timestamps
  cast(pickup_datetime as timestamp) as pickup_datetime,
  cast(dropoff_datetime as timestamp) as dropoff_datetime,
  
  -- trip info  
  sr_flag,
  
from {{ source('homework', 'fhv_taxi_external_table') }}