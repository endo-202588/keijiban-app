FROM ruby:3.2-slim

RUN apt-get update -qq && \
  apt-get install -y \
  build-essential \
  libpq-dev \
  libyaml-dev \
  nodejs \
  postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["bash"]