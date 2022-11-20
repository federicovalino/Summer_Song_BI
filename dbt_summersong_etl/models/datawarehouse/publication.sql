{{ config(
    materialized="table",
    schema="datawarehouse"
) }}

with publication_genre_1 as (
    select
    sps.id_song,
    gen.id_genre as id_principal_genre
    from {{ source('staging_db','stg_publication_statistics') }} as sps, {{ref('genre')}} as gen, 
         {{ source('staging_db','stg_genre_1') }} as spg1
         where
             sps.id_song = spg1.id_song and gen.genre = spg1.genre_1
),

publication_genre_2 as (
    select
    sps.id_song,
    gen.id_genre as id_secondary_genre
    from {{ source('staging_db','stg_publication_statistics') }} as sps, {{ref('genre')}} as gen, 
         {{ source('staging_db','stg_genre_2') }} as spg2
         where
             sps.id_song = spg2.id_song and gen.genre = spg2.genre_1
),

publication_artist as (
    select
    ssy.id_song,
    art.id_artist
    from {{ source('staging_db','stg_song_year') }} as ssy, {{ref('artist')}} as art
         where
             ssy.artist = art.artist
),

publication as (
    select
    sps.id_song,
    pg1.id_principal_genre,
    pg2.id_secondary_genre,
    pa.id_artist,
    sps.danceability,
    sps.energy,
    sps.loudness,
    sps.speechiness,
    sps.acousticness,
    sps.instrumentalness,
    sps.liveness,
    sps.valence
    from {{ source('staging_db','stg_publication_statistics') }} as sps
    inner join
        publication_genre_1 as pg1 on
            pg1.id_song = sps.id_song
    inner join
        publication_artist as pa on
            pa.id_song = sps.id_song
    full outer join
        publication_genre_2 as pg2 on
        pg2.id_song = sps.id_song
)

select distinct * from publication