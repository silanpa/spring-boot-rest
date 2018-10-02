#!/usr/bin/env bash
#docker run --env MAVEN_CONFIG="$HOME/.m2" -t bennu/hello-world .
docker build -t bennu/hello-world .
docker run -d -p 8080:8080 bennu/hello-world
http :8080/hello
#docker build -t bennu/hello-world --build-arg JAR_FILE=hello-world.0.0.1.jar --volume "$(pwd)":/usr/src/mymaven --volume "$HOME/.m2":/root/.m2 --workdir /usr/src/mymaven .
