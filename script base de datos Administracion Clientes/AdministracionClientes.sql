-- 1.1 Creación de la base de datos
CREATE DATABASE AdministracionClientes;
GO

-- Usar la base de datos creada
USE AdministracionClientes;
GO

-- 1.2 Tablas
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Rut VARCHAR(12) UNIQUE NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Telefono VARCHAR(20),
    FechaRegistro DATETIME DEFAULT GETDATE()
);

CREATE TABLE Direcciones (
    DireccionID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NOT NULL,
    Calle VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL,
    CodigoPostal VARCHAR(20) NOT NULL,
    Pais VARCHAR(50) NOT NULL
);

-- 1.3 Creación de índices
CREATE INDEX IX_Clientes_Rut ON Clientes(Rut);
CREATE INDEX IX_Direcciones_ClienteID ON Direcciones(ClienteID);

-- 1.4 Control de integridad referencial
ALTER TABLE Direcciones
ADD CONSTRAINT FK_Direcciones_Clientes
FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID);

-- 1.5 Poblar la base de datos
INSERT INTO Clientes (Nombre, Apellido, Rut, Email, Telefono)
VALUES 
('Juan', 'Pérez', '12345678-9', 'juan.perez@email.com', '555-1234'),
('María', 'González', '98765432-1', 'maria.gonzalez@email.com', '555-5678'),
('Carlos', 'Rodríguez', '11223344-5', 'carlos.rodriguez@email.com', '555-9012'),
('Ana', 'Martínez', '55667788-0', 'ana.martinez@email.com', '555-3456'),
('Pedro', 'Sánchez', '99887766-5', 'pedro.sanchez@email.com', '555-7890');

INSERT INTO Direcciones (ClienteID, Calle, Ciudad, CodigoPostal, Pais)
VALUES 
(1, 'Av. Libertador 1234', 'Santiago', '8320000', 'Chile'),
(2, 'Calle Providencia 567', 'Santiago', '7500000', 'Chile'),
(3, 'Paseo Ahumada 890', 'Santiago', '8320000', 'Chile'),
(4, 'Av. Las Condes 1122', 'Santiago', '7550000', 'Chile'),
(5, 'Calle Apoquindo 3344', 'Santiago', '7550000', 'Chile');

