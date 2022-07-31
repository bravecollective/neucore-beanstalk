#!/usr/bin/env bash

# 7m, 25m = 32m
/var/app/current/backend/bin/console update-chars --log --hide-details
/var/app/current/backend/bin/console update-player-groups --log --hide-details
