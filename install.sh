#!/bin/bash
# This file will be automatically sourced at the installation of your plugin
# Use only if you need to perform changes on the user system such as installing software

RANDOM_36="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 36 | head -n 1)"
echo "pg_api_ai_session_id=$RANDOM_36" >> config.sh
