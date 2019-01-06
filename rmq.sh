#! /bin/bash

docker exec -i $1-rabbitmq rabbitmqctl add_vhost /DE_development_zed
docker exec -i $1-rabbitmq rabbitmqctl add_user DE_development mate20mg
docker exec -i $1-rabbitmq rabbitmqctl set_user_tags DE_development administrator
docker exec -i $1-rabbitmq rabbitmqctl set_permissions -p /DE_development_zed DE_development ".*" ".*" ".*"
docker exec -i $1-rabbitmq rabbitmqctl add_user admin mate20mg
docker exec -i $1-rabbitmq rabbitmqctl set_user_tags admin administrator
docker exec -i $1-rabbitmq rabbitmqctl set_permissions -p /DE_development_zed admin ".*" ".*" ".*"
