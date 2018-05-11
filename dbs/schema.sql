create table traces (geom geometry, start_date timestamp, duration interval);
create table places (geom geometry, name text, population int);
create table elevations (geom geometry, elevation float);
create table temperatures (geom geometry, start_date timestamp, end_date timestamp, temperature float);
