# neucore-beanstalk

Deploys a pre-build Neucore version from https://github.com/tkhamez/neucore/releases
to AWS Elastic Beanstalk.

(If you clone this, remove .ebextensions/keys.config, it will not work for you ;).)

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
  - BRAVECORE_APP_ENV and BRAVECORE_DATABASE_URL
  - BRAVECORE_EVE_CALLBACK_URL, BRAVECORE_EVE_CLIENT_ID and BRAVECORE_EVE_SECRET_KEY
  - optional BRAVECORE_SESSION_SECURE=0 if you are testing and have not setup HTTPS
  - optional BRAVECORE_LOG_PATH=/var/app/shared/logs
  - optional BRAVECORE_CACHE_DIR=/var/app/shared/cache
  - optional BRAVECORE_EVE_SCOPES and any other setting you want to change

## Deploy/Update

- Adjust the version in `deploy.sh` to an existing release
- Then commit and execute: `eb deploy`,  
  or only: `git add . && eb deploy --staged`
