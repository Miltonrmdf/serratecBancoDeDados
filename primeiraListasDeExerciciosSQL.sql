-- PRIMEIRA LISTA DE EXERCÍCIOS DE SQL 
-- USANDO O PGADMIN
-- SITE BOM PARA AJUDAR A LEMBRAR OS COMANDOS
-- https://halleyoliv.gitlab.io/pgdocptbr/tutorial.html
/*------------------------------------------------------*/
--Criação de Tabelas Básicas:
/*Crie uma tabela chamada clientes com as 
seguintes colunas: id (inteiro, chave primária, autoincremento),
nome (texto, não nulo), email (texto, único) e data_cadastro (data).*/

CREATE TABLE clientes (
id SERIAL PRIMARY KEY,
nome  VARCHAR(100) NOT NULL,
email  VARCHAR(50) UNIQUE,
data_cadastro DATE
);

--Modificação de Tabela:
/* Altere a tabela clientes para adicionar uma 
coluna telefone (texto) e uma
coluna data_nascimento (data).*/

ALTER TABLE clientes
ADD COLUMN telefone VARCHAR(10),
ADD COLUMN data_nascimento DATE;

--Excluir Coluna:
--Exclua a coluna data_nascimento da tabela clientes.

ALTER TABLE clientes
DROP COLUMN data_nascimento;

--Renomear Coluna:
--Renomeie a coluna telefone da tabela clientes para celular.

ALTER TABLE clientes
RENAME COLUMN telefone TO celular;

--Criação de Tabela com Chave Estrangeira:
/*Crie uma tabela chamada pedidos com as seguintes colunas:
id (inteiro, chave primária, auto-incremento), 
cliente_id (inteiro, chave estrangeira que referencia a tabela clientes),
data_pedido (data) e total (decimal).*/

CREATE TABLE pedidos(
id SERIAL PRIMARY KEY,
data_pedido DATE,
total DECIMAL,
FOREIGN KEY ( id ) REFERENCES clientes(id)
);

--Alteração de Tipo de Coluna:
--Altere o tipo de dado da coluna total na tabela pedidos de decimal para numeric(10, 2).

ALTER TABLE pedidos
ALTER COLUMN total TYPE DECIMAL(10,2);

--Exclusão de Tabela:
--Exclua a tabela pedidos.

DROP TABLE pedidos;

/*Adicionar Restrições:
Na tabela produtos, adicione uma restrição para que
o valor do estoque seja maior ou igual a zero.
*/
CREATE TABLE produtos(
id SERIAL PRIMARY KEY,
nome_produto VARCHAR(30),
qtd_estoque NUMERIC CHECK(qtd_estoque>=0)
);

/*Criar e Excluir Tabela:
Crie uma tabela chamada categorias com as colunas 
id (inteiro, chave primária, auto-incremento) e 
nome (texto, não nulo, único). Em seguida, exclua a tabela.*/

CREATE TABLE categorias(
id SERIAL PRIMARY KEY,
nome VARCHAR(50)NOT NULL
);

DROP TABLE categorias;

--1. Inserção de Dados (INSERT)
/*Exercício 1: Crie uma tabela chamada alunos com as colunas
id, nome, idade e curso. Insira cinco registros nesta tabela.*/

CREATE TABLE alunos(
id SERIAL PRIMARY KEY,
nome VARCHAR(100),
idade INTEGER,
curso VARCHAR(50)
);

/*Exercício 2: Insira na tabela alunos um novo registro 
com o nome “João”, idade 20, e curso “Engenharia”.*/

INSERT INTO alunos(nome,idade,curso) VALUES ('João',20,'Engenharia');

/*Exercício 3: Insira múltiplos registros de uma vez na
tabela alunos, adicionando três novos alunos de diferentes cursos.*/

INSERT INTO alunos(nome,idade,curso) VALUES ('Thiago',25,'Biologia'),
('Lucas',18,'Matemática'),
('Luis',21,'Filosofia');

--2. Atualização de Dados (UPDATE)
--Exercício 4: Atualize a idade do aluno chamado “João” para 21 anos.

UPDATE alunos SET idade= 21 WHERE idade=25;

/*Exercício 5: Mude o curso de todos os alunos que 
estão cursando “Engenharia” para “Engenharia de Software”.*/

UPDATE alunos SET curso='Engenharia de Software' WHERE curso='Engenharia';

--Exercício 6: Aumente a idade de todos os alunos em 1 ano.

UPDATE alunos SET idade = idade +1;

--3. Deleção de Dados (DELETE)
--Exercício 7: Delete o aluno com id igual a 3 da tabela alunos.

DELETE FROM alunos WHERE id=3;

--Exercício 8: Delete todos os alunos que têm menos de 18 anos.

DELETE FROM alunos WHERE idade<=18;

/*Exercício 9: Delete todos os registros da tabela alunos
(sem excluir a tabela).*/

DELETE FROM alunos;

