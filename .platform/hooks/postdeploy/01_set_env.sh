#!/bin/bash

# copy file and add "export " at the beginning
sed -E -n 's/[^#]+/export &/ p' /opt/elasticbeanstalk/deployment/env > /opt/elasticbeanstalk/deployment/custom_env_var

# add quotation marks around values
sed 's/\(=[[:blank:]]*\)\(.*\)/\1"\2"/' -i /opt/elasticbeanstalk/deployment/custom_env_var

chmod 644 /opt/elasticbeanstalk/deployment/custom_env_var
rm -f /opt/elasticbeanstalk/deployment/*.bak
