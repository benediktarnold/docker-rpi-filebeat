FROM hypriot/rpi-golang

RUN mkdir -p $GOPATH/src/github.com/elastic
WORKDIR $GOPATH/src/github.com/elastic
RUN git clone https://github.com/elastic/beats.git
WORKDIR $GOPATH/src/github.com/elastic/beats
RUN git checkout v1.0.1
WORKDIR $GOPATH/src/github.com/elastic/beats/filebeat
RUN make && mkdir -p $GOPATH/bin/ && cp filebeat $GOPATH/bin/
RUN mkdir -p /etc/filebeat

CMD ["filebeat","-e"]
