FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
RUN \
	set -ex && \
	apt-get -y update && apt-get -y upgrade && \
	apt-get update && \
	apt-get install -y \
		bash \
		fluxbox \
		git \
		net-tools \
		novnc \
		supervisor \
		x11vnc \
		xterm \
		xvfb
ENV HOME=/root \
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8 \
	LC_ALL=C.UTF-8 \
	DISPLAY=:0.0 \
	DISPLAY_WIDTH=1024 \
	DISPLAY_HEIGHT=768 \
	RUN_XTERM=yes \
	RUN_FLUXBOX=yes
COPY . /app
CMD ["/app/entrypoint.sh"]
EXPOSE 8080
