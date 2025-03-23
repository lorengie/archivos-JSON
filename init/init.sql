CREATE DATABASE IF NOT EXISTS Concierto_Mexico;
USE Concierto_Mexico;

CREATE TABLE Concierto (
    id_concierto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    lugar VARCHAR(100) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL
);

INSERT INTO Concierto (nombre, fecha, lugar, ciudad, pais) 
VALUES ('BTS: Solistas en México', '2025-07-20', 'Foro Sol', 'Ciudad de México', 'México');

CREATE TABLE Asistentes (
    id_asistente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO Asistentes (nombre, correo) VALUES 
('Carlos Pérez', 'carlos@example.com'),
('Ana Rodríguez', 'ana@example.com'),
('Luis Martínez', 'luis@example.com');

CREATE TABLE Artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL,
    id_concierto INT NOT NULL,
    FOREIGN KEY (id_concierto) REFERENCES Concierto(id_concierto) ON DELETE CASCADE
);

INSERT INTO Artistas (nombre, especialidad, id_concierto) VALUES
('RM', 'Rap', 1),
('Jin', 'Vocalista', 1),
('Suga', 'Rap', 1),
('J-Hope', 'Rap/Danza', 1),
('Jimin', 'Vocalista/Danza', 1),
('V', 'Vocalista', 1),
('Jungkook', 'Vocalista/Danza', 1);

CREATE TABLE Boletos (
    id_boleto INT AUTO_INCREMENT PRIMARY KEY,
    id_asistente INT,
    tipo ENUM('VIP', 'General', 'Grada') NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_concierto INT NOT NULL,
    FOREIGN KEY (id_asistente) REFERENCES Asistentes(id_asistente) ON DELETE SET NULL,
    FOREIGN KEY (id_concierto) REFERENCES Concierto(id_concierto) ON DELETE CASCADE
);

INSERT INTO Boletos (id_asistente, tipo, precio, id_concierto) VALUES 
(1, 'VIP', 500.00, 1),
(2, 'General', 200.00, 1),
(3, 'Grada', 100.00, 1);

CREATE TABLE Asientos (
    id_asiento INT AUTO_INCREMENT PRIMARY KEY,
    id_boleto INT UNIQUE,
    sector VARCHAR(20) NOT NULL,
    fila VARCHAR(5) NOT NULL,
    numero_asiento INT NOT NULL,
    FOREIGN KEY (id_boleto) REFERENCES Boletos(id_boleto) ON DELETE CASCADE
);

INSERT INTO Asientos (id_boleto, sector, fila, numero_asiento) VALUES 
(1, 'VIP', 'A', 1),
(2, 'General', 'C', 20),
(3, 'Grada', 'F', 45);





