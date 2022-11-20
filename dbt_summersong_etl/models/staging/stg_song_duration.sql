{{ config(
    materialized="table",
    schema="staging"
) }}

with song_duration as (
    select
    ROW_NUMBER() OVER(ORDER BY (d.song)) AS id_song,
    d.duration_ms
    from {{ source('source_db','duration') }}  as d
)

select * from song_duration