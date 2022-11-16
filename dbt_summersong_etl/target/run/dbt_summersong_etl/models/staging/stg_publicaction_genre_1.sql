

  create  table "Summer_Song"."SummerSong_staging"."stg_publicaction_genre_1__dbt_tmp"
  as (
    

with publication_genre_1 as (
    select
    distinct spsg.id_song,
    sg.id_genre,
    spsg.genre as genre_1    
    from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spsg, "Summer_Song"."SummerSong_staging"."stg_genres"  as sg
)

select * from publication_genre_1
  );