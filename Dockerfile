FROM mcr.microsoft.com/mssql/server:2022-latest
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Teste01&
USER root

RUN mkdir -p /usr/work
COPY *.sql /usr/work

WORKDIR /usr/work

RUN (/opt/mssql/bin/sqlservr & ) \
    | grep -q "Service Broker manager has started" \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -i script.sql \
    && pkill sqlservr
