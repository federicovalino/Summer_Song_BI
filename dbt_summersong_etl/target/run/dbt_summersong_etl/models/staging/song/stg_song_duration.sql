

  create  table "Summer_Song"."SummerSong_staging"."stg_song_duration__dbt_tmp"
  as (
    

with song_duration as (
    select
    ROW_NUMBER() OVER(ORDER BY (d.song)) AS id_song,
    d.duration_ms
    from "Summer_Song"."SummerSong"."duration"  as d
)

select * from song_duration
  );