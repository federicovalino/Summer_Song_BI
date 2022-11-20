

  create  table "Summer_Song"."SummerSong_staging"."stg_publicaction_genre_1__dbt_tmp"
  as (
    

with publication_genre_1 as (
    select distinct
    spsg.id_song,
    spsg.genre as genre_1    
    from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spsg
        where spsg.genre in (select spsg1.genre from
            (select spsg2.id_song,spsg2.genre from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spsg2 
                where spsg.id_song=spsg2.id_song LIMIT 1) as spsg1)
)

select * from publication_genre_1
  );