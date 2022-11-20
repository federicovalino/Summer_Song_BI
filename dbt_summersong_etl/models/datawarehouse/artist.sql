{{ config(
    materialized="table",
    schema="datawarehouse"
) }}

with artist as (
    select distinct
    spg1.artist as artist
    from {{ source('staging_db','stg_song_year') }} as spg1
),

identified_artist as (
    select
    ROW_NUMBER() OVER(ORDER BY (spg.artist)) AS id_artist,
    spg.artist as artist
    from artist as spg
)


select * from identified_artist