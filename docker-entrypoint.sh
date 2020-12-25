#!/bin/bash
set -eux

cd /build-ruby/ruby

# git checkout -b tag/v3_0_0 refs/tags/v3_0_0

autoconf
./configure
make -j16

cd /build-ruby

# python3 -m http.server

