FROM ruby:2.5.1-alpine3.7

RUN apk add --no-cache --update --upgrade --virtual build-dependencies \
    build-base \
    postgresql-dev \
    tzdata \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /bundle
ENV BUNDLE_PATH=/bundle

RUN mkdir -p /app
WORKDIR /app
COPY . .

RUN gem install foreman

EXPOSE 3000
