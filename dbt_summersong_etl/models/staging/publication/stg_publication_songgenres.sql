{{ config(
    materialized="table",
    schema="staging"
) }}

with publication_songgenres as (
    select
    psg.id_song,
    psg.song,
    (string_to_array(psg.genre, ', '))[1] as genre,
    (string_to_array(psg.genre, ', '))[2] as genre_2
    from {{ source('source_db','profiled_data') }} as psg
)

select * from publication_songgenres