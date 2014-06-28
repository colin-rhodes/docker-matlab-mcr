#
# Matlab MCR Dockerfile
# downloads and installs the Matlab Compiler Runtime and dependencies on Ubuntu
# version R2013a
#

FROM colinrhodes/base

MAINTAINER Colin Rhodes <colin@colin-rhodes.com>

RUN apt-get install -yq xorg unzip

RUN apt-get install -yq wget

ADD input.txt /mcr-install/input.txt

RUN cd /mcr-install && \
    wget -nv http://www.mathworks.com/supportfiles/MCR_Runtime/R2013a/MCR_R2013a_glnxa64_installer.zip && \
    unzip MCR_R2013a_glnxa64_installer.zip && \
    mkdir /opt/mcr && \
    ./install -inputFile input.txt && \
    cd / && \
    rm -rf mcr-install

WORKDIR /
