FROM		python:3.6.13-slim-buster

ARG		XPRA_SERVER_PORT
ENV		XPRA_SERVER_PORT=${XPRA_SERVER_PORT:-8080}

ARG		XPRA_FRONTEND_PORT
ENV             XPRA_FRONTEND_PORT=${XPRA_FRONTEND_PORT:-8000}

ENV		DEBIAN_FRONTEND=noninteractive

COPY		. src/

RUN		apt-get update; \
                apt-get install -y gnupg; \
                apt-key add src/gpg.asc; \
                cp src/xpra.list /etc/apt/sources.list.d; \
                apt-get update; \
                apt-get install -y xpra xterm; \
		apt-get install -y nodejs npm; \
		npm install -g uglify-js -save--dev; \
		cd src; ./setup.py install /usr/share/xpra/www; \
		pip install numpy;

WORKDIR		/usr/share/xpra/www

CMD		xpra start --start=xterm --bind-tcp=0.0.0.0:$XPRA_SERVER_PORT; python3 -m http.server $XPRA_FRONTEND_PORT;
