#!/usr/bin/env bash

# 47m
/var/app/current/backend/bin/console update-corporations --log --hide-details
# 9m
/var/app/current/backend/bin/console update-chars --log --hide-details
# 35m
/var/app/current/backend/bin/console update-player-groups --log --hide-details
# 91m
/var/app/current/backend/bin/console update-service-accounts --log --hide-details

# 18m
/var/app/current/backend/bin/console update-member-tracking --log
# ~1s
/var/app/current/backend/bin/console send-missing-character-mail --log

# 61m
/var/app/current/backend/bin/console check-tokens --characters active --log --hide-details
# 10m
/var/app/current/backend/bin/console send-invalid-token-mail --log

# 30m
/var/app/current/backend/bin/console auto-allowlist --log --hide-details

# ~1s
/var/app/current/backend/bin/console clean-http-cache --log

# total 301m
