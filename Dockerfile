# Dockerfile to install coin-or/CBC into a container.
FROM python:3.6.8
MAINTAINER nurisensoy87@gmail.com

SHELL ["/bin/bash", "-c"]

# pulp library will be used to use cbc. Install pulp developed by coin-or
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Download the latest version (2.10) of cbc from the web page
RUN svn checkout https://projects.coin-or.org/svn/Cbc/stable/2.10 Cbc-2.10

# make cbc configurations to work on it
RUN cd Cbc-2.10 \
    && mkdir build \
    && cd build \
    && ../configure \
    && make \
    && make install