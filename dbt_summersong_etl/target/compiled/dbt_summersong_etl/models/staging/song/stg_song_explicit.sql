

with song_explicit as (
    select
    e.id_song,
    e.explicit
    from "Summer_Song"."SummerSong_profile"."profiled_data" as e
)

select * from song_explicit