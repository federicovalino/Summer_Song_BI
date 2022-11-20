{{ config(
    materialized="table",
    schema="staging"
) }}

with song_traits as (
    select
    ROW_NUMBER() OVER(ORDER BY (t.song)) AS id_song,
    t.mode,
    t.key,
    t.tempo
    from {{ source('source_db','statistics') }} as t
)

select * from song_traits