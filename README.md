# Docker ArcGIS API Server

Docker image for self-hosting ArcGIS API for JavaScript.

## Quick Start

[ArcGIS API for JavaScript Download Page](http://links.esri.com/javascript-api/latest-download)

```sh
# Download and extract ArcGIS API into current folder

# Build image
docker build --build-arg ARCGIS_JS_ROOT=arcgis_js_v414_api/arcgis_js_api/library/4.14 . -t arcgis-api

# ArcGIS API available at http://localhost:8080/
docker run --rm -it -e HOST=http://localhost:8080/ -p 8080:80 arcgis-api
```

## Recipes for Hosting Multiple API Versions

### Docker Compose

```sh
# Start containers (in detached mode)
docker-compose -f compose/docker-compose.yml up -d

# Stop running containers
docker-compose -f compose/docker-compose.yml stop

# Stop and remove running containers
docker-compose -f compose/docker-compose.yml down

# Remove stopped containers
docker-compose -f compose/docker-compose.yml rm
```

### Alternative

```sh
!#/bin/sh

docker create --name arcgis-fonts -p 8400:80 -e HOST=http://arcgis.io/4.14/ p.cr.io/arcgis-fonts
docker create --name arcgis-414 -p 8414:80 -e HOST=http://arcgis.io/4.14/ p.cr.io/arcgis-api:4.14
docker create --name arcgis-413 -p 8413:80 -e HOST=http://arcgis.io/4.13/ p.cr.io/arcgis-api:4.13
docker create --name arcgis-412 -p 8412:80 -e HOST=http://arcgis.io/4.12/ p.cr.io/arcgis-api:4.12
docker create --name arcgis-411 -p 8411:80 -e HOST=http://arcgis.io/4.11/ p.cr.io/arcgis-api:4.11

docker start arcgis-414
docker start arcgis-413
docker start arcgis-412
docker start arcgis-411

docker create --name arcgis-server --net host -v /root/nginx/nginx.conf:/etc/nginx/nginx.conf cr.io/nginx:mainline-alpine
docker start arcgis-server
```
