{{ config(
    materialized="table",
    schema="staging"
) }}

with song_year as (
    select
    ROW_NUMBER() OVER(ORDER BY (p.artist)) AS id_song,
    p.artist,
    p.name,
    p.year
    from {{ source('staging', 'year') }}
)

select * from song_year