FROM golang:1.7
MAINTAINER keremavci
RUN apt-get update && apt-get install -y --no-install-recommends \
		ruby \
	&& rm -rf /var/lib/apt/lists/*
RUN mkdir -p /buildpacks/go-buildpack
COPY . /buildpacks/go-buildpack
COPY ./docker/docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]



