{{ config(
    materialized="table",
    schema="staging"
) }}

with song_popularity as (
    select
    ROW_NUMBER() OVER(ORDER BY (p.song)) AS id_song,
    p.popularity
    from {{ source('source_db','popularity') }} as p
)

select * from song_popularity