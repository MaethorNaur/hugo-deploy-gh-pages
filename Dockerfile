FROM debian:buster-slim
LABEL maintainer="Ben Selby <benmatselby@gmail.com>"

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
	ca-certificates  \
	curl \
	git
RUN curl -sL https://deb.nodesource.com/setup_15.x | bash -
RUN apt-get install -y --no-install-recommends \
	nodejs && \
	rm -rf /var/lib/apt/lists/*
RUN npm i -g postcss postcss-cli esbuild
COPY action.sh /usr/bin/action.sh

ENTRYPOINT ["action.sh"]
