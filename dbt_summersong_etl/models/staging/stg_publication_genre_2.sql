{{ config(
    materialized="table",
    schema="staging"
) }}

with publication_genre_2 as (
    select
    distinct spsg.id_song,
    sg.id_genre,
    spsg.genre as genre_2    
    from {{ref('stg_publication_songgenres')}} as spsg, {{ref('stg_publicaction_genre_1')}} as spg1, 
    {{ref('stg_genres')}}  as sg
    where
        spsg.id_song = spg1.id_song and spsg.genre <> spg1.genre_1 
)

select * from publication_genre_2