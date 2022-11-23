

  create  table "Summer_Song"."SummerSong_datawarehouse"."dim_song__dbt_tmp"
  as (
    

with song as (
    select
    ssy.id_song,
    ssy.song,
    ssy.artist,
    ssy.year,    
    ssd.duration_ms as duration,
    sse.explicit,
    sst.mode,
    sst.key,
    sst.tempo
    from "Summer_Song"."SummerSong_staging"."stg_song_year" as ssy, "Summer_Song"."SummerSong_staging"."stg_song_traits" as sst,
        "Summer_Song"."SummerSong_staging"."stg_song_explicit" as sse, "Summer_Song"."SummerSong_staging"."stg_song_duration" as ssd
        where
            ssy.id_song = sst.id_song and ssy.id_song = sse.id_song and ssy.id_song = ssd.id_song
)

select * from song
  );