FROM ruby:3.0.4-alpine

RUN apk add --no-cache bash
RUN /bin/sh
RUN apk update && apk add --virtual build-dependencies build-base tzdata

RUN gem install bundler

WORKDIR /app

COPY . .
RUN bundle i

CMD rm -f tmp/pids/server.pid & rails s
