

  create  table "Summer_Song"."SummerSong_staging"."stg_song_traits__dbt_tmp"
  as (
    

with song_traits as (
    select
    ROW_NUMBER() OVER(ORDER BY (t.song)) AS id_song,
    t.mode,
    t.key,
    t.tempo
    from "Summer_Song"."SummerSong"."statistics" as t
)

select * from song_traits
  );