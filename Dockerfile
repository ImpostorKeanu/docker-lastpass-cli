FROM ubuntu:xenial
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get --no-install-recommends -yqq install \
  bash-completion \
  build-essential \
  cmake \
  libcurl3  \
  libcurl3-openssl-dev  \
  libssl1.0.0 \
  libssl-dev \
  libxml2 \
  libxml2-dev  \
  pkg-config \
  ca-certificates \
  xclip \
  git
RUN git clone https://github.com/LastPass/lastpass-cli /opt/lpass
WORKDIR /opt/lpass
RUN make
RUN make install
ARG USER
RUN adduser --disabled-password --force-badname "$USER"
USER "$USER"
WORKDIR /home/$USER
