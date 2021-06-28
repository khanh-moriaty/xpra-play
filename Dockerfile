FROM		python:3.6.13-slim-buster

ARG		XPRA_SERVER_PORT
ENV		XPRA_SERVER_PORT=${XPRA_SERVER_PORT:-8080}

ENV		DEBIAN_FRONTEND=noninteractive LC_ALL=C.UTF-8 LANG=C.UTF-8

COPY		. src/
WORKDIR		src

RUN		apt-get update; \
                apt-get install -y gnupg; \
                apt-key add packaging/xpra.key; \
                cp packaging/xpra.list /etc/apt/sources.list.d; \
                apt-get update; \
                apt-get install -y xpra xterm; \
		apt-get install -y nodejs npm; \
		npm install -g uglify-js -save--dev; \
		cd src; ./setup.py install /usr/share/xpra/www; \
		pip install numpy;

CMD		xpra start --start=xterm --bind-tcp=0.0.0.0:$XPRA_SERVER_PORT
