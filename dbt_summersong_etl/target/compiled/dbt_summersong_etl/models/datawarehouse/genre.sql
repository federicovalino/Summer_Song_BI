

with genres as (
    select distinct
    spg1.genre
    from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spg1
),

identified_genre as (
    select
    ROW_NUMBER() OVER(ORDER BY (spg.genre)) AS id_genre,
    spg.genre
    from genres as spg
)

select * from identified_genre