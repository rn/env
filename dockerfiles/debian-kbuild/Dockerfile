# Base Dockerfile containing packages to build linux kernels and
# related artefacts. Based on Debian 
FROM debian:unstable
MAINTAINER rolf.neugebauer@gmail.com
RUN apt-get update && apt-get -y upgrade && \
    apt-get -y install \
            unzip \
            xz-utils \
            curl \
            build-essential \
            gcc libc6 libc6-dev \
            kmod \
            squashfs-tools \
            genisoimage \
            syslinux \
            isolinux \
            automake \
            pkg-config \
            git 
