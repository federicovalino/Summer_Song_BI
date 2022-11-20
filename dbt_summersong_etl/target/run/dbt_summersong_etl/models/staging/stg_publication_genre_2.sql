

  create  table "Summer_Song"."SummerSong_staging"."stg_publication_genre_2__dbt_tmp"
  as (
    

with publication_genre_2 as (
    select distinct
    spg1.id_song,
    spg1.genre_1
    from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spsg  
    join "Summer_Song"."SummerSong_staging"."stg_genre_1" as spg1 on spg1.id_song=spsg.id_song where not spsg.genre = spg1.genre_1

)

select * from publication_genre_2
  );