#!/bin/sh

cd /usr/share/nginx/arcgis

sed -i 's|https://\[HOSTNAME_AND_PATH_TO_JSAPI\]|'$HOST'|g' init.js
sed -i 's|https://\[HOSTNAME_AND_PATH_TO_JSAPI\]|'$HOST'|g' dojo/dojo.js
sed -i 's|https://\[HOSTNAME_AND_PATH_TO_JSAPI\]|'$HOST'|g' dojo/dojo-lite.js

# Forward args to CMD
exec "$@"
