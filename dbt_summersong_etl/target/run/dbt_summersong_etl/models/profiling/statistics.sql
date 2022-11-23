

  create  table "Summer_Song"."SummerSong_profile"."statistics__dbt_tmp"
  as (
    

with song_statistics as (
    select distinct
    ss.artist,
    ss.song,
    ss.danceability,
    ss.energy,
    ss.key,
    ss.loudness,
    ss.mode,
    ss.speechiness,
    ss.acousticness,
    ss.instrumentalness,
    ss.liveness,
    ss.valence,
    ss.tempo
    from "Summer_Song"."SummerSong"."statistics" as ss
)

select * from song_statistics
  );