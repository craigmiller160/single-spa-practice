#!/bin/bash

PORT=9001
NAME=single-spa-root-config

echo "$NAME: Stopping container"
sudo docker stop $NAME 1>/dev/null 2>/dev/null

echo "$NAME: Deleting container"
sudo docker rm $NAME 1>/dev/null 2>/dev/null

echo "$NAME: Building project"
yarn build

echo "$NAME: Creating container"
sudo docker run \
    -d \
    -p $PORT:80 \
    -v "$(pwd)/dist":/usr/share/nginx/html \
    -v "$(pwd)/nginx.conf":/etc/nginx/nginx.conf \
    --name=$NAME \
    nginx:1.15.10

if [[ $? -eq 0 ]]; then
    echo "$NAME is running and exposed on port $PORT"
fi