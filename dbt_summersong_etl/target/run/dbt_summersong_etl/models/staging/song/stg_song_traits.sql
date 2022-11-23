

  create  table "Summer_Song"."SummerSong_staging"."stg_song_traits__dbt_tmp"
  as (
    

with song_traits as (
    select
    t.id_song,
    t.mode,
    t.key,
    t.tempo
    from "Summer_Song"."SummerSong_profile"."profiled_data" as t
)

select * from song_traits
  );