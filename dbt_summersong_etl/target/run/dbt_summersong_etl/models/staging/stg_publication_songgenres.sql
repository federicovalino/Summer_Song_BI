

  create  table "Summer_Song"."SummerSong_staging"."stg_publication_songgenres__dbt_tmp"
  as (
    

with publication_songgenres as (
    select ROW_NUMBER() OVER(ORDER BY (psg.song)) AS id_song,
    psg.song,
    unnest(string_to_array(psg.genre, ', ')) as genre
    from "Summer_Song"."SummerSong"."genre" as psg
)

select * from publication_songgenres
  );