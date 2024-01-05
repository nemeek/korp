ARG GITCACHE=0

# FROM node:10
FROM node:10.15-alpine

LABEL maintainer="szhao5@ualberta.ca"


# RUN apt-get update && apt-get install git -y
RUN apk add git

ARG GITCACHE
# clone INTO /app/korp-frontend (This makes directory /app/ too)
RUN git clone https://github.com/Keeleressursid/alberta-korp-frontend.git /app/korp-frontend \
	&& cd /app/korp-frontend \
&& git checkout mac
RUN    yarn --ignore-platform install
WORKDIR /app/korp-frontend/
RUN yarn run build



EXPOSE 9111
WORKDIR /app/korp-frontend/
CMD yarn run start:dist
