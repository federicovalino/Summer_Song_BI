

with publication_genre_1 as (
    select
    spsg.id_song,
    gen.id_genre as id_principal_genre
    from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spsg, "Summer_Song"."SummerSong_datawarehouse"."dim_genre" as gen
         where
            gen.genre = spsg.genre_1
),

publication_genre_2 as (
    select distinct
    spsg.id_song,
    gen.id_genre as id_secondary_genre
    from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spsg, "Summer_Song"."SummerSong_datawarehouse"."dim_genre" as gen
         where
            gen.genre = spsg.genre_2
),

publication_artist as (
    select
    ssy.id_song,
    art.id_artist
    from "Summer_Song"."SummerSong_staging"."stg_song_year" as ssy, "Summer_Song"."SummerSong_datawarehouse"."dim_artist" as art
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
    from "Summer_Song"."SummerSong_staging"."stg_publication_statistics" as sps
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