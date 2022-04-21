FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

ENV HOME=/root \
	LANG=en_US.UTF-8 \
	LANGUAGE=en_US.UTF-8 \
	LC_ALL=C.UTF-8

RUN \
	set -ex && \
	apt-get -yq update && \
	apt-get purge -yq snap snapd && \
	apt-mark hold snap && \
	apt-mark hold snapd && \
	apt-get -yq upgrade

RUN \
	set -ex && \
	apt-get install -yq \
		software-properties-common \
	    apt-utils \
		bash \
		openbox \
		git \
		net-tools \
		novnc \
		supervisor \
		tigervnc-common \
		tigervnc-standalone-server \
		xterm && \
	apt-get purge -yq pm-utils xscreensaver*

RUN cp /usr/share/novnc/vnc.html /usr/share/novnc/index.html

RUN \
	set -ex && \
	add-apt-repository ppa:mozillateam/ppa && \
	apt-get -yq update && \
	apt-get install -yq firefox-esr

# RUN \
# 	set -ex && \
# 	wget -nv https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
# 	apt-get install -yq ./google-chrome-stable_current_amd64.deb

ENV DISPLAY=:0.0 \
	DISPLAY_WIDTH=1440 \
	DISPLAY_HEIGHT=900 \
	RUN_XTERM=yes \
	RUN_OPEDNBOX=yes

COPY . /app/	
CMD ["/app/entrypoint.sh"]
EXPOSE 8080
