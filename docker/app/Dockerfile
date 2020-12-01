# FROM ruby:2.7.0

# ENV LANG C.UTF-8
# ENV APP_HOME /app

# # 必要なものをインストール
# RUN apt-get update
# RUN apt-get install -y nodejs default-mysql-client --no-install-recommends

# RUN gem install bundler

# WORKDIR $APP_HOME
# ADD Gemfile Gemfile
# ADD Gemfile.lock Gemfile.lock
# RUN bundle install

# ADD . $APP_HOME

FROM ruby:2.7.0

ENV LANG C.UTF-8
ENV RAILS_ROOT /var/www/app_name
RUN mkdir -p $RAILS_ROOT

WORKDIR $RAILS_ROOT

# 必要なものをインストール
RUN apt-get update
RUN apt-get install -y nodejs default-mysql-client --no-install-recommends

# RUN gem install bundler
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install


COPY . .
