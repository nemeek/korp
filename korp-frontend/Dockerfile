ARG GITCACHE=0

FROM node:current-alpine

LABEL maintainer="neeme.kahusk@gmail.com"


RUN apk add git
RUN apk add python3

ARG GITCACHE
# clone INTO /app/korp-frontend (This makes directory /app/ too)

RUN git clone https://github.com/spraakbanken/korp-frontend.git /app/korp-frontend \
	&& cd /app/korp-frontend \
&& git checkout dev \
	&& yarn

COPY settings.js /app/korp-frontend/scripts/.
COPY config.yml /app/korp-frontend/app/.
COPY corpora*json /app/korp-frontend/app/translations/
COPY locale*json /app/korp-frontend/app/translations/
# COPY settings.js /app/korp-frontend/app/scripts/.

WORKDIR /app/korp-frontend/
RUN yarn build

EXPOSE 9111

WORKDIR /app/korp-frontend/dist
CMD	python -m http.server 9111
