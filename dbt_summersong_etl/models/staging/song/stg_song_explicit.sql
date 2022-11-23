{{ config(
    materialized="table",
    schema="staging"
) }}

with song_explicit as (
    select
    e.id_song,
    e.explicit
    from {{ source('source_db','profiled_data') }} as e
)

select * from song_explicit