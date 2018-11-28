#This is a sample Image 
FROM jenkins/jenkins:lts 
MAINTAINER Jordi Puig Bou <jordipuigbou@gmail.com> 
USER root

RUN apt-get update 
#Install pip
RUN apt-get install -y python-pip
#Install robotframework
RUN pip install robotframework
RUN pip install selenium
RUN pip install --upgrade robotframework-seleniumlibrary
RUN	wget https://chromedriver.storage.googleapis.com/2.43/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/sbin/
RUN chmod +x /usr/sbin/chromedriver
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install
RUN apt-get install -y xvfb 

RUN apt-get install -y libxpm4 libxrender1 libgtk2.0-0 libnss3 libgconf-2-4
RUN apt-get install -y google-chrome-stable
RUN apt-get install -y xvfb gtk2-engines-pixbuf
RUN apt-get install -y xfonts-cyrillic xfonts-100dpi xfonts-75dpi xfonts-base xfonts-scalable
RUN apt-get install -y imagemagick x11-apps

RUN Xvfb :99 -screen 0 1600x1200x24 &
ENV DISPLAY=:99
ENV CHROME_BIN=/usr/bin/google-chrome

######
USER jenkins 
