ARG GITCACHE=0

FROM node:10

LABEL maintainer="szhao5@ualberta.ca"


RUN apt-get update && apt-get install git -y


ARG GITCACHE
# clone INTO /app/korp-frontend (This makes directory /app/ too)
RUN git clone https://github.com/UAlbertaALTLab/korp-frontend.git /app/korp-frontend


RUN cd /app/korp-frontend \
    && yarn install
WORKDIR /app/korp-frontend/
ADD frontend-local.patch .
RUN patch -p1 < frontend-local.patch \
    && yarn run build


EXPOSE 9111
CMD yarn run start:dist
