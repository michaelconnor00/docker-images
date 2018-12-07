#FROM debian:jessie
FROM node:8
RUN node --version && npm --version

RUN echo 'deb http://ftp.de.debian.org/debian jessie-backports main' >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget libgtk-3-dev unzip xvfb

# install google-chrome
RUN wget -O /tmp/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y software-properties-common python-software-properties
RUN apt-get install -y libgconf2-4 libnss3-1d libxss1 libappindicator1 libpango1.0-0 xdg-utils
RUN apt-get install -y fonts-liberation
RUN apt-get install -y libasound2
RUN dpkg -i /tmp/google-chrome.deb

# install firefox
RUN apt-get install -y bzip2
RUN wget -O /opt/firefox-49.0.2.tar.bz2 https://download-installer.cdn.mozilla.net/pub/firefox/releases/49.0.2/linux-x86_64/en-US/firefox-49.0.2.tar.bz2
RUN cd /opt && tar -xvf firefox-49.0.2.tar.bz2

# JAVA STUFF
# auto validate license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# update repos
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

RUN apt-get update && apt-get install -y --force-yes oracle-java8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Install node packages
WORKDIR /home/node
RUN npm install --silent \
    webdriverio \
    wdio-mocha-framework \
    wdio-spec-reporter \
    selenium-standalone \
    wdio-selenium-standalone-service \
    wdio-junit-reporter \
    --save-dev

ENV PATH $PATH:/opt/selenium/firefox

RUN ln -s /home/node/node_modules/selenium-standalone/bin/selenium-standalone /usr/local/bin

RUN selenium-standalone install
