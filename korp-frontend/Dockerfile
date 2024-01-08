ARG GITCACHE=0

# FROM node:10
# FROM node:10.15-alpine
FROM node:current-alpine

LABEL maintainer="neeme.kahusk@gmail.com"


RUN apk add git
RUN apk add python3

ARG GITCACHE
# clone INTO /app/korp-frontend (This makes directory /app/ too)
RUN git clone https://github.com/nemeek/korp-frontend.git /app/korp-frontend \
	&& cd /app/korp-frontend \
&& git checkout master \
	&& yarn

COPY config.yml /app/korp-frontend/app/.

WORKDIR /app/korp-frontend/
RUN yarn build

EXPOSE 9111

# CMD yarn start
#	cd dist;
WORKDIR /app/korp-frontend/dist
CMD	python -m http.server 9111
