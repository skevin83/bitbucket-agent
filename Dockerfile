FROM atlassian/default-image:5
RUN apt update -y && apt upgrade -y && apt install -y unzip
RUN wget https://go.dev/dl/go1.25.3.linux-amd64.tar.gz -O go.tar.gz && tar -xzvf go.tar.gz -C /usr/local && echo export PATH=$HOME/.local/bin:$HOME/go/bin:/usr/local/go/bin:$PATH >> /etc/bash.bashrc && source /etc/bash.bashrc
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install
RUN rm -rf awscliv2.zip go.tar.gz aws
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py --user && rm -rf get-pip.py
RUN /root/.local/bin/pip install requests