FROM ubuntu:20.04

# Set environment variables to prevent timezone selection prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Install dependencies
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install bc build-essential zip curl libstdc++6 tzdata git wget gcc clang libssl-dev rsync flex bison cpio libncurses5 curl python-is-python3 lsb-release axel dos2unix

# Git configuration and environment setup without sudo
RUN git config --global user.name "prorooter007" && \
    git config --global user.email "shreyashwasnik112@gmail.com" && \
    git config --global color.ui false && \
    git clone https://github.com/akhilnarang/scripts && \
    cd scripts && sed -i 's/sudo //g' setup/android_build_env.sh && bash setup/android_build_env.sh && cd ..

# Create a working directory
RUN mkdir predator && \
    cd predator 

COPY build_menu .

RUN chmod +x build_menu
