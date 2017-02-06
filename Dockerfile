FROM debian:8.6

ENV DEBIAN_FRONTEND noninteractive

RUN \
	apt-get update &&\
	apt-get -y dist-upgrade &&\
	apt-get -y install build-essential curl python git &&\
	apt-get clean &&\
	rm -rf /var/lib/apt/lists/*

ENV METEOR_VERSION 1.4.2.3

RUN \
	curl https://install.meteor.com/?release=${METEOR_VERSION} | sh &&\
	meteor npm i -g --unsafe-perm yarn &&\
	meteor yarn add mup -g
