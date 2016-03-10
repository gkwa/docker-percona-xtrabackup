FROM ubuntu:14.04

MAINTAINER Taylor Monacelli <tailor@uw.edu>

RUN apt-get update

RUN apt-get -qq -y install sudo
RUN apt-get -qq -y install openssh-server
RUN apt-get -qq -y install git
RUN apt-get -qq -y install curl

RUN apt-get -qq -y install mysql-client

RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A
RUN version=$(lsb_release -a 2>/dev/null | grep Codename: | awk '{print $2}') && \
	echo deb http://repo.percona.com/apt $version main >>/etc/apt/sources.list && \
	echo deb-src http://repo.percona.com/apt $version main >>/etc/apt/sources.list
RUN apt-get -qq -y install percona-xtrabackup
