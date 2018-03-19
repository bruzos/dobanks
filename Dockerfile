FROM ruby:2.4
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y build-essential vim libpq-dev nodejs libv8-dev --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install -j 20

ENV APP_ROOT /usr/src/app
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY . $APP_ROOT

EXPOSE  3000
CMD ["rails", "s", "-b", "0.0.0.0"]