

  create  table "Summer_Song"."SummerSong_staging"."stg_song_duration__dbt_tmp"
  as (
    

with song_duration as (
    select
    d.id_song,
    d.duration_ms
    from "Summer_Song"."SummerSong_profile"."profiled_data"  as d
)

select * from song_duration
  );