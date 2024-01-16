FROM debian:latest

RUN apt -y update && apt -y upgrade && apt -y install curl gpg git && rm -rf /var/lib/apt/lists/*
RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list

RUN apt -y update && apt -y install code && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /code /data
WORKDIR /code

EXPOSE 8080
VOLUME [/code, /data]

CMD [ "code web-serve --help" ]
