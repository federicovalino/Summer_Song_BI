

  create  table "Summer_Song"."SummerSong_profile"."profiled_data__dbt_tmp"
  as (
    

with profiled_data as (
    select distinct
    d.artist,
    d.song,
    y.year,
    d.duration_ms,
    g.genre,
    p.popularity,
    ri.explicit,
    ss.danceability,
    ss.energy,
    ss.key,
    ss.loudness,
    ss.mode,
    ss.speechiness,
    ss.acousticness,
    ss.instrumentalness,
    ss.liveness,
    ss.valence,
    ss.tempo
    from "Summer_Song"."SummerSong"."duration" as d
    inner join "Summer_Song"."SummerSong"."genre" as g on (g.artist=d.artist and g.song=d.song)
    inner join "Summer_Song"."SummerSong"."year" as y on (y.artist=d.artist and y.song=d.song)
    inner join "Summer_Song"."SummerSong"."statistics"  as ss on (ss.artist=d.artist and ss.song=d.song)
    inner join "Summer_Song"."SummerSong"."regulatory_information" as ri on (ri.artist=d.artist and ri.song=d.song)
    inner join "Summer_Song"."SummerSong"."popularity" as p on (d.artist=p.artist and d.song=p.song)
),

identified_profiled_data as (
    select distinct
    ROW_NUMBER() OVER(ORDER BY (pf.song)) AS id_song,
    pf.artist,
    pf.song,
    pf.year,
    pf.duration_ms,
    pf.genre,
    pf.popularity,
    pf.explicit,
    pf.danceability,
    pf.energy,
    pf.key,
    pf.loudness,
    pf.mode,
    pf.speechiness,
    pf.acousticness,
    pf.instrumentalness,
    pf.liveness,
    pf.valence,
    pf.tempo
    from profiled_data as pf
)

select * from identified_profiled_data as ipd
    where ipd.genre <> 'set()' and ipd.genre <> '79,635'
  );