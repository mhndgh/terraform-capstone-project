#!/bin/sh

sudo apt-get update -yy
sudo apt-get install -yy git curl

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

docker pull mhndgh/capstone-project:latest
echo "REDIS_HOST=${redis_host}" > .env
echo "REDIS_PORT=6379" >> .env
echo "DB_HOST=${db_host}" >> .env
echo "DB_NAME=mydatabase" >> .env
echo "DB_USER=user" >> .env
echo "DB_PASSWORD=password" >> .env

docker run -d -p 80:5000 --name app --env-file .env mhndgh/capstone-project:latest sh -c "python -c 'from app import init_db; init_db()' && app run --host=0.0.0.0"