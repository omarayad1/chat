FROM maven:3.6-jdk-8-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package
RUN cd /home/app/target
WORKDIR /home/app/target
CMD java -jar /home/app/target/ChatBroadcastSSE-1.0.jar de.affinitas.chat.service.ChatBroadcastSSEService