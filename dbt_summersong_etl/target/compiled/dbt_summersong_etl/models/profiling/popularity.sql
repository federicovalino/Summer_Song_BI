

with popularity as (
    select distinct
    p.artist,
    p.song,
    p.popularity
    from "Summer_Song"."SummerSong"."popularity" as p
)

select * from popularity