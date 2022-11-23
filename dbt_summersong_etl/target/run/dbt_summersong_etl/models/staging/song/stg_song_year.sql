

  create  table "Summer_Song"."SummerSong_staging"."stg_song_year__dbt_tmp"
  as (
    

with song_year as (
    select
    y.id_song,
    y.artist,
    y.song,
    y.year
    from "Summer_Song"."SummerSong_profile"."profiled_data" as y
)

select * from song_year
  );