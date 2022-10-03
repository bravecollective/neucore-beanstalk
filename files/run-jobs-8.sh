#!/usr/bin/env bash

# 69m, 2m, 20m, ~0s, ~1s = 91m
/var/app/current/backend/bin/console check-tokens --characters active --log --hide-details
/var/app/current/backend/bin/console send-invalid-token-mail --log
/var/app/current/backend/bin/console auto-allowlist --log --hide-details
/var/app/current/backend/bin/console send-missing-character-mail --log
/var/app/current/backend/bin/console clean-http-cache --log
