

with song_explicit as (
    select
    ROW_NUMBER() OVER(ORDER BY (e.song)) AS id_song,
    e.explicit
    from "Summer_Song"."SummerSong"."regulatory_information" as e
)

select * from song_explicit