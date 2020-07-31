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

RUN addgroup -gid 1006 build && adduser --system --shell /bin/bash -uid 1002 -gid 1006 build

COPY build-release.sh /home/build/build-release.sh
RUN chmod +x /home/build/build-release.sh

USER build

CMD ["/home/build/build-release.sh"]

