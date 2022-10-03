#!/usr/bin/env bash

# 68m, 40m, 19m = 127m
/var/app/current/backend/bin/console update-service-accounts --log --hide-details
/var/app/current/backend/bin/console update-corporations --log --hide-details
/var/app/current/backend/bin/console update-member-tracking --log
