

with song_statistics as (
    select
    ROW_NUMBER() OVER(ORDER BY (s.song)) AS id_song,
    s.danceability,
    s.energy,
    s.loudness,
    s.speechiness,
    s.acousticness,
    s.instrumentalness,
    s.liveness,
    s.valence,
    s.tempo
    from "Summer_Song"."SummerSong"."statistics" as s
)

select * from song_statistics