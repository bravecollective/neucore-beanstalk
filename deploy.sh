#!/usr/bin/env bash

VERSION=1.7.1
RELEASE_BASE_URL=https://github.com/tkhamez/neucore/releases/download

# cleanup (for dev env)
rm -Rf backend
rm -Rf web

# download release or exit with error
if [[ ! -f neucore-${VERSION}.tar.gz ]]; then
  wget ${RELEASE_BASE_URL}/${VERSION}/neucore-${VERSION}.tar.gz || rm -f neucore-${VERSION}.tar.gz
fi
if [[ ! -f neucore-${VERSION}.tar.gz ]]; then
  echo Error: failed to download ${RELEASE_BASE_URL}/${VERSION}/neucore-${VERSION}.tar.gz
  exit 1
fi

# extract and move files
tar -xzf neucore-${VERSION}.tar.gz
mv neucore/backend backend
mv neucore/web web
cp favicon.ico web/favicon.ico
rm -R neucore

# copy .env file for dev environment
if [[ -f .env ]]; then
  cp .env backend/.env
fi

# optional shared directory with logs and cache
if [[ ! -d ../shared ]]; then mkdir ../shared; fi
if [[ ! -d ../shared/logs ]]; then mkdir ../shared/logs; fi
if [[ ! -d ../shared/cache ]]; then mkdir ../shared/cache; fi
rm -Rf ../shared/cache/di
rm -Rf ../shared/cache/proxies
cp -R backend/var/cache/proxies ../shared/cache/proxies

cd backend || exit 1
vendor/bin/doctrine-migrations migrations:migrate --no-interaction
bin/console doctrine-fixtures-load

echo "Deployed Neucore v${VERSION}"
exit 0
