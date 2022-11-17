

with publication_genre_2 as (
    select
    spsg.id_song,
    spsg.genre as genre_1
    from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spsg  
    where spsg.genre not in (select spsg1.genre_1 from "Summer_Song"."SummerSong_staging"."stg_publicaction_genre_1" as spsg1 where spsg1.id_song = spsg.id_song)
    
)

select * from publication_genre_2