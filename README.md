forked from Xpra-org/xpra-html5.

# Installation Guide

To build docker image, type
```
docker build -t xpra-server .
```

After successfully building docker image, start the docker container using the following command:
```
docker run -it --rm --network=host xpra-server bash
```

Next, start the web interface and xpra server:
```
xpra start --start=xterm --bind-tcp=0.0.0.0:$XPRA_SERVER_PORT
```

Now connect to http://localhost:8080 using your favorite browser.
