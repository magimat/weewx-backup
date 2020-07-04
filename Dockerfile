FROM arm32v7/node

RUN apt-get update 
RUN apt-get install -y cron unzip

ENV TZ="America/New_York"

RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

ADD crontab /etc/cron.d/temp-cron
RUN chmod 0644 /etc/cron.d/temp-cron

RUN crontab /etc/cron.d/temp-cron

COPY go.sh ./go.sh
RUN chmod +x /go.sh

CMD /go.sh