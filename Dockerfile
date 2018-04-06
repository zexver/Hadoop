# Set the base image to Ubuntu
FROM ubuntu:16.04
RUN apt-get -y update && apt-get install -y fortunes
CMD /usr/game/fortune -a | cosway
