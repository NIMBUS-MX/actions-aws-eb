FROM python:3.10

ARG command="--version"

COPY entrypoint.sh /entrypoint.sh

RUN apt-get update -y

RUN pip install "pyyaml<5.4"

RUN git clone https://github.com/aws/aws-elastic-beanstalk-cli-setup.git
RUN python ./aws-elastic-beanstalk-cli-setup/scripts/ebcli_installer.py

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
