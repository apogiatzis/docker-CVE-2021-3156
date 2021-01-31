FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y 
RUN apt-get install -y build-essential make wget whois gdb git python3-pip libssl-dev libffi-dev python3-dev sudo

RUN git clone https://github.com/apogiatzis/gdb-peda-pwndbg-gef && cd gdb-peda-pwndbg-gef && ./install.sh

RUN useradd -ms /bin/bash -G sudo victim 
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER victim

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)"

WORKDIR /home/victim

RUN git clone https://github.com/apogiatzis/gdb-peda-pwndbg-gef && cd gdb-peda-pwndbg-gef && ./install.sh

WORKDIR /home/victim/research

COPY install_sudo1_9_5p1.sh /home/victim/research
COPY install_sudo1_9_5.sh /home/victim/research
COPY install_sudo1_8_31.sh /home/victim/research
