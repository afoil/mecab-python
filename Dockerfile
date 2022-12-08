FROM python:3.9-slim-buster

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install aptitude sudo

RUN aptitude -y install mecab libmecab-dev mecab-ipadic-utf8 git make curl xz-utils file

RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git && \
    cd mecab-ipadic-neologd && \
    ./bin/install-mecab-ipadic-neologd -n -y

RUN mkdir work
WORKDIR /work
COPY work/ /work
RUN pip install -r requirements.txt
