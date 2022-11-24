{{ config(
    materialized="table",
    schema="staging"
) }}

with song_year as (
    select
    y.id_song,
    y.artist,
    y.song,
    y.year
    from {{ source('source_db','profiled_data') }} as y
)

select * from song_year