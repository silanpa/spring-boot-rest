# zally-spring-boot
Testing zally in spring-boot

docker run -it --name my-maven-project -v "$(pwd)":/usr/src/mymaven -v "$HOME/.m2":/root/.m2 -w --build-arg JAR_FILE=hello-world.0.0.1 /usr/src/mymaven maven:3.3-jdk-8 sh




