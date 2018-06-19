FROM ubuntu:latest
MAINTAINER ueno.k

# Pre
RUN set -x && \
    yes | apt-get update  && \
    yes | apt-get install autoconf automake libtool python-dev jq python-pip git && \
    pip install awscli boto boto3

WORKDIR /opt

# CloudMapper Install
RUN set -x && \
    git clone https://github.com/duo-labs/cloudmapper.git && \
    cd cloudmapper && \
    pip install -r requirements.txt && \
    cp -ip config.json.demo config.json && \
    sed -i -e 's/demo/aws_account_1/' config.json
 
# CloudMapper RUN
# RUN set -x && \
#    ./collect_data.sh --account aws_account_1 && \
#    python cloudmapper.py prepare --account aws_account_1

#ENTRYPOINT [ "python cloudmapper.py webserver --public --port 8080"  ]

CMD [ "/bin/bash"]

