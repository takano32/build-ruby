FROM ubuntu:20.04
LABEL maintainer "TAKANO Mitsuhiro <takano32@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NOWARNINGS yes

# RUN grep '^deb ' /etc/apt/sources.list | sed 's/^deb/deb-src/g' > /etc/apt/sources.list.d/deb-src.list

RUN apt-get update
RUN apt-get install -y wget

RUN mkdir /build-ruby
# RUN cd /build-ruby && wget https://github.com/ruby/ruby/archive/v3_0_0.tar.gz
# RUN cd /build-ruby && tar xf v3_0_0.tar.gz && mv ruby-3_0_0 ruby
RUN cd /build-ruby && wget https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.0.tar.gz
RUN cd /build-ruby && tar xf ruby-3.0.0.tar.gz && mv ruby-3.0.0 ruby

RUN apt-get install -y autoconf
RUN apt-get install -y gcc
RUN apt-get install -y make

# RUN apt-get install -y git
# RUN git clone https://github.com/ruby/ruby.git /build-ruby/ruby

COPY ./docker-entrypoint.sh /
EXPOSE 8000
ENTRYPOINT ["/docker-entrypoint.sh"]
