FROM ruby:2.6

ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

WORKDIR /usr/src/app

COPY .  /usr/src/app

COPY Gemfile.local /usr/src/app/Gemfile
RUN rm _config.yml
COPY _config.docker.yml /usr/src/app/_config.yml

RUN gem install bundler && bundle install

EXPOSE 4000

ENTRYPOINT [ "jekyll", "serve", "--host", "0.0.0.0", "--livereload" ]
