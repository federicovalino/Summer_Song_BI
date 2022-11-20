

  create  table "Summer_Song"."SummerSong_datawarehouse"."artist__dbt_tmp"
  as (
    

with artist as (
    select distinct
    spg1.artist as artist
    from "Summer_Song"."SummerSong_staging"."stg_song_year" as spg1
),

identified_artist as (
    select
    ROW_NUMBER() OVER(ORDER BY (spg.artist)) AS id_artist,
    spg.artist as artist
    from artist as spg
)


select * from identified_artist
  );