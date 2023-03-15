CREATE DATABASE ast;
USE ast;

CREATE TABLE cliente(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    contato VARCHAR(50),
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

INSERT INTO cliente VALUES
(NULL, 'fisherman', '12345678000160', '(11)99999-9999', 'fisher@gmail.com', '1234567senha'),
(NULL, 'fishguy', '87654321000190', '(11)12345-4567', 'fishguy@outlook.com','628946pexe'),
(NULL, 'pesque e pague', '99999999000199', '(11)56798-1549', 'tilapialover@hotmail.com', 'amopexe');

UPDATE cliente SET nome = 'tilapiaman' WHERE id = 1;

SELECT * FROM cliente;

CREATE TABLE sensor(
	id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    local VARCHAR(255) NOT NULL
);

INSERT INTO sensor VALUES(NULL, 'Temperatura', 'Caminhão');

SELECT * FROM sensor;

CREATE TABLE registro(
	idRegistro INT PRIMARY KEY auto_increment,
	-- sensor_id INT (foreign key)
    temperatura INT,
    data DATETIME
);

ALTER TABLE registro RENAME COLUMN data TO data_hora;


INSERT INTO registro VALUES(NULL, 22.5, '2023-03-06 14:13:22');
INSERT INTO registro VALUES(NULL, 22.0, '2023-03-06 15:13:22');

ALTER TABLE registro ADD COLUMN fkSensor INT,
	ADD FOREIGN KEY (fkSensor) REFERENCES sensor(id);
    
UPDATE registro SET fkSensor = 1 WHERE idRegistro = 1;
UPDATE registro SET fkSensor = 1 WHERE idRegistro = 2;

SELECT * FROM sensor JOIN registro
	ON sensor.id = registro.idRegistro;
    
SELECT
	sensor.tipo,
    sensor.local,
    registro.temperatura,
    registro.data_hora
    FROM sensor JOIN registro
    ON sensor.id = registro.fkSensor;
    