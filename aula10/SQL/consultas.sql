/*Criando consultas*/

/*Exibir todas as informacoes de todos os empregados, departamentos e clientes*/
SELECT * FROM empregado;
SELECT * FROM departamento;
SELECT * FROM cliente;


/*ORDENAÇÃO DE CONSULTAS */

SELECT * FROM EMPREGADO ORDER BY PRIM_NOME;
SELECT * FROM EMPREGADO ORDER BY PRIM_NOME DESC;


/*Filtrando colunas*/

/*Exibir o primeiro e ultimo nome de todos os empregados*/
SELECT ID, PRIM_NOME, ULT_NOME FROM EMPREGADO;

SELECT ID, PRIM_NOME, ULT_NOME FROM EMPREGADO ORDER BY PRIM_NOME;

/*Escrevendo expressoes*/

/*Exibir o nome completo de todos os empregados e o salario anual*/

SELECT PRIM_NOME, ULT_NOME, SALARIO FROM EMPREGADO;

SELECT PRIM_NOME, ULT_NOME, SALARIO * 12 FROM EMPREGADO;

SELECT PRIM_NOME || ULT_NOME, SALARIO * 12 FROM EMPREGADO;
SELECT PRIM_NOME || ' ' || ULT_NOME, SALARIO * 12 FROM EMPREGADO;

/*Criando ALIAS*/
/*Exibir o nome completo de todos os empregados com o cabecalho (Nome completo) e o salario anual com o cabecalho (Salario Anual)*/
SELECT PRIM_NOME || ' ' || ULT_NOME AS "Nome completo", SALARIO * 12 AS "Salario anual" FROM EMPREGADO;

SELECT PRIM_NOME AS "Nome", ULT_NOME AS "Sobrenome", SALARIO AS "Pagamento" FROM EMPREGADO;

SELECT PRIM_NOME || ' ' || ULT_NOME AS "Nome completo", SALARIO * 12 AS "Salario anual" FROM EMPREGADO ORDER BY 1;
SELECT PRIM_NOME || ' ' || ULT_NOME AS "Nome completo", SALARIO * 12 AS "Salario anual" FROM EMPREGADO ORDER BY "Salario anual";

/*Distinct*/
/*Exibir os cargos unicos dos funcionarios*/

SELECT DISTINCT CARGO FROM EMPREGADO;

SELECT DISTINCT CARGO, SALARIO FROM EMPREGADO;

SELECT CARGO, ID_DEPTO FROM EMPREGADO;

SELECT DISTINCT CARGO, ID_DEPTO FROM EMPREGADO;

/*Filtrando linhas WHERE*/

/*Exibir todos os empregados que possuem ID maior que 3*/
SELECT * FROM EMPREGADO WHERE ID > 3;

SELECT * FROM EMPREGADO WHERE SALARIO = 4000;

SELECT * FROM EMPREGADO WHERE UPPER(CARGO) = 'VENDEDOR';
SELECT * FROM EMPREGADO WHERE CARGO = 'Vendedor';
SELECT * FROM EMPREGADO WHERE LOWER(CARGO) = 'vendedor';
SELECT * FROM EMPREGADO WHERE UPPER(CARGO) = UPPER('VeNdEdOr');

/*Trabalhando com datas*/
/*Exibir os empregados contratados no dia 07/04/2010*/

SELECT * FROM EMPREGADO WHERE DT_ADMISSAO = '07/04/2010';
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO = '07-04-2010';
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO = '07-04-10';
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO = '07/04/10';

/*EMPREGADOS CONTRATADOS DEPOIS DE 2009*/
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO > '31/12/2009';
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO >= '01/01/2010';

/*Operadores logicos*/
/*Exibir todos os empregados que foram contratados depois de 2008 E que recebem salario maior que 10000*/
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO > '31/12/2008' AND SALARIO > 10000;

/*Exibir todos os empregados que foram contratados depois de 2008 OU que recebem salario maior que 10000*/
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO > '31/12/2008' OR SALARIO > 10000;

/*TODOS OS EMPREGADOS CONTRATADOS EM 2009*/
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO >= '01/01/2009' AND DT_ADMISSAO <= '31/12/2009';

/*EMPREGADOS QUE NÃO SÃO VENDEDORES*/
SELECT * FROM EMPREGADO WHERE UPPER(CARGO) != 'VENDEDOR';
SELECT * FROM EMPREGADO WHERE UPPER(CARGO) <> 'VENDEDOR';

/*Operadores relacionais*/
/*IN*/
/*Exibir todos os empregados que trabalham no departamento 10 ou 30*/
SELECT * FROM EMPREGADO WHERE ID_DEPTO = 10 OR ID_DEPTO = 30;
SELECT * FROM EMPREGADO WHERE ID_DEPTO IN (10, 30);

/*Exibir todos os empregados que NÃO trabalham no departamento 10 ou 30*/
SELECT * FROM EMPREGADO WHERE ID_DEPTO NOT IN (10, 30);
SELECT * FROM EMPREGADO WHERE ID_DEPTO != 10 AND ID_DEPTO != 30;

SELECT * FROM EMPREGADO WHERE DT_ADMISSAO IN ('08-04-2008', '10-01-2008');

/*BETWEEN*/
/*Exibir todos os empregados que possuem um salario entre 8000 e 19500*/
SELECT * FROM EMPREGADO WHERE SALARIO >= 8000 AND SALARIO <= 19500;
SELECT * FROM EMPREGADO WHERE SALARIO BETWEEN 8000 AND 19500;

/*Exibir todos os empregados que NÃO possuem um salario entre 8000 e 19500*/
SELECT * FROM EMPREGADO WHERE SALARIO NOT BETWEEN 8000 AND 19500;
SELECT * FROM EMPREGADO WHERE SALARIO < 8000 OR SALARIO > 19500;

/*Exibir todos os empregados que foram contrados em 2009*/
SELECT * FROM EMPREGADO WHERE DT_ADMISSAO BETWEEN '01/01/2009' AND '31/12/2009';


/*LIKE*/
/*Exibir todos os empregados cujo sobrenome comece com a letra N*/
-- % VARIOS CARACTERES
-- _ UM CARACTER

SELECT * FROM EMPREGADO WHERE ULT_NOME LIKE 'N%';
SELECT * FROM EMPREGADO WHERE LOWER(ULT_NOME) LIKE 'n%';
SELECT * FROM EMPREGADO WHERE ULT_NOME LIKE 'No%';

SELECT * FROM EMPREGADO WHERE ULT_NOME NOT LIKE '__d%';

/*Exibir todos os empregados cujo sobrenome termine com a letra S*/
SELECT * FROM EMPREGADO WHERE ULT_NOME LIKE '%s';

SELECT * FROM EMPREGADO WHERE PRIM_NOME LIKE '%rio';

/*Exibir todos os empregados cujo nome tenha a letra U*/
SELECT * FROM EMPREGADO WHERE PRIM_NOME LIKE '%u%'
SELECT * FROM EMPREGADO WHERE LOWER(ULT_NOME) LIKE '%u%'

/*Exibir todos os empregados cujo sobrenome tenha a letra O como segunda letra*/
SELECT * FROM EMPREGADO WHERE ULT_NOME LIKE '_o%';
SELECT * FROM EMPREGADO WHERE ULT_NOME LIKE '__d%';
SELECT * FROM EMPREGADO WHERE ULT_NOME LIKE '_____';


