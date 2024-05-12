FROM mcr.microsoft.com/mssql/server:latest

COPY ./data .

HEALTHCHECK --interval=10s --timeout=5s --start-period=10s --retries=10 \
CMD /opt/mssql-tools/bin/sqlcmd -S . -U sa -P ${MSSQL_SA_PASSWORD} -i init-sql.sql || exit 1
