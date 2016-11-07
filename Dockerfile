FROM ubuntu:xenial
MAINTAINER Shaun Murakami <stmuraka@us.ibm.com>

# Install components
RUN apt-get -y update \
 && apt-get -y install \
        apt-utils \
        unzip \
# Cleanup package files
 && apt-get autoremove  \
 && apt-get autoclean

WORKDIR /root/
ARG GAME_SOURCE
ENV GAME_SOURCE ${GAME_SOURCE:-"Wreck-it-Ralph unity (Windows-Mac-Linux) V0.9.zip"}
COPY ${GAME_DOWNLOAD} /root/

RUN unzip *.zip

CMD 
