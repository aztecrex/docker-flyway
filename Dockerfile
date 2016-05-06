FROM alpine:3.3

MAINTAINER CJ Engineering

# Basic stuff
#  jdk - flyway is a Java app
#  curl - to fetch the flyway tarball
#  bash - flyway scripts use it
#  nmap - for checking remote port status
RUN  apk update \
  && apk upgrade \
  && apk add openjdk8 curl bash nmap \
  && rm -rf /var/cache/apk/*

# Flyway
RUN  mkdir -p /working \
  && cd /working \
  && curl -O https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/4.0/flyway-commandline-4.0.tar.gz \
  && mkdir -p /opt \
  && tar -C /opt -xzf flyway-commandline-4.0.tar.gz \
  && mv /opt/flyway-4.0 /opt/flyway \
  && cd / \
  && rm -rf /working


# PostgreSQL JDBC Driver
ENV PSQL_JDBC 9.4-1201-jdbc41
RUN mkdir -p /working \
  && cd /working \
  && curl --location --output /opt/flyway/drivers/postgresql-${PSQL_JDBC}.jar --url http://search.maven.org/remotecontent?filepath=org/postgresql/postgresql/${PSQL_JDBC}/postgresql-${PSQL_JDBC}.jar \
  && cd \
  && rm -rf /working

COPY /scripts/* /usr/local/bin/
# COPY /conf/* /opt/flyway/conf/
# COPY /sql/* /opt/flyway/sql/


ENTRYPOINT ["entrypoint.flyway"]
CMD [""]
