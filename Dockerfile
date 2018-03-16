FROM ubuntu:xenial

RUN apt update && apt install --yes --no-install-recommends biom-format-tools fastx-toolkit hmmer python-pip openjdk-8-jre-headless wget unzip
RUN pip install numpy

WORKDIR /opt
RUN wget https://github.com/hsgweon/pipits/archive/1.5.0.tar.gz -O 1.5.0.tar.gz && tar xvfz 1.5.0.tar.gz && cd pipits-1.5.0 && python setup.py install --prefix=/usr/local/ && cd -

RUN wget https://github.com/torognes/vsearch/releases/download/v2.4.3/vsearch-2.4.3-linux-x86_64.tar.gz && \
    tar xvfz vsearch-2.4.3-linux-x86_64.tar.gz && \
    ln -s $PWD/vsearch-2.4.3-linux-x86_64/bin/vsearch /usr/local/bin/vsearch

RUN wget http://microbiology.se/sw/ITSx_1.0.11.tar.gz && \
    tar xvfz ITSx_1.0.11.tar.gz && \
    ln -s $PWD/ITSx_1.0.11/ITSx /usr/local/bin/ITSx && \
    ln -s $PWD/ITSx_1.0.11/ITSx_db /usr/local/bin/ITSx_db

RUN wget https://sourceforge.net/projects/rdp-classifier/files/rdp-classifier/rdp_classifier_2.12.zip && \
    unzip rdp_classifier_2.12.zip && \
    ln -s $PWD/rdp_classifier_2.12/dist/classifier.jar /usr/local/bin/classifier.jar
