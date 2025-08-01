

with genre as (
    select distinct
    ROW_NUMBER() OVER(ORDER BY (spsg.genre)) AS id_genre,
    spsg.genre    
    from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spsg
)

select * from genre