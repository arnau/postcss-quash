FROM node:5-slim
MAINTAINER Arnau Siches <asiches@gmail.com>

ENV TERM xterm-256color
ENV NODE_PATH /home/quash/src
ENV PATH $PATH:/home/quash/node_modules/.bin

RUN apt-get update -qqy \
 && apt-get install -qqy \
      git \
      curl \
 && rm -rf /var/lib/apt/lists/*

RUN npm install -g \
    bower \
    pulp \
    purescript

WORKDIR /home/quash
COPY package.json /home/quash/package.json
RUN npm install

COPY bower.json /home/quash/bower.json
RUN bower install --allow-root

COPY .babelrc /home/quash/.babelrc


COPY src /home/quash/src
COPY test /home/quash/test
