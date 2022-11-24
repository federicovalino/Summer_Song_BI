

with year as (
    select distinct
    y.artist,
    y.song,
    y.year
    from "Summer_Song"."SummerSong"."year" as y
)

select * from year