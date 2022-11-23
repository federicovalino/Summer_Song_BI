

with duration as (
    select distinct
    d.artist,
    d.song,
    d.duration_ms
    from "Summer_Song"."SummerSong"."duration" as d
)

select * from duration