ARG VERSION=latest
FROM node:11 as builder

ENV NODE_OPTIONS="--max-old-space-size=4096"

COPY . /source/
RUN cd /source/ && \
  rm -rf dist && \
  npm install 

FROM node:11 as prod
ARG VERSION
RUN echo $VERSION > /version

#COPY --from=0 source/dist/ /usr/share/nginx/html/
# update custom nginx conf reason by vue-router
#COPY --from=0 source/default.conf /etc/nginx/conf.d/
# run script
COPY --from=0 source/* /

RUN chmod 755 /entrypoint.sh

EXPOSE 3000
CMD ["/entrypoint.sh"]
