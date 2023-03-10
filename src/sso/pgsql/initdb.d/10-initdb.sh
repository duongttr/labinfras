#!/bin/bash

set -ex;

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE ROLE $KC_DB_USERNAME LOGIN PASSWORD '$KC_DB_PASSWORD';
    CREATE DATABASE keycloak WITH OWNER $KC_DB_USERNAME;
EOSQL