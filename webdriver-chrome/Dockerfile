FROM node:8-slim
RUN node --version && npm --version

RUN apt-get update
RUN apt-get install -y \
    xvfb \
    build-essential \
    libssl-dev \
    libffi-dev \
    python-dev \
    python

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
