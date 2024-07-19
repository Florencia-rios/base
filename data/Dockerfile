FROM postgres:latest

COPY ./data /docker-entrypoint-initdb.d/

HEALTHCHECK --interval=10s --timeout=5s --start-period=10s --retries=10 \
  CMD PGPASSWORD=$POSTGRES_PASSWORD pg_isready -U $POSTGRES_USER || exit 1
