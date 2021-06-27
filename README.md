forked from Xpra-org/xpra-html5.

# Installation Guide

To build docker image, type
```
docker build -t xpra-server .
```

After successfully building docker image, start the web and xpra server with the following command:
```
docker run -it --rm --network=host xpra-server
```
