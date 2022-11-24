

with song_duration as (
    select
    d.id_song,
    d.duration_ms
    from "Summer_Song"."SummerSong_profile"."profiled_data"  as d
)

select * from song_duration