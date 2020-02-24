FROM nginx:mainline-alpine

COPY ./entrypoint.sh /
RUN chmod 755 /entrypoint.sh

COPY mime.types nginx.conf /etc/nginx/
COPY conf.d/ /etc/nginx/conf.d/

ARG ARCGIS_JS_ROOT=arcgis_js_v414_api/arcgis_js_api/library/4.14
COPY $ARCGIS_JS_ROOT/ /usr/share/nginx/arcgis/

ENV HOST=http://localhost/

ENTRYPOINT [ "/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]