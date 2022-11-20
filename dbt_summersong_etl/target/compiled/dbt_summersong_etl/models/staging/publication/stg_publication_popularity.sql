

with song_popularity as (
    select
    ROW_NUMBER() OVER(ORDER BY (p.song)) AS id_song,
    p.popularity
    from "Summer_Song"."SummerSong"."popularity" as p
)

select * from song_popularity