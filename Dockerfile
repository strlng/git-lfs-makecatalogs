FROM ubuntu:xenial
MAINTAINER Sterling Anderson <sterling.anderson@wisc.edu>


RUN chmod +x /usr/local/bin/makecatalogs; \
apt-get update; \
apt-get -y install wget git python2.7; \
git clone https://github.com/munki/munki.git /munki-tools; \
build_deps="curl ca-certificates" && \
apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ${build_deps} && \
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | bash && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends git-lfs && \
git lfs install && \
DEBIAN_FRONTEND=noninteractive apt-get purge -y --auto-remove ${build_deps} && \
rm -r /var/lib/apt/lists/*