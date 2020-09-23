-- Comentario de linha
/*Comentario de bloco*/

-- Editores de texto
    -- Visual Studio Code
    -- Sublime text
    -- Notepad++
    -- Atom
    -- Brackets

-- .sql

-- Exibe todos os bancos de dadoas criados
\l

--Cria um banco de dados
--create database aula05-mpxi;
CREATE DATABASE aula05_mpxi;

-- Conecta a um banco de dados
\c aula05_mpxi;

-- Acessar os comandos nativos do terminal/dos
\! cls

-- produto
    -- descricao    ==> Texto
    -- fabricante   ==> Texto
    -- quantidade   ==> Inteiro 
    -- preco        ==> Real

-- Tipos de dados
    -- Numericos
        -- Inteiro  ==> INT ou INTEGER
        -- Real     ==> FLOAT ou NUMERIC(8,4)
    -- Texto
        -- CHAR (tamanho)   ==> CHAR(5)     S A L U _     255
        -- VARCHAR (tamanho)==> VARCHAR(5)  S A L U
        -- TEXT
    -- Datas
        -- TIMESTAMP    ==> DD/MM/YYYY HH:MM:SS
        -- DATE         ==> DD/MM/YYYY

CREATE TABLE produto(
    descricao VARCHAR(50),
    fabricante VARCHAR(50),
    quantidade INTEGER,
    preco NUMERIC(9,2)
);

-- Apagar uma tabela
DROP TABLE produto;

-- Exibe a descricao (DESC)
\d produto

-- DDL
-- DML 

-- Inserindo valores na tabela
INSERT INTO produto
VALUES ('Laptop', 'Sony', 150, 3500.99);

INSERT INTO produto 
(descricao, fabricante, quantidade)
values ('Processador', 'AMD', 300);

-- Consultado valores em uma tabela
SELECT * FROM produto;

-- Atualizando registros de uma tabela
UPDATE produto
SET preco = 330
WHERE descricao = 'Mouse';


-- Apagando registros de uma tabela
DELETE FROM produto WHERE descricao = 'Processador';

-- Encerra o SQL Shell
\q
