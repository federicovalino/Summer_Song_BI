

with genre_1 as (
    select spg1.genre_1 as genre from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spg1
),

genre_2 as (
    select spg2.genre_2 as genre from "Summer_Song"."SummerSong_staging"."stg_publication_songgenres" as spg2
),

union_genres as (
    select spg1.genre from genre_1 as spg1
    UNION
    select spg2.genre from genre_2 as spg2
    ORDER By genre
),

identified_genre as (
    select distinct
    ROW_NUMBER() OVER(ORDER BY (spg.genre)) AS id_genre,
    spg.genre
    from union_genres as spg
)

select * from identified_genre