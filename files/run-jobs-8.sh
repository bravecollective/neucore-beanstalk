#!/usr/bin/env bash

# 21m 67m, 2m, 32m, 0m, ~0m = 122m
/var/app/current/backend/bin/console check-tokens --characters active --log --hide-details
/var/app/current/backend/bin/console send-invalid-token-mail --log
/var/app/current/backend/bin/console auto-allowlist --log --hide-details
/var/app/current/backend/bin/console update-member-tracking --log
/var/app/current/backend/bin/console send-missing-character-mail --log
/var/app/current/backend/bin/console clean-http-cache --log
