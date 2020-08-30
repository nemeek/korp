# For korp-backend
FROM python:3.6-slim-buster

LABEL maintainer="szhao5@ualberta.ca"




ADD edit_config.py /app/libexec/


RUN apt-get update && apt-get install subversion git default-libmysqlclient-dev -y

# install cwb
RUN svn co http://svn.code.sf.net/p/cwb/code/cwb/trunk cwb && cd cwb && ./install-scripts/install-linux

RUN mkdir -p /corpora/data && mkdir -p /corpora/registry

RUN git clone https://github.com/spraakbanken/korp-backend.git /app/korp-backend \
    && cd /app/korp-backend \
    && pip3 install -r requirements.txt \
    && python3 /app/libexec/edit_config.py

## Install Apache2 and other stuff needed to access svn via WebDav
#RUN apk add --no-cache apache2 apache2-utils apache2-webdav mod_dav_svn &&\
## Install svn
#apk add --no-cache subversion &&\

# Add our python app code to the image
# RUN mkdir -p /corpora/data
# ADD . /corpora
# RUN mkdir -p /corpora/registry
# ADD . /corpora

# WORKDIR /app

# Set the default command to execute
# COPY cmd.sh /cmd.sh
# RUN chmod +x /cmd.sh
#
EXPOSE 8000
WORKDIR /app/korp-backend/
CMD python3 korp.py
