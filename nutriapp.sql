CREATE DATABASE nutriapp;
USE nutriapp;

CREATE TABLE Roles (
    idRol INT NOT NULL AUTO_INCREMENT,
    rol VARCHAR(255) NOT NULL,
    PRIMARY KEY (idRol)
);

CREATE TABLE ColaboradoresEstatus (
    idEstatus INT NOT NULL AUTO_INCREMENT,
    estatus VARCHAR(100) NOT NULL,
    PRIMARY KEY (idEstatus)
);

CREATE TABLE Colaboradores (
    idColaborador INT NOT NULL AUTO_INCREMENT,
    noPersonal VARCHAR(12) NOT NULL,
    nombre VARCHAR(180) NOT NULL,
    apellidoPaterno VARCHAR(100) NOT NULL,
    apellidoMaterno VARCHAR(100) NOT NULL,
    fechaContratacion DATE NOT NULL,
    password VARCHAR(70) NOT NULL,
    idRol INT NOT NULL,
    idEstatus INT NOT NULL,
    PRIMARY KEY (idColaborador),
    UNIQUE KEY uq_colaboradores_noPersonal (noPersonal),
    CONSTRAINT fk_usuarios_roles FOREIGN KEY (idRol) REFERENCES Roles(idRol),
    CONSTRAINT FK_Colaborador_Estatus FOREIGN KEY (idEstatus) REFERENCES ColaboradoresEstatus(idEstatus)
);

INSERT INTO Roles (rol) VALUES ('Administrador');
INSERT INTO Roles (rol) VALUES ('Nutriologo');
INSERT INTO Roles (rol) VALUES ('Invitado');

INSERT INTO ColaboradoresEstatus (estatus) VALUES ('Activo');
INSERT INTO ColaboradoresEstatus (estatus) VALUES ('Baja definitiva');
INSERT INTO ColaboradoresEstatus (estatus) VALUES ('Suspension temporal');

INSERT INTO Colaboradores (noPersonal, nombre, apellidoPaterno, apellidoMaterno, fechaContratacion, password, idRol, idEstatus)
VALUES ('np0001', 'Valeria', 'Ortega', 'Ramirez', '2019-03-11', SHA2('Valeria2024', 256), 1, 1);

INSERT INTO Colaboradores (noPersonal, nombre, apellidoPaterno, apellidoMaterno, fechaContratacion, password, idRol, idEstatus)
VALUES ('np0002', 'Ricardo', 'Mendoza', 'Lopez', '2021-09-06', SHA2('Nutri2025', 256), 2, 1);

INSERT INTO Colaboradores (noPersonal, nombre, apellidoPaterno, apellidoMaterno, fechaContratacion, password, idRol, idEstatus)
VALUES ('np0003', 'Daniela', 'Fuentes', 'Castillo', '2023-01-16', SHA2('Dani2026', 256), 2, 1);

INSERT INTO Colaboradores (noPersonal, nombre, apellidoPaterno, apellidoMaterno, fechaContratacion, password, idRol, idEstatus)
VALUES ('np0004', 'Emilio', 'Vargas', 'Navarro', '2022-05-30', SHA2('Emilio123', 256), 2, 2);

INSERT INTO Colaboradores (noPersonal, nombre, apellidoPaterno, apellidoMaterno, fechaContratacion, password, idRol, idEstatus)
VALUES ('np0005', 'Sofia', 'Herrera', 'Duran', '2026-02-02', SHA2('Sofia456', 256), 3, 3);

INSERT INTO Colaboradores (noPersonal, nombre, apellidoPaterno, apellidoMaterno, fechaContratacion, password, idRol, idEstatus)
VALUES ('np0006', 'Luis', 'Pacheco', 'Rojas', '2026-06-15', SHA2('Invitado1', 256), 3, 1);

-- Verificacion
SELECT c.idColaborador, c.noPersonal, c.nombre, c.apellidoPaterno, c.apellidoMaterno,
       c.fechaContratacion, r.rol, e.estatus
FROM Colaboradores c
INNER JOIN Roles r ON r.idRol = c.idRol
INNER JOIN ColaboradoresEstatus e ON e.idEstatus = c.idEstatus;