# Neucore Beanstalk

Deploys a pre-built Neucore version from https://github.com/tkhamez/neucore/releases
or a local build with plugins to [AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk).

## Create

- Add an IAM user with Policy "AWSElasticBeanstalkFullAccess"
- Create a database (RDS)
- Create app environment, select "PHP 8.1" platform:
    ```
    eb init -i
    eb create --single -i t4g.micro
    ```
- Add a security group for the database that allows the new environment
- Add a database for Neucore
- Add environment variables
  - NEUCORE_APP_ENV and NEUCORE_DATABASE_URL
  - NEUCORE_EVE_CALLBACK_URL, NEUCORE_EVE_CLIENT_ID and NEUCORE_EVE_SECRET_KEY
  - optional NEUCORE_SESSION_SECURE=0 if you are testing and have not setup HTTPS
  - optional NEUCORE_LOG_PATH=/var/app/shared/logs
  - optional NEUCORE_CACHE_DIR=/var/app/shared/cache
  - optional NEUCORE_EVE_SCOPES and any other setting you want to change
  - Any variables needed for plugins.

Note: You need to redeploy the application after changing an environment variable or execute
`sudo /var/app/current/.platform/hooks/postdeploy/03_set_env.sh`.

## Deploy/Update

Initial:
- `git clone https://github.com/bravecollective/neucore-beanstalk --recurse-submodules`

Update:
- `git pull --recurse-submodules`
- Adjust the version in `deploy.sh` to an existing release.
- Then commit and execute: `eb deploy`, make sure that eb includes submodules.

You can also create a distribution with the `setup/dist.sh` script from the 
[Neucore repository](https://github.com/tkhamez/neucore), add that file here and deploy that. For example:
- add the file `neucore-57391a3.tar.gz`
- set version to `57391a3`
- `git add . && eb deploy --staged --message "commit 57391a3"`
