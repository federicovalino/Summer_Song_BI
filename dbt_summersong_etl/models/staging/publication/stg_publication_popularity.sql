{{ config(
    materialized="table",
    schema="staging"
) }}

with song_popularity as (
    select
    p.id_song,
    p.popularity
    from {{ source('source_db','profiled_data') }} as p
)

select * from song_popularity