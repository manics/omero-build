FROM gradle:5.2.1-jdk8

USER root
RUN apt-get update && \
    apt-get install -y \
        ant \
        python-pip \
        python-tables \
        python-virtualenv \
        python-yaml \
        python-jinja2 \
        python-pillow \
        python-numpy \
        python-sphinx \
        zeroc-ice-all-dev && \
    pip install https://github.com/ome/zeroc-ice-py-debian9/releases/download/0.1.0/zeroc_ice-3.6.4-cp27-cp27mu-linux_x86_64.whl

RUN echo Not installing \
        zlib1g-dev \
        libssl-dev \
        libbz2-dev \
        libmcpp-dev \
        libdb++-dev \
        libdb-dev

USER gradle
