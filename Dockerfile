FROM hl7fhir/ig-publisher-base:latest

WORKDIR /ig

ADD ./fsh.ini ./fsh.ini
ADD ./ig.ini ./ig.ini
ADD ./sushi-config.yml ./sushi-config.yml
ADD ./input ./input

RUN /home/publisher/bin/ig-publisher-scripts/_updatePublisher.sh -y

ADD ./Dockerfile ./Dockerfile

ENTRYPOINT [ "/home/publisher/bin/ig-publisher-scripts/_genonce.sh" ]
