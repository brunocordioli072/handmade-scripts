#!/bin/bash
set -e

SERVER="teste-postgres"
PW="db123"
DB="database"
NET="postgres-network"
{
  echo "network" | docker network create --driver bridge postgres-network
} || {
  SLEEP 1
}
echo "echo stop & remove old docker [$SERVER] and starting new fresh instance of [$SERVER]"
(docker kill $SERVER || :) && \
(docker rm $SERVER || :) && \
docker run --name $SERVER --network $NET -e POSTGRES_PASSWORD=$PW \
-p 5432:5432 \
-d postgres

# wait for pg to start
echo "sleep wait for pg-server [$SERVER] to start"
SLEEP 3

# create the db
echo "CREATE DATABASE $DB ENCODING 'UTF-8';" | docker exec -i $SERVER psql -U postgres
echo "\l" | docker exec -i $SERVER psql -U postgres