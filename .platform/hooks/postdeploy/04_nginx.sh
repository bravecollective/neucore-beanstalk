#!/bin/bash

# Commenting out gzip directives so they can be changed in custom.conf.
sed -i '/^\s*gzip/s/^\(.*\)$/#\1/' /etc/nginx/nginx.conf

# Commenting in custom gzip directives.
sed -i -e 's/^#\(gzip.*\)/\1/' /etc/nginx/conf.d/elasticbeanstalk/custom.conf

service nginx reload
