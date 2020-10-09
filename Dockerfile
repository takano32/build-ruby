FROM ubuntu:20.04
LABEL maintainer "TAKANO Mitsuhiro <takano32@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS yes

RUN grep '^deb ' /etc/apt/sources.list | sed 's/^deb/deb-src/g' > /etc/apt/sources.list.d/deb-src.list

RUN apt-get update
RUN apt-get install -y git

RUN git clone --depth 1 https://github.com/ruby/ruby.git /build-ruby/ruby

COPY ./docker-entrypoint.sh /
EXPOSE 8000
ENTRYPOINT ["/docker-entrypoint.sh"]
