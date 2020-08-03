# Container image that runs your code
FROM python:3.8-buster

# Copies your code file from your action repository to the filesystem path `/` of the container

COPY . /lean-upgrade-action/

RUN python -m pip install --upgrade pip mathlibtools
RUN curl https://raw.githubusercontent.com/Kha/elan/master/elan-init.sh -sSf | sh -s -- -y
RUN echo "$HOME/.elan/bin"
RUN ls "$HOME/.elan/bin"


# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/lean-upgrade-action/entrypoint.sh"]