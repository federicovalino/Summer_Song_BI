

  create  table "Summer_Song"."SummerSong_staging"."stg_genres__dbt_tmp"
  as (
    

with genre as (
    select
    ROW_NUMBER() OVER(ORDER BY (spsg.genre)) AS id_genre,
    spsg.genre    
    from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spsg
)

select * from genre
  );