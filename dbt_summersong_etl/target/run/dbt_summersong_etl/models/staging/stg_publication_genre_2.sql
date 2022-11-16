

  create  table "Summer_Song"."SummerSong_staging"."stg_publication_genre_2__dbt_tmp"
  as (
    

with publication_genre_2 as (
    select
    distinct spsg.id_song,
    sg.id_genre,
    spsg.genre as genre_2    
    from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spsg, "Summer_Song"."SummerSong_staging"."stg_publicaction_genre_1" as spg1, 
    "Summer_Song"."SummerSong_staging"."stg_genres"  as sg
    where
        spsg.id_song = spg1.id_song and spsg.genre <> spg1.genre_1 
)

select * from publication_genre_2
  );