-- Crear tabla Usuarios si no existe
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Usuarios' and xtype='U')
BEGIN
    CREATE TABLE Usuarios (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Nombre NVARCHAR(100),
        Correo NVARCHAR(100),
        FechaRegistro DATETIME DEFAULT GETDATE()
    );
END

-- Insertar un usuario de prueba
INSERT INTO Usuarios (Nombre, Correo)
VALUES ('Usuario de prueba', 'usuario@ejemplo.com');
