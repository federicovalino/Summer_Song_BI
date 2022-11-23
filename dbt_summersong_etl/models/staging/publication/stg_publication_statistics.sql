{{ config(
    materialized="table",
    schema="staging"
) }}

with song_statistics as (
    select
    s.id_song,
    s.danceability,
    s.energy,
    s.loudness,
    s.speechiness,
    s.acousticness,
    s.instrumentalness,
    s.liveness,
    s.valence,
    s.tempo
    from {{ source('source_db','profiled_data') }} as s
)

select * from song_statistics