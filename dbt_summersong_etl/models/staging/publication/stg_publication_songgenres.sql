{{ config(
    materialized="table",
    schema="staging"
) }}

with publication_songgenres as (
    select ROW_NUMBER() OVER(ORDER BY (psg.song)) AS id_song,
    psg.song,
    unnest(string_to_array(psg.genre, ', ')) as genre
    from {{ source('source_db','genre') }} as psg
)

select * from publication_songgenres