FROM ubuntu:xenial

RUN apt update && apt install --yes --no-install-recommends biom-format-tools fastx-toolkit hmmer python-pip openjdk-8-jre-headless wget unzip
RUN pip install numpy

WORKDIR /opt
RUN wget https://github.com/hsgweon/pipits/archive/1.5.0.tar.gz -O 1.5.0.tar.gz && tar xvfz 1.5.0.tar.gz
