

with genres as (
    select distinct
    spg1.genre_1 as genre
    from "Summer_Song"."SummerSong_staging"."stg_genre_1" as spg1
),

identified_genre as (
    select
    ROW_NUMBER() OVER(ORDER BY (spg.genre)) AS id_genre,
    spg.genre
    from genres as spg
)

select * from identified_genre