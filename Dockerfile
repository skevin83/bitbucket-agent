FROM atlassian/default-image:4
COPY test-script.go /tmp/test-script.go
COPY test-script.sh /tmp/test-script.sh
RUN apt update -y && apt upgrade -y && apt install -y unzip && chmod 777 /tmp/test-script.*
RUN wget https://go.dev/dl/go1.23.0.linux-amd64.tar.gz -O go.tar.gz && tar -xzvf go.tar.gz -C /usr/local && echo export PATH=$HOME/go/bin:/usr/local/go/bin:$PATH >> /etc/bash.bashrc && source /etc/bash.bashrc
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install
RUN rm -rf awscliv2.zip go.tar.gz aws
