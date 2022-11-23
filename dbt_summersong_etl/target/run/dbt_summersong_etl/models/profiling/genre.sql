

  create  table "Summer_Song"."SummerSong_profile"."genre__dbt_tmp"
  as (
    

with genre as (
    select distinct
    g.artist,
    g.song,
    g.genre
    from "Summer_Song"."SummerSong"."genre" as g
)

select * from genre
  );