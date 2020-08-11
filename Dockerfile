FROM python:3.7.8-buster

# Install java 8
RUN apt-get update && apt-get -y install ca-certificates software-properties-common && \
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - && \
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
    apt-get update && apt-get -y install adoptopenjdk-8-hotspot && \
    update-alternatives --config java

# Install utilities
RUN apt-get install sudo

# Install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false


