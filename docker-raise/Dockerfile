FROM i386/ubuntu:18.04

RUN apt-get update && apt-get install -y smlnj texlive-base m4

WORKDIR /tmp
ADD rsltc_2.6.1-1_i386.deb /tmp
RUN dpkg -i rsltc_2.6.1-1_i386.deb

WORKDIR /usr/src
