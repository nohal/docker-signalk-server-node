FROM       alpine:latest
MAINTAINER Pavel Kalian "https://github.com/nohal"

RUN apk update; \
  apk add ca-certificates git nodejs-lts wget sudo nodejs-npm openssl

RUN npm install -g bower

RUN adduser signalk -D -h /var/signalk-server-node-master; \
  mkdir -p /etc/signalk/settings; \
  mkdir -p /usr/local/share/signalk

RUN sudo -u signalk wget -P /tmp https://github.com/SignalK/signalk-server-node/archive/master.tar.gz; \
  sudo -u signalk tar zxf /tmp/master.tar.gz -C /var; \
  sudo -u signalk rm -f /tmp/master.tar.gz; \
  sudo -u signalk sh -c "cd /var/signalk-server-node-master; npm install; npm cache clean"

RUN mv /var/signalk-server-node-master/settings /usr/local/share/signalk; \
  ln -s /etc/signalk/settings /var/signalk-server-node-master/settings

COPY signalk-server-node.sh /usr/local/bin/
COPY signalk.conf.example /usr/local/share/signalk

VOLUME ["/etc/signalk"]

EXPOSE 3000
ENTRYPOINT ["signalk-server-node.sh"]
