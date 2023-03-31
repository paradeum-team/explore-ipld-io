ARG VERSION=latest
FROM node:11 as builder

ENV NODE_OPTIONS="--max-old-space-size=4096"

COPY . /source/
RUN cd /source/ && \
  npm install 




COPY --from=0 source/* /

RUN chmod 755 /entrypoint.sh

EXPOSE 3000
CMD ["/entrypoint.sh"]
