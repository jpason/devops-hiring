#!/bin/bash

. $HOME/devops-hiring.settings

if [[ -z $DB_PASS ]]
then
    echo 'DB_PASS is not set!'
    exit
fi

sudo su postgres -c psql << SETTINGS

CREATE DATABASE $DB_NAME;
CREATE USER $DB_USER WITH ENCRYPTED PASSWORD '$DB_PASS';
GRANT ALL PRIVILEGES ON DATABASE $DB_NAME to $DB_USER;

SETTINGS

