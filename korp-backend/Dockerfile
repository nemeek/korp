ARG GITCACHE=0

# For korp-backend
FROM  python:3.11

LABEL maintainer="neeme.kahusk@ut.ee"


RUN apt-get update && apt-get install subversion git default-libmysqlclient-dev -y

# install cwb
RUN svn co http://svn.code.sf.net/p/cwb/code/cwb/trunk cwb && cd cwb && ./install-scripts/install-linux

RUN mkdir -p /corpora/data && mkdir -p /corpora/registry


ARG GITCACHE
# clone korp-backend and create /app/korp-backend
RUN git clone https://github.com/spraakbanken/korp-backend.git /app/korp-backend \
	&& cd /app/korp-backend \
	# && git checkout  master
COPY requirements.txt /app/korp-backend
WORKDIR /app/korp-backend
RUN pip3 install -r requirements.txt

# RUN mkdir -p /corpora
WORKDIR /corpora

EXPOSE 1234

WORKDIR /app/korp-backend/
CMD python3 run.py
