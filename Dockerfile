FROM ubuntu:xenial
MAINTAINER Sterling Anderson <sterling.anderson@wisc.edu>

RUN apt-get update && apt-get -y install wget python2.7 git git-lfs -y
ADD https://raw.githubusercontent.com/munki/munki/v2.8.2/code/client/makecatalogs /usr/local/bin/