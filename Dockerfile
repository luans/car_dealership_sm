from ruby:2.3.0

env DEBIAN_FRONTEND noninteractive

run sed -i '/deb-src/d' /etc/apt/sources.list && \
  apt-get update

run apt-get install -y build-essential postgresql-client nodejs

workdir /tmp
copy Gemfile Gemfile
copy Gemfile.lock Gemfile.lock

run bundle install

run mkdir /app
workdir /app

cmd ["rails", "server", "-b", "0.0.0.0"]
