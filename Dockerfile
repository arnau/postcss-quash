FROM node:5-slim
MAINTAINER Arnau Siches <asiches@gmail.com>

ENV TERM xterm-256color
ENV NODE_PATH /home/quash/lib
ENV PATH $PATH:/home/quash/node_modules/.bin

WORKDIR /home/quash
COPY package.json /home/quash/package.json
COPY .babelrc /home/quash/.babelrc

RUN npm install

COPY lib /home/quash/lib
COPY test /home/quash/test
