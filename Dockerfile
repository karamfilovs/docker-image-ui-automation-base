FROM ubuntu:18.04

RUN apt-get update; apt-get clean

# Add a user for running applications.
RUN useradd apps
RUN mkdir -p /home/apps && chown apps:apps /home/apps

# Install and setup project dependencies
RUN apt-get install -y curl wget

# Prepare for Java download
RUN apt-get install -y software-properties-common

# Grab oracle java 8 (auto accept licence)
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer

# Install display server
RUN apt-get install -y xorg xserver-xorg-video-dummy

# RUN apt-get install -y xvfb gtk2-engines-pixbuf
RUN apt-get install -y xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable

# Install x11vnc.
RUN apt-get install -y x11vnc

# Install xvfb.
RUN apt-get install -y xvfb


# Install fluxbox.
RUN apt-get install -y fluxbox


# Install Firefox
RUN apt-get install -y firefox

# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update
RUN apt-get install -y google-chrome-stable

# Install maven
RUN apt-get install -y maven

# Install Allure
RUN apt-get install allure
