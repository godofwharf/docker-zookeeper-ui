FROM medined/docker-java-oracle7
MAINTAINER Guruprasad Sridharan <guruprasad.sridharan@gmail.com>

RUN apt-get update && apt-get install -y git maven 
RUN git clone https://github.com/DeemOpen/zkui.git
RUN cd /zkui && mvn clean install

ADD files/config.cfg.template /
ADD files/start.sh /

WORKDIR /zkui/target

EXPOSE 9090

ENTRYPOINT [ "/start.sh" ]
