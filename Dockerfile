FROM alpine:latest

WORKDIR /reacher

# Install needed libraries
RUN apk update && \
	apk add --no-cache openssl tor && \
	rm -rf /var/cache/apk/*

# Assumes a `./reacher` binary in the root folder. This ./reacher binary is
# built on CI, but you can also copy it from ./target/{debut,release}.
COPY ./reacher .
COPY ./scripts/docker_entrypoint.sh .

CMD ["./docker_entrypoint.sh"]
