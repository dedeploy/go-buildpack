FROM golang:1.7
MAINTAINER keremavci
RUN apt-get update && apt-get install -y --no-install-recommends \
		ruby \
	&& rm -rf /var/lib/apt/lists/*
RUN mkdir -p /buildpacks/go-buildpack
RUN mkdir -p /tmp/go1.7.5 && curl -o /tmp/go1.7.5/go1.7.5.tar.gz https://buildpacks.cloudfoundry.org/dependencies/go/go1.7.5.linux-amd64-c9de5bb9.tar.gz \
	&& cd /tmp/go1.7.5/ && tar xvf go1.7.5.tar.gz 
COPY . /buildpacks/go-buildpack
COPY ./docker/docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]



