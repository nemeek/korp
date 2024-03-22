ARG GITCACHE=0

FROM node:current-alpine

LABEL maintainer="neeme.kahusk@gmail.com"


RUN apk add git
RUN apk add python3

ARG GITCACHE
# clone INTO /app/korp-frontend (This makes directory /app/ too)

RUN git clone https://github.com/nemeek/korp-frontend.git /app/korp-frontend \
	&& cd /app/korp-frontend 	&& yarn
## && git checkout master \


# COPY config.yml /app/korp-frontend/app/.

WORKDIR /app/korp-frontend/
RUN yarn build

EXPOSE 9111

WORKDIR /app/korp-frontend/dist
CMD	python -m http.server 9111
