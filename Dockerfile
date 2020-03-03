ARG BASE_REGISTRY=docker.io
ARG BASE_IMAGE=nginx
ARG BASE_TAG=mainline-alpine

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

ARG ARCGIS_JS_ROOT=arcgis_js_v414_api/arcgis_js_api/library/4.14
COPY $ARCGIS_JS_ROOT/ /usr/share/nginx/arcgis/

COPY ./entrypoint.sh /
RUN chmod 755 /entrypoint.sh

COPY mime.types nginx.conf /etc/nginx/
COPY conf.d/ /etc/nginx/conf.d/

ENV HOST=http://localhost/

ENTRYPOINT [ "/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
