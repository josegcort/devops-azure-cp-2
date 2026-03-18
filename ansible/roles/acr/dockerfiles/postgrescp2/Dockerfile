# ---------- RUNTIME ----------
FROM docker.io/library/postgres:14-alpine

# Variables de entorno por defecto (se sobreescriben en AKS con Secrets)
ENV POSTGRES_USER=user
ENV POSTGRES_PASSWORD=******
ENV POSTGRES_DB=userdb

EXPOSE 5432

# Copiar scripts de inicialización
# PostgreSQL los ejecuta automáticamente al primer arranque
# COPY init/*.sql /docker-entrypoint-initdb.d/