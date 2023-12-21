ARG GITCACHE=0

# FROM node:10

# LABEL maintainer="szhao5@ualberta.ca"

# https://stackoverflow.com/questions/56513514/not-able-to-install-node-10-x-version-in-docker-container

FROM selenium/node-chrome:2.53.1

RUN sudo apt-get update &&\
    sudo apt-get -y install curl &&\
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - &&\
    sudo apt-get -y install nodejs &&\
    sudo ln -s /usr/bin/nodejs /usr/local/bin/node

# RUN node -v

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN sudo apt-get update && sudo apt-get install git yarn -y

# CMD ["whoami"]


ARG GITCACHE
# clone INTO /app/korp-frontend (This makes directory /app/ too)
RUN sudo git clone https://github.com/nemeek/korp-frontend.git /app/korp-frontend \
    && cd /app/korp-frontend \
    && sudo yarn install \
    && sudo yarn run build



EXPOSE 9111
WORKDIR /app/korp-frontend/
CMD yarn run start:dist
