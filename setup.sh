#!/bin/bash

echo "Stopping and removing old Vulcan container if it exists..."
docker stop vulcan || true
docker rm vulcan || true

echo "Removing dangling images..."
docker image prune -f

echo "Running docker-compose up..."
if docker-compose build; then
    docker-compose up -d
    git config --global user.email "b76bra@yahoo.com"
    git config --global user.name "Irutehe"
    echo -e "\033[0;32mVulcan containers started successfully.\033[0m" # Green message
else
    echo -e "\033[0;31mError: Failed to start the Vulcan containers.\033[0m" # Red message
fi