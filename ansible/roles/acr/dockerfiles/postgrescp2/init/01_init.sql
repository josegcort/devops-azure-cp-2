-- Crear esquema personalizado
CREATE SCHEMA IF NOT EXISTS crud;

-- Asignar permisos al usuario sobre el esquema
GRANT ALL PRIVILEGES ON SCHEMA crud TO crud;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA crud TO crud;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA crud TO crud;

-- Establecer el search_path por defecto
ALTER USER crud SET search_path TO crud, public;