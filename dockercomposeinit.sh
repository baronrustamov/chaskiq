#!/bin/bash

docker-compose build
docker-compose run rails bundle install
docker-compose run rails yarn install
docker-compose run rails yarn dev 

# sudo docker-compose run rails bundle exec rails db:setup

docker-compose run rails db:setup 
docker-compose run rails db:create
docker-compose run rails db:schema:load
docker-compose run rails db:seed
docker-compose run rails rake admin_generator

docker-compose up -d rails
docker-compose up -d sidekiq
docker-compose up -d

echo 'done'


