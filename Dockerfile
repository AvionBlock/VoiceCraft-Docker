# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/runtime:9.0-alpine
LABEL description="Docker image version of VoiceCraft"
LABEL maintainer="Miniontoby"
LABEL org.opencontainers.image.source=https://github.com/AvionBlock/VoiceCraft-Docker
LABEL org.opencontainers.image.description="Docker image version of VoiceCraft"
LABEL org.opencontainers.image.licenses=MIT
LABEL org.opencontainers.image.authors="Miniontoby"

RUN apk add --no-cache --update curl unzip

WORKDIR /app
RUN curl -Lo VoiceCraft.Server.Linux.x64.zip https://github.com/AvionBlock/VoiceCraft/releases/latest/download/VoiceCraft.Server.Linux.x64.zip
RUN unzip VoiceCraft.Server.Linux.x64.zip
RUN rm VoiceCraft.Server.Linux.x64.zip

EXPOSE 9050/tcp
EXPOSE 9050/udp
EXPOSE 9051/tcp
CMD ["./VoiceCraft.Server"]

