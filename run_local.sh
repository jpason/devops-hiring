#!/bin/bash

. $HOME/devops-hiring.settings

if [[ -z "$SECRET_KEY" ]] || [[ -z "$DB_PASS" ]]
then
    echo 'SECRET_KEY or DB_PASS not set!'
    exit
fi

docker run -d -p 8000:8000 \
        --name "$APP_NAME" \
        -e DB_USER="$DB_USER" \
        -e DB_NAME="$DB_NAME" \
        -e DB_PASS="$DB_PASS" \
        -e DB_HOST="$DB_HOST" \
        -e SECRET_KEY="$SECRET_KEY" \
        "$APP_NAME" 

