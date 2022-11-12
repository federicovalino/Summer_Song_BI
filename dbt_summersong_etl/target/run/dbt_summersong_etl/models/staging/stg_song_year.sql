

  create  table "Summer_Song"."SummerSong_staging"."stg_song_year__dbt_tmp"
  as (
    

with song_year as (
    select
    ROW_NUMBER() OVER(ORDER BY (y.artist)) AS id_song,
    y.artist,
    y.song,
    y.year
    from "Summer_Song"."SummerSong"."year" as y
)

select * from song_year
  );