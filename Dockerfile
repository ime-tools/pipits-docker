FROM ubuntu:xenial

RUN apt update && apt install --yes --no-install-recommends biom-format-tools fastx-toolkit hmmer python-pip openjdk-8-jre-headless wget unzip
RUN pip install numpy

ENV PIPITS_DIR=/opt/pipits

WORKDIR /opt
RUN wget https://github.com/hsgweon/pipits/archive/1.5.0.tar.gz -O 1.5.0.tar.gz && tar xvfz 1.5.0.tar.gz && cd pipits-1.5.0 && python setup.py install --prefix=${PIPITS_DIR} && cd -

RUN wget https://github.com/torognes/vsearch/releases/download/v2.4.3/vsearch-2.4.3-linux-x86_64.tar.gz && \
    tar xvfz vsearch-2.4.3-linux-x86_64.tar.gz && \
    ln -s $PWD/vsearch-2.4.3-linux-x86_64/bin/vsearch ${PIPITS_DIR}/bin/vsearch

RUN wget http://microbiology.se/sw/ITSx_1.0.11.tar.gz && \
    tar xvfz ITSx_1.0.11.tar.gz && \
    ln -s $PWD/ITSx_1.0.11/ITSx ${PIPITS_DIR}/bin/ITSx && \
    ln -s $PWD/ITSx_1.0.11/ITSx_db ${PIPITS_DIR}/bin/ITSx_db

RUN wget https://sourceforge.net/projects/rdp-classifier/files/rdp-classifier/rdp_classifier_2.12.zip && \
    unzip rdp_classifier_2.12.zip && \
    ln -s $PWD/rdp_classifier_2.12/dist/classifier.jar ${PIPITS_DIR}/classifier.jar

RUN mkdir -p ${PIPITS_DIR}/refdb && cd ${PIPITS_DIR}/refdb && \
    wget http://sourceforge.net/projects/pipits/files/UNITE_retrained_28.06.2017.tar.gz -O UNITE_retrained_28.06.2017.tar.gz && \
    rm -rf UNITE_retrained && \
    tar xvfz UNITE_retrained_28.06.2017.tar.gz

RUN mkdir -p ${PIPITS_DIR}/refdb && cd ${PIPITS_DIR}/refdb && \
    wget https://unite.ut.ee/sh_files/uchime_reference_dataset_01.01.2016.zip -O uchime_reference_dataset_01.01.2016.zip && \
    unzip uchime_reference_dataset_01.01.2016.zip
