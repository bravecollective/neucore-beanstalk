#!/usr/bin/env bash

# 12m, 26m = 38m
/var/app/backend/bin/console update-chars --log --hide-details
/var/app/backend/bin/console update-player-groups --log --hide-details
