

  create  table "Summer_Song"."SummerSong_staging"."stg_publication_songgenres__dbt_tmp"
  as (
    

with publication_songgenres as (
    select
    psg.id_song,
    psg.song,
    (string_to_array(psg.genre, ', '))[1] as genre,
    (string_to_array(psg.genre, ', '))[2] as genre_2
    from "Summer_Song"."SummerSong_profile"."profiled_data" as psg
)

select * from publication_songgenres
  );