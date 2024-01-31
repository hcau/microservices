-- =======================
-- === INIT EXTENSIONS ===
-- =======================

-- Enable PostGIS (as of 3.0 contains just geometry/geography)
CREATE EXTENSION IF NOT EXISTS postgis;

-- in PostGIS 3, postgis_raster is a separate extension from postgis so do this in addition if you are experimenting PostGIS 3+
CREATE EXTENSION IF NOT EXISTS postgis_raster;

-- Enable PostGIS Advanced 3D and other geoprocessing algorithms sfcgal not available with all distributions
CREATE EXTENSION IF NOT EXISTS postgis_sfcgal;

-- rule based standardizer
CREATE EXTENSION IF NOT EXISTS address_standardizer;

-- fuzzy matching needed for Tiger
CREATE EXTENSION IF NOT EXISTS fuzzystrmatch;

-- Enable Topology
CREATE EXTENSION IF NOT EXISTS postgis_topology;

-- Enable US Tiger Geocoder
CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder;
