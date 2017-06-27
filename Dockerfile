FROM ubuntu:xenial
MAINTAINER Sterling Anderson <sterling.anderson@wisc.edu>

ADD https://raw.githubusercontent.com/munki/munki/v3.0.1/code/client/makecatalogs /usr/local/bin/
ADD https://raw.githubusercontent.com/munki/munki/v3.0.1/code/client/munkilib/__init__.py /usr/local/bin/munkilib
ADD https://raw.githubusercontent.com/munki/munki/v3.0.1/code/client/munkilib/cliutils.py /usr/local/bin/munkilib

RUN chmod +x /usr/local/bin/makecatalogs; \
apt-get update; \
apt-get -y install wget git python2.7; \
build_deps="curl ca-certificates" && \
apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ${build_deps} && \
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends git-lfs && \
git lfs install && \
DEBIAN_FRONTEND=noninteractive apt-get purge -y --auto-remove ${build_deps} && \
rm -r /var/lib/apt/lists/*