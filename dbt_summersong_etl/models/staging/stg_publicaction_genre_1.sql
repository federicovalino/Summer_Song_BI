{{ config(
    materialized="table",
    schema="staging"
) }}

with publication_genre_1 as (
    select
    distinct spsg.id_song,
    sg.id_genre,
    spsg.genre as genre_1    
    from {{ref('stg_publication_songgenres')}} as spsg, {{ref('stg_genres')}}  as sg
        where
            sg.genre = genre_1
)

select * from publication_genre_1