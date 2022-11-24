

with song_popularity as (
    select
    p.id_song,
    p.popularity
    from "Summer_Song"."SummerSong_profile"."profiled_data" as p
)

select * from song_popularity