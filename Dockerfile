# FROM ruby:2.5

# LABEL maintainer="nikita.sosnov@dataart.com"

# ENV RACK_ENV production

# RUN mkdir -p /usr/src/app/config

# WORKDIR /usr/src/app

# ADD Gemfile* /usr/src/app/

# RUN bundle install

# ADD main.rb /usr/src/app/main.rb
# ADD config/ /usr/src/app/config/

# EXPOSE 7000

# CMD ["ruby", "main.rb"]

FROM ruby:alpine

RUN apk add --no-cache \    
    bash='>=4.0.0' \
    bash-completion='>=2.0' \
    util-linux='>=2.0' \
    coreutils='>=8.0' \
    binutils='>=2.0' \
    findutils='>=4.0' \
    grep='>3.0' \
    build-base='>=0.4' && \
    gem install bundler:1.17.1
    

ENV RACK_ENV production

RUN mkdir -p /usr/src/app/config

# RUN gem install bundler

WORKDIR /usr/src/app

ADD Gemfile* /usr/src/app/


RUN bundle install

ADD main.rb /usr/src/app/main.rb
ADD config/ /usr/src/app/config/

EXPOSE 7000

CMD ["ruby", "main.rb"]
