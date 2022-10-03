#!/usr/bin/env bash

# 9m, 32m = 41m
/var/app/current/backend/bin/console update-chars --log --hide-details
/var/app/current/backend/bin/console update-player-groups --log --hide-details
