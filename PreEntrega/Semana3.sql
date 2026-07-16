--1. Crear Base de datos
CREATE DATABASE StarbucksDB;
GO

--2. Declarar uso de esta BD
USE StarbucksDB;
GO

--3. Crear Tabla Padre (Productos)
CREATE TABLE Productos(
	ProductoID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(100) NOT NULL,
	Precio DECIMAL(10,2) NOT NULL	
);
GO
--Agregar Columnas
ALTER TABLE Productos ADD tipo VARCHAR(15); 

--4. Crear Tabla Hija (Ventas)
CREATE TABLE Ventas(
	VentaID INT IDENTITY(1,1) PRIMARY KEY,
	ProductoID INT NOT NULL,
	Cantidad INT NOT NULL,
	FechaVenta DATETIME DEFAULT GETDATE(),

	--Definir la relacion fisica (Crear el contrato de Itengridad)
	CONSTRAINT FK_Ventas_Productos FOREIGN KEY (ProductoID)
		REFERENCES Productos(ProductoID)
);
GO

SELECT * FROM Productos
SELECT * FROM Ventas

USE StarbucksDB;
GO

--1. Insertar registros en la tabla Padre(Productos)
INSERT INTO Productos(Nombre,Precio)
VALUES  ('Cafe Latte',4500.00),
		('Expresso Solo',3800.00),
		('Capuccino',5200.00);
GO

SELECT * FROM Productos

--2. Insertar registros de la tabla Hija(Ventas)
INSERT INTO Ventas(ProductoID,Cantidad)
VALUES  (1,2),
		(2,1);
GO

SELECT * FROM Ventas

-- Probar la FK
INSERT INTO Ventas (ProductoID,Cantidad)
VALUES (99,1)

--4. Proteccion de Borrado
DELETE FROM Productos WHERE ProductoID = 2;

