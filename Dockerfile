FROM rocker/shiny:latest

MAINTAINER Yakov Zaytsev "me@ysz.se"

RUN echo 'deb-src http://httpredir.debian.org/debian testing main' >> /etc/apt/sources.list
RUN echo 'deb-src http://httpredir.debian.org/debian testing-updates main' >> /etc/apt/sources.list
RUN echo 'deb-src http://security.debian.org testing/updates main' >> /etc/apt/sources.list

RUN apt-get update && apt-get build-dep -y libopencv-dev

RUN wget https://github.com/Itseez/opencv/archive/3.1.0.zip -O opencv-3.1.0.zip

RUN unzip opencv-3.1.0.zip

WORKDIR opencv-3.1.0

RUN mkdir build

WORKDIR build

RUN cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/ -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=OFF -D WITH_OPENGL=ON ..

RUN make && make install

RUN echo 'install.packages(c("ggplot2", "png", "gridExtra"), repos = "http://cran.rstudio.com/")' | R --no-save

# RUN mkdir -p /home/shiny/local-cran/src/contrib

ADD custom-repos.R /custom-repos.R

WORKDIR /

RUN R < /custom-repos.R --no-save

