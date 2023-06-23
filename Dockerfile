FROM ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    automake \
    bison \
    build-essential \
    ca-certificates \
    clang \
    clang-14 \
    flex \
    gdb \
    git \
    libgmp-dev \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://github.com/waywardgeek/datadraw.git \
    && git clone https://github.com/google/rune.git \
    && git clone https://github.com/pornin/CTTK.git \
    && cp CTTK/inc/cttk.h CTTK

WORKDIR /datadraw
RUN ./autogen.sh \
    && ./configure \
    && make && make install

WORKDIR /rune
RUN make && make install

WORKDIR /
