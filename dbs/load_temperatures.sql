insert into temperatures (geom, start_date, end_date, temperature)
with dates as (
    select min(i) as start_date, max(i) as end_date
    from generate_series('2018-01-01'::timestamp, '2018-02-01'::timestamp, '1 day'::interval) as i
    where i < '2018-02-01'::timestamp
)
select geom, start_date, end_date, elev from dates cross join "wc2.0_30s_tavg_01.tif.translated.tif";

insert into temperatures (geom, start_date, end_date, temperature)
with dates as (
    select min(i) as start_date, max(i) as end_date
    from generate_series('2018-02-01'::timestamp, '2018-03-01'::timestamp, '1 day'::interval) as i
    where i < '2018-03-01'::timestamp
)
select geom, start_date, end_date, elev from dates cross join "wc2.0_30s_tavg_02.tif.translated.tif";

insert into temperatures (geom, start_date, end_date, temperature)
with dates as (
    select min(i) as start_date, max(i) as end_date
    from generate_series('2018-03-01'::timestamp, '2018-04-01'::timestamp, '1 day'::interval) as i
    where i < '2018-04-01'::timestamp
)
select geom, start_date, end_date, elev from dates cross join "wc2.0_30s_tavg_03.tif.translated.tif";

insert into temperatures (geom, start_date, end_date, temperature)
with dates as (
    select min(i) as start_date, max(i) as end_date
    from generate_series('2018-04-01'::timestamp, '2018-05-01'::timestamp, '1 day'::interval) as i
    where i < '2018-05-01'::timestamp
)
select geom, start_date, end_date, elev from dates cross join "wc2.0_30s_tavg_04.tif.translated.tif";

insert into temperatures (geom, start_date, end_date, temperature)
with dates as (
    select min(i) as start_date, max(i) as end_date
    from generate_series('2018-05-01'::timestamp, '2018-06-01'::timestamp, '1 day'::interval) as i
    where i < '2018-06-01'::timestamp
)
select geom, start_date, end_date, elev from dates cross join "wc2.0_30s_tavg_05.tif.translated.tif";

insert into temperatures (geom, start_date, end_date, temperature)
with dates as (
    select min(i) as start_date, max(i) as end_date
    from generate_series('2018-06-01'::timestamp, '2018-07-01'::timestamp, '1 day'::interval) as i
    where i < '2018-07-01'::timestamp
)
select geom, start_date, end_date, elev from dates cross join "wc2.0_30s_tavg_06.tif.translated.tif";

insert into temperatures (geom, start_date, end_date, temperature)
with dates as (
    select min(i) as start_date, max(i) as end_date
    from generate_series('2018-07-01'::timestamp, '2018-08-01'::timestamp, '1 day'::interval) as i
    where i < '2018-08-01'::timestamp
)
select geom, start_date, end_date, elev from dates cross join "wc2.0_30s_tavg_07.tif.translated.tif";

insert into temperatures (geom, start_date, end_date, temperature)
with dates as (
    select min(i) as start_date, max(i) as end_date
    from generate_series('2018-08-01'::timestamp, '2018-09-01'::timestamp, '1 day'::interval) as i
    where i < '2018-09-01'::timestamp
)
select geom, start_date, end_date, elev from dates cross join "wc2.0_30s_tavg_08.tif.translated.tif";

insert into temperatures (geom, start_date, end_date, temperature)
with dates as (
    select min(i) as start_date, max(i) as end_date
    from generate_series('2018-09-01'::timestamp, '2018-10-01'::timestamp, '1 day'::interval) as i
    where i < '2018-10-01'::timestamp
)
select geom, start_date, end_date, elev from dates cross join "wc2.0_30s_tavg_09.tif.translated.tif";

insert into temperatures (geom, start_date, end_date, temperature)
with dates as (
    select min(i) as start_date, max(i) as end_date
    from generate_series('2018-10-01'::timestamp, '2018-11-01'::timestamp, '1 day'::interval) as i
    where i < '2018-11-01'::timestamp
)
select geom, start_date, end_date, elev from dates cross join "wc2.0_30s_tavg_10.tif.translated.tif";

insert into temperatures (geom, start_date, end_date, temperature)
with dates as (
    select min(i) as start_date, max(i) as end_date
    from generate_series('2018-11-01'::timestamp, '2018-12-01'::timestamp, '1 day'::interval) as i
    where i < '2018-12-01'::timestamp
)
select geom, start_date, end_date, elev from dates cross join "wc2.0_30s_tavg_11.tif.translated.tif";

insert into temperatures (geom, start_date, end_date, temperature)
with dates as (
    select min(i) as start_date, max(i) as end_date
    from generate_series('2018-12-01'::timestamp, '2019-01-01'::timestamp, '1 day'::interval) as i
    where i < '2019-01-01'::timestamp
)
select geom, start_date, end_date, elev from dates cross join "wc2.0_30s_tavg_12.tif.translated.tif";;
