{{ config(
    materialized="table",
    schema="staging"
) }}

with song_duration as (
    select
    d.id_song,
    d.duration_ms
    from {{ source('source_db','profiled_data') }}  as d
)

select * from song_duration