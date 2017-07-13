FROM node:8-slim
RUN node --version && npm --version

# auto validate license
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# update repos
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

RUN apt-get update
RUN apt-get install -y --force-yes \
    xvfb \
    build-essential \
    libssl-dev \
    libffi-dev \
    python-dev \
    python \
    oracle-java8-installer \

# Another layer for smaller more frequent changes, so the above isn't invalidated 
RUN apt-get install -y \
    zip \
    psmisc

# Install driver
RUN wget -N http://chromedriver.storage.googleapis.com/2.24/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    chmod 755 chromedriver && \
    mv -f chromedriver /usr/local/share/chromedriver && \
    ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver && \
    ln -s /usr/local/share/chromedriver /usr/bin/chromedriver


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
