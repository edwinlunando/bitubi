FROM ruby:2.2.3
# update system
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm nodejs-legacy imagemagick

# creating standard directory for code
ENV APP_HOME /bitubi
RUN mkdir $APP_HOME

# gem file caching
ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile
ENV BUNDLE_JOBS=2
ENV BUNDLE_PATH=/bundle
ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock
# RUN bundle install

# set working directory
WORKDIR $APP_HOME
ADD . $APP_HOME
