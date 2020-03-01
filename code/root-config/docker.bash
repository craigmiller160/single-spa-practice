#!/bin/bash

PORT=9001

echo "Stopping container"
sudo docker stop single-spa-root-config 1>/dev/null 2>/dev/null

echo "Deleting container"
sudo docker rm single-spa-root-config 1>/dev/null 2>/dev/null

echo "Creating container"
sudo docker run \
    -d \
    -p 8080:$PORT \
    -v "$(pwd)/dist":/usr/share/nginx/html \
    --name=single-spa-root-config \
    nginx:1.15.10

if [[ $? -eq 0 ]]; then
    echo "Container is running and exposed on port $PORT"
fi