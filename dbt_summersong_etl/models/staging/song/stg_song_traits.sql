{{ config(
    materialized="table",
    schema="staging"
) }}

with song_traits as (
    select
    t.id_song,
    t.mode,
    t.key,
    t.tempo
    from {{ source('source_db','profiled_data') }} as t
)

select * from song_traits