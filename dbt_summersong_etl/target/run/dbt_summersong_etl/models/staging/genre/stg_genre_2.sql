

  create  table "Summer_Song"."SummerSong_staging"."stg_genre_2__dbt_tmp"
  as (
    

with stg_genre_2 as (
    select distinct
    spsg.id_song,
    spsg.genre
    from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spsg 
    inner join "Summer_Song"."SummerSong_staging"."stg_genre_1" as spg1 on spsg.id_song = spg1.id_song
)

select * from stg_genre_2
  );