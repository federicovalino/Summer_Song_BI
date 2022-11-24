

with regulatory_information as (
    select distinct
    ri.artist,
    ri.song,
    ri.explicit
    from "Summer_Song"."SummerSong"."regulatory_information" as ri
)

select * from regulatory_information