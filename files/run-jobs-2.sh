#!/usr/bin/env bash

# 12m, 26m = 38m
/var/app/current/backend/bin/console update-chars --log --hide-details
/var/app/current/backend/bin/console update-player-groups --log --hide-details
