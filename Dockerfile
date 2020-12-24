FROM debian:buster-slim
LABEL maintainer="Ben Selby <benmatselby@gmail.com>"
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	ca-certificates  \
	curl \
	nodejs \
	git && \
	rm -rf /var/lib/apt/lists/*

COPY action.sh /usr/bin/action.sh

ENTRYPOINT ["action.sh"]
