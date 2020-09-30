-- Uma empresa requer armazenar os dados de seus clientes, 
-- esses clientes são proprietarios de bens, cujo o armazenamento das informações tbm sao requeridos. 
-- Dados dos proprietario: nome, email, sexo e endereço. 
-- Dados dos bens: nome, tipo(movel ou imovel) e valor. 
-- Cada proprietario pode nao ter bens ou ter N bens, ja um bem, obrigatoriamente deve ser de um, 
-- e somente um proprietario.

-- Toda tabela DEVE possuir uma chave primária
	-- CONSTRAINT ==> Restrição
		-- NOT NULL ==> preenchimento obrigatorio
		-- UNIQUE ==> apenas valores unicos
		-- CHECK ==> verifica o dominio
-- EXECUTAR SCRIPT ==> F5

CREATE DATABASE aula06_mpxi;

CREATE TABLE proprietario(
	codigo INTEGER PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) NOT NULL UNIQUE,
	sexo CHAR(1) CHECK(sexo='F' OR sexo ='f' OR sexo='M' OR sexo='m') NOT NULL,
	endereco VARCHAR(100) 
);

-- OR 	==> ||
-- AND 	==> &&
-- NOT	==> !

-- CTRL + SPACE
INSERT INTO proprietario VALUES (100, 'Ana', 'ana@email.com', 'F', 'Rua ABC, 33');
INSERT INTO proprietario VALUES 
(101, 'Pedro', 'pedro@email.com', 'm', 'Rua XYZ, 44'),
(102, 'Maria', 'maria@email.com', 'M', 'Rua POO, 123'),
(103, 'Gabi', 'gabi@email.com', 'f', 'Avenida ABC, 456'),
(104, 'Fernanda', 'nanda@email.com', 'F', 'Rua mm, 789');

INSERT INTO proprietario VALUES (105, 'Antonio', 'tonho@email.com', 'M');
INSERT INTO proprietario VALUES (106, 'Maria', 'maria123@email.com', 'F', 'Rua ABC, 33');

UPDATE proprietario
SET endereco = 'Rua Java, 999'
WHERE codigo = 104;

UPDATE proprietario
SET endereco = 'Rua C++, 1000'
WHERE nome = 'Maria';

DELETE FROM proprietario
WHERE email = 'tonho@email.com';

SELECT * FROM proprietario ORDER BY nome ASC;


--ALTER TABLE proprietario ALTER COLUMN endereco TYPE VARCHAR(150);
--INSERT INTO proprietario VALUES (1, 'carlos');
--INSERT INTO proprietario VALUES (2, 'mauro');
--SELECT * FROM proprietario;
--DROP TABLE proprietario;

-- SERIAL (INTEGER) 1, 2, 3, 4, ...
-- SEQUENCE
	-- 1000, 1010, 1020, 1030, 1040...

CREATE TABLE bens(
	codigo SERIAL PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	tipo CHAR(6) CHECK(tipo='movel' OR tipo='imovel') NOT NULL,
	valor NUMERIC(9,2) CHECK(valor>0 AND valor <=1000000) NOT NULL,
	cod_prop INTEGER,
	FOREIGN KEY (cod_prop) REFERENCES proprietario(codigo)
);

/* FORMA ALTERNATIVA FOREIGN KEY
CREATE TABLE bens(
	codigo SERIAL PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	tipo CHAR(6) CHECK(tipo='movel' OR tipo='imovel') NOT NULL,
	valor NUMERIC(9,2) CHECK(valor>0 AND valor <=1000000) NOT NULL,
	cod_prop INTEGER REFERENCES proprietario(codigo)
);
*/

INSERT INTO bens (nome, tipo, valor, cod_prop) VALUES ('Carro', 'movel', 32000, 101);
INSERT INTO bens (nome, tipo, valor, cod_prop) VALUES ('Moto', 'movel', 22000, 102);
INSERT INTO bens (nome, tipo, valor, cod_prop) VALUES ('Casa', 'imovel', 32000000, 103);
INSERT INTO bens (nome, tipo, valor, cod_prop) VALUES ('Sitio', 'imovel', 500000, 104);
INSERT INTO bens (nome, tipo, valor, cod_prop) VALUES ('Fazenda', 'imovel', 1000000, 100);

-- Gera um erro, o proprietario de codigo 101 possui algum bem.
DELETE FROM proprietario
WHERE codigo = 101;

-- Para apagar o proprietario de codigo 101, é preciso primeiro apagar todos os bens que ele possui
DELETE FROM bens WHERE cod_prop = 101;

DELETE FROM proprietario
WHERE codigo = 101;

SELECT * FROM bens;
SELECT * FROM proprietario;

