FROM public.ecr.aws/docker/library/tomcat:9.0

LABEL maintainer="github.com/PengBAI"

RUN rm -rf /usdocke rps r/local/tomcat/webapps/ROOT/*

ADD webapp/ /usr/local/tomcat/webapps/ROOT/

## Create non-root user 
RUN useradd -ms /bin/bash mario \
    && usermod -aG mario mario \
    && chown -R mario:mario /usr/local/tomcat

EXPOSE 8080

CMD ["catalina.sh", "run"]

USER mario