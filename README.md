# About this Repo

This is the Git repo of the Docker image for [signalk-server-node](https://hub.docker.com/r/nohal/signalk-server-node/). See [the Docker Hub page](https://hub.docker.com/r/nohal/signalk-server-node/) for the full readme on how to use this Docker image and for information regarding contributing and issues.

## Image deployment: 
docker pull nohal/signalk-server-node

## About
[SignalK](http://signalk.org) is an open protocol for universal marine data exchange. This image allows for trivial installation of [signalk-server-node](https://github.com/SignalK/signalk-server-node), the reference implementation in node.js.

## Configuration
By default the image is configured to play the sample NMEA data from file exactly the same way as when you run the ```nmea-from-file``` example mentioned in the [SignalK installation instructions](http://signalk.org/installation.html).
To change this behavior, create a suitable SignalK node server configuration under ```/etc/signalk/settings/``` and edit ```/etc/signalk/signalk.conf``` to point to it. It is a good idea to mount the configuration from outside the container (see the running examples bellow).

## Running:
### The most trivial example
```docker run -d nohal/signalk-server-node```

### Expose the server on local port 3333
```docker run -d -p3333:3000 nohal/signalk-server-node```

### Mount local configuration files into the container
```docker run -d -v /mydockerdata/signalk/etc:/etc/signalk nohal/signalk-server-node```

### The real-world example
```docker run -d -p3000:3000 -v /mydockerdata/signalk/etc:/etc/signalk nohal/signalk-server-node```
