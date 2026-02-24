CREATE TABLE clinicas (
                          id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                          nombre VARCHAR(100) NOT NULL,
                          direccion VARCHAR(255),
                          telefono VARCHAR(20),
                          fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pacientes (
                           id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                           clinica_id UUID NOT NULL REFERENCES clinicas(id),
                           nombre VARCHAR(100) NOT NULL,
                           apellidos VARCHAR(150) NOT NULL,
                           email VARCHAR(100) UNIQUE,
                           fecha_nacimiento DATE,
                           fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);