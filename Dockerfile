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
	curl https://install.meteor.com/?release=${METEOR_VERSION} | sh

RUN \
    meteor npm install -g nofat &&\
    cd /usr/src &&\
    git clone https://github.com/FiW/meteor-up.git &&\
    cd meteor-up &&\
    meteor npm install &&\
    meteor nofat make &&\
    meteor npm link
