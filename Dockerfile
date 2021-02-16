FROM domoticz/domoticz:latest

ARG APP_VERSION
ARG APP_HASH
ARG BUILD_DATE

LABEL org.label-schema.version=$APP_VERSION \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$APP_HASH \
      org.label-schema.name="MyDomoticz" 
      
WORKDIR /opt/domoticz

RUN apt-get update \
    && apt-get install -y python3-cryptography python3-requests-toolbelt python3-paramiko 

VOLUME /opt/domoticz/userdata

EXPOSE 8082
EXPOSE 8443

ENV LOG_PATH=
ENV DATABASE_PATH=
ENV WWW_PORT=8082
ENV SSL_PORT=8443
ENV EXTRA_CMD_ARG=

# timezone env with default
ENV TZ=Europe/Rome
