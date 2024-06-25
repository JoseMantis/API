--Elimina el usuario creado:
USE master; --Base de datos utilizada.
GO
DROP USER ADMIN_JCODES;

--Elimina el login creado:
USE master; --Base de datos utilizada.
GO
DROP LOGIN J_CODES;


CREATE LOGIN J_CODES --Creaci�n del login para el usuario
	WITH PASSWORD = 'J_Codes2024';
GO

ALTER LOGIN J_CODES ENABLE; --Habilita el inicio de sesi�n

USE master; --Database que se utilizar�. Paso importante para autenticaci�n.
GO
 
CREATE USER ADMIN_JCODES --Creaci�n del usuario para un LOGIN designado.
	FOR LOGIN J_CODES;

ALTER ROLE db_datareader ADD MEMBER ADMIN_JCODES; --Permisos para ver datos
ALTER ROLE db_datawriter ADD MEMBER ADMIN_JCODES; --Permisos para editar datos.
ALTER SERVER ROLE sysadmin ADD MEMBER J_CODES; --Permisos de acceso del login al servidor SQL
GRANT EXECUTE TO ADMIN_JCODES --Permisos para ejecutar procedimientos


--C�DIGO EN CASO DE PROBLEMAS 
USE master; --Verifica si el usuario realmente existe en la base de datos
GO
SELECT name FROM sys.database_principals WHERE name = 'ADMIN_JCODES'; --debe retornar el nombre del usuario creado

USE master; --Verifica que el usuario creado est� mapeado correctamente
GO
SELECT name, type_desc, authentication_type_desc FROM sys.database_principals WHERE name = 'ADMIN_JCODES';
