ARG GITCACHE=0

# For korp-backend
FROM  python:3.8

LABEL maintainer="neeme.kahusk@gmail.com"


RUN apt-get update && apt-get install subversion git default-libmysqlclient-dev -y

# install cwb
RUN svn co http://svn.code.sf.net/p/cwb/code/cwb/trunk cwb && cd cwb && ./install-scripts/install-linux

# RUN mkdir -p /corpora/data && mkdir -p /corpora/registry


ARG GITCACHE
# clone korp-backend and create /app/korp-backend
RUN git clone https://github.com/nemeek/korp-backend.git /app/korp-backend \
	&& cd /app/korp-backend \
#	 && git checkout  master
COPY requirements.txt /app/korp-backend
WORKDIR /app/korp-backend
RUN pip3 install -r requirements.txt
RUN pip3 install gunicorn
COPY config.py /app/korp-backend

# RUN mkdir -p /corpora

RUN mkdir -p /app/korp-backend/config/corpora
RUN mkdir -p /app/korp-backend/config/modes
RUN mkdir -p /app/korp-backend/config/attributes/positional
RUN mkdir -p /app/korp-backend/config/attributes/structural

COPY ./config/corpora /app/korp-backend/config/corpora/
COPY ./config/modes /app/korp-backend/config/modes/
COPY ./config/attributes/positional /app/korp-backend/config/attributes/positional
COPY ./config/attributes/structural /app/korp-backend/config/attributes/structural

WORKDIR /corpora

# COPY underivask.vrt semperbarbarus.vrt older_fiction.vrt register-litterary.sh register-under.sh register-fiction.sh veeb2023_*2014.vrt veeb2023_201[456].vrt ./

COPY register*sh ./corpora

RUN chmod +x /corpora/register-under.sh
RUN /corpora/register-under.sh underivask.vrt
RUN /corpora/register-litterary.sh semperbarbarus.vrt
RUN /corpora/register-fiction.sh older_fiction.vrt

RUN for i in veeb*vrt ; do /corpora/register-veeb23.sh $i ; done

# RUN /corpora/register-fiction.sh veeb2023_2014.vrt
# RUN /corpora/register-fiction.sh veeb2023_pre2014.vrt
# RUN /corpora/register-fiction.sh veeb2023_2015.vrt
# RUN /corpora/register-fiction.sh veeb2023_2016.vrt

# COPY testcorpus.vrt register-test.sh ./
# RUN /corpora/register-test.sh testcorpus.vrt

EXPOSE 1234

WORKDIR /app/korp-backend/
# CMD python3 run.py
CMD gunicorn --worker-class gevent --bind 0.0.0.0:1234 --workers 4 --max-requests 250 --limit-request-line 0 'run:create_app()'
