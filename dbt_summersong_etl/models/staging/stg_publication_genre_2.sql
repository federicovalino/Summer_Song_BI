{{ config(
    materialized="table",
    schema="staging"
) }}

with publication_genre_2 as (
    select distinct
    spg1.id_song,
    spg1.genre_1
    from {{ref('stg_publication_songgenres')}} as spsg  
    join {{ref('stg_publicaction_genre_1')}} as spg1 on spg1.id_song=spsg.id_song where not spsg.genre = spg1.genre_1

)

select * from publication_genre_2