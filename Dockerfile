FROM debian:wheezy
MAINTAINER Andreas Katzig <akatzig@chimera-entertainment.de>

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends rsync && \
  apt-get clean autoclean && \
  apt-get autoremove -y && \
  rm -rf /var/lib/{apt,dpkg,cache,log}/

EXPOSE 873
VOLUME /var/www/html
ADD ./run /usr/local/bin/run

ENTRYPOINT ["/usr/local/bin/run"]
