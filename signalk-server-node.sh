#!/bin/sh
# Copyright 2016 Pavel Kalian
# Distributed under the terms of MIT license;

if [ ! -d /etc/signalk ]; then
  mkdir /etc/signalk
fi
if [ ! -f /etc/signalk/signalk.conf ];then
  cp /usr/local/share/signalk/signalk.conf.example /etc/signalk/signalk.conf
fi

. /etc/signalk/signalk.conf

if [ ! -d /etc/signalk/settings ]; then
  mkdir /etc/signalk/settings
  cp /usr/local/share/signalk/settings/*.json /etc/signalk/settings
fi
if [ ! -f /etc/signalk/settings/${SIGNALK_CONFIG} ];then
  cp /usr/local/share/signalk/settings/*.json /etc/signalk/settings
fi

cd ${SIGNALK_HOME}
sudo -u ${SIGNALK_USER} bin/signalk-server -s settings/${SIGNALK_CONFIG}
