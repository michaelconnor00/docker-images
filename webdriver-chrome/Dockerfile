FROM node:8-slim
RUN node --version && npm --version

# Add Java 8 to dep list
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/java-8-debian.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/java-8-debian.list

RUN apt-get update
RUN apt-get install -y --force-yes \
    xvfb \
    build-essential \
    libssl-dev \
    libffi-dev \
    python-dev \
    python \
    oracle-java8-installer

RUN wget --quiet https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

# Install node packages
WORKDIR /home/node
RUN npm install \
    webdriverio \
    wdio-mocha-framework \
    wdio-spec-reporter \
    selenium-standalone \
    wdio-selenium-standalone-service

RUN npm install --save-dev wdio-junit-reporter
