{{ config(
    materialized="table",
    schema="staging"
) }}

with stg_genre_2 as (
    select distinct
    spsg.id_song,
    spsg.genre
    from {{ref('stg_publication_songgenres')}} as spsg 
    inner join {{ref('stg_genre_1')}} as spg1 on spsg.id_song = spg1.id_song
)

select * from stg_genre_2