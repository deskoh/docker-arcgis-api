# Docker ArcGIS API Server

Docker image for self-hosting ArcGIS API for JavaScript.

## Quick Start

[ArcGIS API for JavaScript Download Page](http://links.esri.com/javascript-api/latest-download)

```sh
# Download and extract ArcGIS API into current folder

# Build image
docker build --build-arg ARCGIS_JS_ROOT=arcgis_js_v414_api/arcgis_js_api/library/4.14 . -t arcgis

# ArcGIS API available at http://localhost:8080/
docker run --rm -it -e HOST=http://localhost:8080/ -p 8080:80 arcgis
```
