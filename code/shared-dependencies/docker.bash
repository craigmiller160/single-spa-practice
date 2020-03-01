#!/bin/bash

PORT=9002
NAME=single-spa-shared-dependencies

echo "Stopping container"
sudo docker stop $NAME 1>/dev/null 2>/dev/null

echo "Deleting container"
sudo docker rm $NAME 1>/dev/null 2>/dev/null

echo "Creating container"
sudo docker run \
    -d \
    -p $PORT:80 \
    -v "$(pwd)":/usr/share/nginx/html \
    -v "$(pwd)/nginx.conf":/etc/nginx/nginx.conf \
    --name=$NAME \
    nginx:1.15.10

if [[ $? -eq 0 ]]; then
    echo "Container $NAME is running and exposed on port $PORT"
fi