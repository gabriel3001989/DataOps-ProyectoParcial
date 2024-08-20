--create database kaggle;

USE kaggle
GO

-- En caso  no exista la tabla
IF NOT EXISTS (SELECT * FROM SYS.Tables WHERE object_id = OBJECT_ID(N'dbo.olympics') AND type = 'U')
	CREATE TABLE dbo.olympics(
		NOC		VARCHAR(10),
		Gold	INT,
		Silver	INT,
		Bronze	INT,
		Total	INT
	)
GO

-- Si ya existe la tabla
TRUNCATE TABLE dbo.olympics;
GO

-- Importar data desde archivo
BULK INSERT dbo.olympics
FROM 'C:\Users\gabri\Desktop\Cursos\Data Analytics-CERTUS\DataOps\Proyecto_Parcial\dataset\Athens 2004 Olympics Nations Medals.csv'
WITH
(
	FIRSTROW = 2,   -- Empieza a leer desde el segundo registro
	FIELDTERMINATOR = ',',  -- Separador de columnas (dilimitador)
	ROWTERMINATOR = '0X0a'  -- Hace referencia a un salto de Linea
)
GO