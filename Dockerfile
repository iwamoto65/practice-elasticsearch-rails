FROM ruby:2.5.7

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client vim

RUN mkdir /elasticsearch-rails
WORKDIR /elasticsearch-rails

COPY Gemfile /elasticsearch-rails/Gemfile
COPY Gemfile.lock /elasticsearch-rails/Gemfile.lock

RUN bundle install
COPY . /elasticsearch-rails
