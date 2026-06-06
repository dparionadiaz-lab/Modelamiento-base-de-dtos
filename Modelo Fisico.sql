CREATE TABLE UBIGEO (
    id_ubigeo INT PRIMARY KEY,
    ubigeo_dep CHAR(2),
    departamento VARCHAR(100),
    ubigeo_provincial CHAR(4),
    provincia VARCHAR(100),
    ubigeo_distrito CHAR(6),
    distrito VARCHAR(100),
    ubigeo_ccpp VARCHAR(10),
    centro_poblado VARCHAR(150)
);

CREATE TABLE TAMBO (
    id_tambo INT PRIMARY KEY,
    nombre_tambo VARCHAR(150),
    codigo_tambo VARCHAR(20),
    estado VARCHAR(30),
    fecha_inicio_operacion DATE,
    id_ubigeo INT UNIQUE,

    FOREIGN KEY (id_ubigeo)
        REFERENCES UBIGEO(id_ubigeo)
);

CREATE TABLE ENTIDAD (
    id_entidad INT PRIMARY KEY,
    nombre_entidad VARCHAR(150),
    sigla VARCHAR(20),
    tipo_entidad VARCHAR(50),
    sector VARCHAR(50)
);

CREATE TABLE PLAN_TRABAJO (
    id_plan INT PRIMARY KEY,
    nombre_plan VARCHAR(150),
    objetivo VARCHAR(250),
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(30),
    id_entidad INT,

    FOREIGN KEY (id_entidad)
        REFERENCES ENTIDAD(id_entidad)
);

CREATE TABLE INTERVENCION (
    id_intervencion INT PRIMARY KEY,
    fecha_intervencion DATE,
    tipo_intervencion VARCHAR(50),
    modalidad VARCHAR(50),
    estado VARCHAR(30),
    observacion VARCHAR(250),
    id_plan INT,
    id_tambo INT,

    FOREIGN KEY (id_plan)
        REFERENCES PLAN_TRABAJO(id_plan),

    FOREIGN KEY (id_tambo)
        REFERENCES TAMBO(id_tambo)
);

CREATE TABLE SERVICIO (
    id_servicio INT PRIMARY KEY,
    nombre_servicio VARCHAR(150),
    descripcion VARCHAR(250),
    tipo_servicio VARCHAR(50),
    estado VARCHAR(30),
    id_entidad INT,

    FOREIGN KEY (id_entidad)
        REFERENCES ENTIDAD(id_entidad)
);

CREATE TABLE INTERVENCION_SERVICIO (
    id_intervencion_servicio INT PRIMARY KEY,
    codigo_intervencion VARCHAR(30),
    observacion VARCHAR(250),
    estado VARCHAR(30),
    id_intervencion INT,
    id_servicio INT,

    FOREIGN KEY (id_intervencion)
        REFERENCES INTERVENCION(id_intervencion),

    FOREIGN KEY (id_servicio)
        REFERENCES SERVICIO(id_servicio)
);

CREATE TABLE BENEFICIARIO (
    id_beneficiario INT PRIMARY KEY,
    tipo_documento VARCHAR(20),
    numero_documento VARCHAR(15),
    nombres VARCHAR(100),
    apellidos VARCHAR(100),
    sexo CHAR(1),
    fecha_nacimiento DATE,
    telefono VARCHAR(15),
    direccion VARCHAR(200)
);

CREATE TABLE ATENCION (
    id_atencion INT PRIMARY KEY,
    fecha_atencion DATE,
    hora_atencion TIME,
    observacion VARCHAR(250),
    id_beneficiario INT,
    id_intervencion_servicio INT,

    FOREIGN KEY (id_beneficiario)
        REFERENCES BENEFICIARIO(id_beneficiario),

    FOREIGN KEY (id_intervencion_servicio)
        REFERENCES INTERVENCION_SERVICIO(id_intervencion_servicio)
);