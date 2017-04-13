FROM ruby:2.2

MAINTAINER Matthias Sieber <matthiasksieber@gmail.com>

EXPOSE 8001

RUN mkdir -p /usr/src/app
COPY . /usr/src/app
WORKDIR /usr/src/app

RUN bundle install

CMD ["ruby","app.rb"]

