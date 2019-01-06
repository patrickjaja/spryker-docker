#! /bin/bash

docker exec -i $1-rabbitmq rabbitmqctl add_vhost /DE_development_zed
docker exec -i $1-rabbitmq rabbitmqctl add_user DE_development mate20mg
docker exec -i $1-rabbitmq rabbitmqctl set_user_tags DE_development administrator
docker exec -i $1-rabbitmq rabbitmqctl set_permissions -p /DE_development_zed DE_development ".*" ".*" ".*"
docker exec -i $1-rabbitmq rabbitmqctl add_user admin mate20mg
docker exec -i $1-rabbitmq rabbitmqctl set_user_tags admin administrator
docker exec -i $1-rabbitmq rabbitmqctl set_permissions -p /DE_development_zed admin ".*" ".*" ".*"

docker exec -it $1-php composer install --no-interaction
docker exec -it $1-php vendor/bin/install
docker exec -it $1-php chown -R 1000:1000 .
docker exec -it $1-php chmod -R 757 ./data