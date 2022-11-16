{{ config(
    materialized="table",
    schema="staging"
) }}

with genre as (
    select
    ROW_NUMBER() OVER(ORDER BY (spsg.genre)) AS id_genre,
    spsg.genre    
    from {{ref('stg_publication_songgenres')}} as spsg
)

select * from genre