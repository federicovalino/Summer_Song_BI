

with song_year as (
    select
    y.id_song,
    y.artist,
    y.song,
    y.year
    from "Summer_Song"."SummerSong_profile"."profiled_data" as y
)

select * from song_year