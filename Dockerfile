FROM node:11



COPY . /source/
RUN cd /source/ && \
  rm -rf dist && \
  npm install




COPY --from=0 source/ /

RUN chmod 755 /entrypoint.sh

EXPOSE 3000
CMD ["/entrypoint.sh"]
