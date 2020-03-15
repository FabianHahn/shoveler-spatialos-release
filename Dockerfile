FROM ubuntu:16.04

RUN apt-get update && \
	apt-get install --no-install-recommends --no-install-suggests -y \
		xorg-dev \
		libxi-dev \
		wget \
		ca-certificates \
		git \
		gnupg2 \
		software-properties-common \
		build-essential \
		apt-transport-https
		
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add - && \
	apt-add-repository 'deb https://apt.kitware.com/ubuntu/ xenial main' && \
	apt-get update && \
	apt-get install --no-install-recommends --no-install-suggests -y cmake

RUN wget -q -O /bin/spatial https://console.improbable.io/toolbelt/download/latest/linux && \
	chmod +x /bin/spatial

COPY build-release.sh /root/build-release.sh
RUN chmod +x /root/build-release.sh

CMD ["/root/build-release.sh"]

