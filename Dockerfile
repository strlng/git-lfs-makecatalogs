FROM ubuntu:xenial
MAINTAINER Sterling Anderson <sterling.anderson@wisc.edu>

RUN apt-get update; \
apt-get -y install wget python-software-properties python2.7; \
add-apt-repository ppa:git-core/ppa; \
apt-get update; \
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash; \
apt-get -y install git git-lfs; \
ADD https://raw.githubusercontent.com/munki/munki/v2.8.2/code/client/makecatalogs /usr/local/bin/