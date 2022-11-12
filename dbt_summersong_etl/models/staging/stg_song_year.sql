{{ config(
    materialized="table",
    schema="staging"
) }}

with song_year as (
    select
    ROW_NUMBER() OVER(ORDER BY (y.song)) AS id_song,
    y.artist,
    y.song,
    y.year
    from {{ source('source_db','year') }} as y
)

select * from song_year