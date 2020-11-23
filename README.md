# Neucore Beanstalk

Deploys a pre-build Neucore version from https://github.com/tkhamez/neucore/releases
or a local build to [AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk).

(If you clone this, remove .ebextensions/keys.config and the tracking code from theme.js, they won't work for you.)

## Create

- Add an IAM user with Policy "AWSElasticBeanstalkFullAccess"
- Create a database (RDS)
- Create app environment:
    ```
    eb init -i
    eb create neucore-prod
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

Note: You need to redeploy the application after changing an environment variable.

## Deploy/Update

- Adjust the version in `deploy.sh` to an existing release
- Then commit and execute: `eb deploy`

You can also create a distribution with the `dist.sh` script from the 
[main Neucore repository](https://github.com/tkhamez/neucore), add that file here and deploy that. For example:
- add the file `neucore-57391a3.tar.gz`
- set version to `57391a3`
- `git add . && eb deploy --staged --message "commit 57391a3"`
