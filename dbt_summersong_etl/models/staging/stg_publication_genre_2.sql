{{ config(
    materialized="table",
    schema="staging"
) }}

with publication_genre_2 as (
    select
    spsg.id_song,
    spsg.genre as genre_1
    from {{ref('stg_publication_songgenres')}} as spsg  
    where spsg.genre not in (select spsg1.genre_1 from {{ref('stg_publicaction_genre_1')}} as spsg1 where spsg1.id_song = spsg.id_song)
    
)

select * from publication_genre_2