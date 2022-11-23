{{ config(
    materialized="table",
    schema="datawarehouse"
) }}

with song as (
    select
    ssy.id_song,
    ssy.song,
    ssy.artist,
    ssy.year,    
    ssd.duration_ms as duration,
    sse.explicit,
    sst.mode,
    sst.key,
    sst.tempo
    from {{ source('staging_db','stg_song_year') }} as ssy, {{ source('staging_db','stg_song_traits') }} as sst,
        {{ source('staging_db','stg_song_explicit') }} as sse, {{ source('staging_db','stg_song_duration') }} as ssd
        where
            ssy.id_song = sst.id_song and ssy.id_song = sse.id_song and ssy.id_song = ssd.id_song
)

select * from song