#!/usr/bin/env bash

# 64m, 45m = 109m
/var/app/current/backend/bin/console update-service-accounts --log --hide-details
/var/app/current/backend/bin/console update-corporations --log --hide-details
