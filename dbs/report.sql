with trip_spec as (
    select
        '2018-05-13'::timestamp as start_date,
        '90 days'::interval as duration
),
trip_dates as (
    select
        date,
        extract(day from date - start_date) as day,
        (extract(day from date - start_date) / extract(day from duration)) as completion
    from trip_spec
    cross join generate_series(
        start_date,
        start_date + duration,
        '1 day'::interval
    ) as date
),
trace_segments as (
    select
        a.date,
        a.day,
        st_linesubstring(t.geom, a.completion, b.completion) as geom
    from trip_dates as a
    join trip_dates as b on b.day = a.day + 1
    cross join traces as t
),
segment_places as (
    select
        s.date,
        s.day,
        s.geom,
        p.name,
        p.population
    from trace_segments as s
    cross join places as p
    where st_intersects(p.geom, s.geom)
),
segment_elevations as (
    select
        s.date,
        s.day,
        s.geom,
        e.elevation
    from trace_segments as s
    cross join elevations as e
    where st_intersects(e.geom, s.geom)
),
segment_temperatures as (
    select
        s.date,
        s.day,
        s.geom,
        t.temperature
    from trace_segments as s
    cross join temperatures as t
    where st_intersects(t.geom, s.geom)
    and s.date between t.start_date and t.end_date
),
daily_report as
(
    select
        date,
        day,
        geom,
        name,
        population,
        null::float as elevation,
        null::float as temperature
    from segment_places

    union all

    select
        date,
        day,
        geom,
        null as population,
        null as name,
        elevation,
        null as temperature
    from segment_elevations

    union all

    select
        date,
        day,
        geom,
        null as population,
        null as name,
        null as elevation,
        temperature
    from segment_temperatures
)
select
    date,
    day,
    -- st_asgeojson(st_union(geom)) as geom,
    string_agg(distinct name, ','),
    max(population) as max_population,
    min(elevation) as min_elevation,
    max(elevation) as max_elevation,
    min(temperature) as min_temperature,
    max(temperature) as max_temperature
from daily_report
group by
    date,
    day
order by
    date asc,
    day asc
