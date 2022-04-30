FROM ubuntu:latest

ENV TZ=Europe/Warsaw

RUN apt update && apt -y upgrade && apt -y install openjdk-8-jdk curl unzip zip
RUN curl -s "https://get.sdkman.io" | bash
RUN /bin/bash -c "source /root/.sdkman/bin/sdkman-init.sh; sdk version; sdk install sbt;sdk install scala 2.12.15; sdk install gradle 7.4.2"

EXPOSE 8000

RUN useradd -ms /bin/bash wklasa
RUN adduser wklasa sudo

USER wklasa
WORKDIR /home/wklasa
RUN mkdir shared

VOLUME /home/wklasa/shared

