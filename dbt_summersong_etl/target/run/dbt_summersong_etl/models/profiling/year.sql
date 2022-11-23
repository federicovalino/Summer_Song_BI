

  create  table "Summer_Song"."SummerSong_profile"."year__dbt_tmp"
  as (
    

with year as (
    select distinct
    y.artist,
    y.song,
    y.year
    from "Summer_Song"."SummerSong"."year" as y
)

select * from year
  );