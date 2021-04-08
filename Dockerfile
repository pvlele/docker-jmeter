# inspired by https://github.com/justb4/docker-jmeter
FROM ubuntu:latest

MAINTAINER Prasad Lele <pvlele.qk@mail.com>

ARG JMETER_VERSION="5.4.1"
ARG PLUGIN_VERSION="1.6"
ARG CMDRUNNER_VERSION="2.2"
# ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_HOME /opt/jmeter
ENV	JMETER_BIN	${JMETER_HOME}/bin
ENV	JMETER_DOWNLOAD_URL  https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz
ARG TZ="Asia/Kolkata"

RUN apt update && \
    apt upgrade -y && \
	apt  clean && \
	apt autoremove -y && \	
	apt install curl openjdk-8-jre -y 

RUN mkdir -p /tmp/dependencies/ && \
    curl -L --silent https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz  > /tmp/dependencies/jmeter.tgz \
    && tar -xzf /tmp/dependencies/jmeter.tgz -C /tmp/dependencies/ \
    && mv /tmp/dependencies/apache-jmeter-${JMETER_VERSION}/ ${JMETER_HOME} \
	&& rm -rf /tmp/dependencies \
    && curl -L --silent https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/${PLUGIN_VERSION}/jmeter-plugins-manager-${PLUGIN_VERSION}.jar  > ${JMETER_HOME}/lib/ext/jmeter-plugins-manager-${PLUGIN_VERSION}.jar \
    && curl -L --silent http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/${CMDRUNNER_VERSION}/cmdrunner-${CMDRUNNER_VERSION}.jar  > ${JMETER_HOME}/lib/cmdrunner-${CMDRUNNER_VERSION}.jar  \
    && java -cp ${JMETER_HOME}/lib/ext/jmeter-plugins-manager-${PLUGIN_VERSION}.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

ENV PATH $PATH:$JMETER_BIN

COPY entrypoint.sh /

WORKDIR	${JMETER_HOME}

ENTRYPOINT ["/bin/bash" , "-l", "-c"]
CMD ["entrypoint.sh"]