-- Borrar y recrear la base de datos
DROP DATABASE IF EXISTS blindboxintercambio;

CREATE DATABASE blindboxintercambio
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE blindboxintercambio;

-- Tabla usuarios
CREATE TABLE usuarios (
    id_usuario     INT          AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(80)  NOT NULL,
    username       VARCHAR(50)  NOT NULL UNIQUE,
    email          VARCHAR(120) NOT NULL UNIQUE,
    password       VARCHAR(255) NOT NULL,
    pais           VARCHAR(100),
    ciudad         VARCHAR(100),
    fecha_alta     DATETIME     DEFAULT NOW(),
    activo         TINYINT(1)   DEFAULT 1,
    rol            ENUM('usuario','admin') DEFAULT 'usuario' NOT NULL,
    mostrar_nombre TINYINT(1)   DEFAULT 0
);

-- Tabla marcas
CREATE TABLE marcas (
    id_marca   INT          AUTO_INCREMENT PRIMARY KEY,
    nombre     VARCHAR(100) NOT NULL UNIQUE,
    verificada TINYINT(1)   DEFAULT 0
);

-- Tabla modelos
CREATE TABLE modelos (
    id_modelo  INT          AUTO_INCREMENT PRIMARY KEY,
    id_marca   INT          NOT NULL,
    nombre     VARCHAR(100) NOT NULL,
    verificada TINYINT(1)   DEFAULT 0,
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);

-- Tabla series
CREATE TABLE series (
    id_serie   INT          AUTO_INCREMENT PRIMARY KEY,
    id_modelo  INT          NOT NULL,
    nombre     VARCHAR(100) NOT NULL,
    verificada TINYINT(1)   DEFAULT 0,
    FOREIGN KEY (id_modelo) REFERENCES modelos(id_modelo)
);

-- Tabla figuras
CREATE TABLE figuras (
    id_figura         INT          AUTO_INCREMENT PRIMARY KEY,
    id_usuario        INT          NOT NULL,
    id_serie          INT,
    nombre_figura     VARCHAR(100),
    nombre_verificado TINYINT(1)   DEFAULT 0,
    precio            DECIMAL(8,2),
    estado            ENUM('venta','intercambio','ambos') NOT NULL,
    condicion         ENUM('nueva_sellada','nueva_abierta','como_nueva','displayed','buen_estado','con_detalles') NOT NULL DEFAULT 'como_nueva',
    busca             TEXT,
    descripcion       TEXT,
    imagen_url        VARCHAR(255),
    fecha_pub         DATETIME     DEFAULT NOW(),
    activa            TINYINT(1)   DEFAULT 1,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_serie)   REFERENCES series(id_serie)
);

-- Tabla mensajes
CREATE TABLE mensajes (
    id_mensaje   INT      AUTO_INCREMENT PRIMARY KEY,
    id_figura    INT      NOT NULL,
    id_remitente INT      NOT NULL,
    contenido    TEXT     NOT NULL,
    fecha        DATETIME DEFAULT NOW(),
    FOREIGN KEY (id_figura)    REFERENCES figuras(id_figura),
    FOREIGN KEY (id_remitente) REFERENCES usuarios(id_usuario)
);

-- Tabla wishlist
CREATE TABLE wishlist (
    id_wishlist  INT      AUTO_INCREMENT PRIMARY KEY,
    id_usuario   INT      NOT NULL,
    id_figura    INT      NOT NULL,
    fecha        DATETIME DEFAULT NOW(),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_figura)  REFERENCES figuras(id_figura)
);

SHOW TABLES;
