ARG GITCACHE=0

# For korp-backend
FROM python:3.6-slim-buster

LABEL maintainer="szhao5@ualberta.ca"



RUN apt-get update && apt-get install subversion git default-libmysqlclient-dev -y

# install cwb
RUN svn co http://svn.code.sf.net/p/cwb/code/cwb/trunk cwb && cd cwb && ./install-scripts/install-linux

RUN mkdir -p /corpora/data && mkdir -p /corpora/registry


ARG GITCACHE
# clone korp-backend and create /app/korp-backend
RUN git clone https://github.com/UAlbertaALTLab/korp-backend.git /app/korp-backend \
    && cd /app/korp-backend \
    && pip3 install -r requirements.txt

RUN apt-get install dos2unix

RUN mkdir -p /corpora
WORKDIR /corpora
COPY wolfart_ahenakew.vrt crk_WolfartAhenakew_encode.sh .
RUN dos2unix crk_WolfartAhenakew_encode.sh && bash /corpora/crk_WolfartAhenakew_encode.sh

EXPOSE 1234

WORKDIR /app/korp-backend/
CMD python3 korp.py
