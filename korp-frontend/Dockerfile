ARG GITCACHE=0

# FROM node:current-alpine
FROM node:10.15-alpine

LABEL maintainer="szhao5@ualberta.ca"


# RUN apt-get update && apt-get install git -y
RUN apk add git


ARG GITCACHE
# clone INTO /app/korp-frontend (This makes directory /app/ too)
RUN git clone https://github.com/UAlbertaALTLab/korp-frontend.git /app/korp-frontend
# RUN apk add --no-cache python3 py3-pip
WORKDIR /app/korp-frontend/
#    && cd /app/korp-frontend \
RUN yarn install
RUN yarn run build



EXPOSE 9111
WORKDIR /app/korp-frontend/
CMD yarn run start:dist
