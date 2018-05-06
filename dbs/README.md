Cyclovane Database
==================
The cyclovane database contains geographical data (such as temperature and
elevation profiling) which is used to provide the cyclovane service.

This document explains the data types and import processes required to build
and maintain the database.


Elevation Data Loading
----------------------
Elevation data is sourced from CGIAR-CSI - 250m resolution elevation data
can be downloaded in bulk TIF format from http://srtm.csi.cgiar.org/index.asp

This is in raster format, which requires conversion into contours so that we
can intersect travel paths with the contours and determine elevation gain and
loss.

To create a PostGIS script to load the data, run the following:

```
# Create a contours shapefile at 100m resolution from the elevation raster
gdal_contour -a elev -i 100 SRTM_W_250m.tif elevation_contours.shp

# Transform the contours shapefile into a pgsql script
shp2pgsql elevation_contours.shp > elevation_contours.sql
```


Weather Data Loading
------------------------
Weather data is sourced from https://worldclim.org, which provides TIFF format
mean monthly temperature and preciptation data amongst other data series.

Contours can be created from this data too, but this requires some
preprocessing, notably converting to integer values and ensuring that empty
values are removed.

The following commands can be used to create a PostGIS script from a source
file:

```
# Reformat the floating-point worldclim data to integer values
gdal_translate -of GTiff -ot Int16 -a_nodata -32768 wc2.0_30s_tavg_01.tif wc2.0_30s_tavg_01.translated.tif

# Create per-degree contours from the source data
gdal_contour -a elev -i 1 wc2.0_30s_tavg_01.translated.tif temperature_contours_01.shp

# Transform the contours shapefile into a pgsql script
shp2pgsql temperature_contours_01.shp > temperature_contours_01.sql
```
