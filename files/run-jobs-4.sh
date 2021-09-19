#!/usr/bin/env bash

# 41m, 35m, 16m = 92m
/var/app/current/backend/bin/console update-service-accounts --log --hide-details
/var/app/current/backend/bin/console update-corporations --log --hide-details
/var/app/current/backend/bin/console auto-allowlist --log --hide-details
