FROM ubuntu:xenial

RUN apt update && apt install --yes --no-install-recommends biom-format-tools fastx-toolkit hmmer python-pip openjdk-8-jre-headless
RUN pip install numpy
