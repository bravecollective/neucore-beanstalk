#!/usr/bin/env bash

# 118m, 3m, 80m, 0m, 1?m = 201m
/var/app/backend/bin/console check-tokens --log --hide-details
/var/app/backend/bin/console send-invalid-token-mail --log
/var/app/backend/bin/console update-member-tracking --log
/var/app/backend/bin/console send-missing-character-mail --log
/var/app/backend/bin/console clean-http-cache --log
