{{ config(
    materialized="table",
    schema="profile"
) }}

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
    from {{ source('profiling_db','duration') }} as d
    inner join {{ source('profiling_db','genre') }} as g on (g.artist=d.artist and g.song=d.song)
    inner join {{ source('profiling_db','year') }} as y on (y.artist=d.artist and y.song=d.song)
    inner join {{ source('profiling_db','statistics') }}  as ss on (ss.artist=d.artist and ss.song=d.song)
    inner join {{ source('profiling_db','regulatory_information') }} as ri on (ri.artist=d.artist and ri.song=d.song)
    inner join {{ source('profiling_db','popularity') }} as p on (d.artist=p.artist and d.song=p.song)
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

select * from profiled_data 