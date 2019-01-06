Docker Setup for Spryker
 # Add it to your spryker project by adding it as submodule
 ## install
 - git submodule add git@github.com:patrickjaja/spryker-docker.git docker
 
 ## update
 - git submodule foreach git pull origin master

 # Docker installation introductions
 # Build image
 - docker build ./docker -t spryker-minimal-php
 
 # Install Spryker
 - PROJECT_NAME=YOUR-PROJECT-NAME docker-compose up -d
 - ./rmq.sh YOUR-PROJECT-NAME
 - docker exec -it spryker-minimal-php composer install --no-interaction
 - docker exec -it spryker-minimal-php vendor/bin/install
 - change hosts file and add 127.0.0.1 zed.de.suite.local and 127.0.0.1 de.suite.local