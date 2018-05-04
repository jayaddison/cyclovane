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
gdal_contour -a elev -i 100 SRTM_W_250m.tif contours.shp

# Transform the contours shapefile into a pgsql script
shp2pgsql contours.shp > contours.sql
```
