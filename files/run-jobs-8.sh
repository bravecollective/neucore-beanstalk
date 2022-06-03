#!/usr/bin/env bash

# 118m, 3m, 80m, 0m, 1?m = 201m
/var/app/current/backend/bin/console check-tokens --characters active --log --hide-details
/var/app/current/backend/bin/console send-invalid-token-mail --log
/var/app/current/backend/bin/console update-member-tracking --log
/var/app/current/backend/bin/console send-missing-character-mail --log
/var/app/current/backend/bin/console clean-http-cache --log
