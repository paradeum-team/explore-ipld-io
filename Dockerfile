ARG VERSION=latest
FROM registry.hub.docker.com/library/node:14 as builder

ENV NODE_OPTIONS="--max-old-space-size=4096"

ARG VERSION
RUN echo $VERSION > /version

COPY . /source/
RUN cd /source/ && \
  rm -rf build && \
  npm install && \
  npm run build 

# run script

RUN chmod 755 /source//entrypoint.sh

EXPOSE 3000
CMD ["/source/entrypoint.sh"]
