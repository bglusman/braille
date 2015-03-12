FROM ubuntu:14.04
FROM quay.io/wantedly/ruby:2.1.5
# install dependencies
RUN apt-get update
RUN apt-get install -y autoconf automake libtool
RUN apt-get install -y g++
RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y libcurl3-dev
RUN apt-get install -y liblouisutdml-bin
#RUN git clone git@github.com:umd-mith/braille.git
#RUN cd braille/remote-liblouis/ruby
WORKDIR /srv
ADD app.rb app.rb
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
ADD config.ru config.ru

RUN bundle install
EXPOSE 8080
RUN unicorn -p 8080
