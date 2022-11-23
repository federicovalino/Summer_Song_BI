

with song_statistics as (
    select
    s.id_song,
    s.danceability,
    s.energy,
    s.loudness,
    s.speechiness,
    s.acousticness,
    s.instrumentalness,
    s.liveness,
    s.valence,
    s.tempo
    from "Summer_Song"."SummerSong_profile"."profiled_data" as s
)

select * from song_statistics