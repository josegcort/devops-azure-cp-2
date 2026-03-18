# ---------- RUNTIME ----------
FROM docker.io/library/postgres:14-alpine

# Variables de entorno por defecto (se sobreescriben en AKS con Secrets)
ENV POSTGRES_USER=crud
ENV POSTGRES_PASSWORD=crud*2026
ENV POSTGRES_DB=crud

EXPOSE 5432

# Copiar scripts de inicialización
# PostgreSQL los ejecuta automáticamente al primer arranque
# COPY init/*.sql /docker-entrypoint-initdb.d/