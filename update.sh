#!/usr/bin/env bash

bower install "mustache.js"
PACKAGE_VERSION=$(bower info mustache.js version | tail -n 1 | cut -d "'" -f 2)
cd ./bower_components
zip -r "../mustache.js-$PACKAGE_VERSION.zip" ./mustache.js/mustache.js ./mustache.js/mustache.min.js ./mustache.js/README.md ./mustache.js/LICENSE
cd ..
scp "mustache.js-$PACKAGE_VERSION.zip" distrib@ftp.anakeen.com:/share/ftp/third-party/
echo $PACKAGE_VERSION > VERSION