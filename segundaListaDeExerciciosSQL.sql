CREATE TABLE categorias(
 id_categoria SERIAL PRIMARY KEY,
 nome_categoria VARCHAR (50) NOT NULL
 );
 
CREATE TABLE produtos (
id_produto SERIAL PRIMARY KEY,
nome_produto VARCHAR NOT NULL,
preco NUMERIC NOT NULL,
categoria_id INTEGER REFERENCES categorias(id_categoria)
);

CREATE TABLE estoque(
id_estoque SERIAL PRIMARY KEY,
produto_id INTEGER REFERENCES produtos(id_produto),
quantidade_estoque INTEGER NOT NULL
);

INSERT INTO categorias(nome_categoria) VALUES('Esportes');--1
INSERT INTO categorias(nome_categoria) VALUES('Livraria');--2
INSERT INTO categorias(nome_categoria) VALUES('Vestuário');--3
INSERT INTO categorias(nome_categoria) VALUES('Ferrmentas');--4
INSERT INTO categorias(nome_categoria) VALUES('Cama e Mesa');--5
INSERT INTO categorias(nome_categoria) VALUES('Jardinagem');--6

/*comando para alterar nome dos atributos 
ALTER TABLE produtos RENAME nome TO nome_produto;
ALTER TABLE estoque RENAME quatidade TO quantidade_estoque;
*/

--Desafio 1: Inserir Dados

INSERT INTO estoque(produto_id,quantidade_estoque) VALUES
(1,15),(2,5),(3,30),(4,0),
(5,10),(6,25),(7,30),(8,11),(9,22),
(10,50),(11,35),(12,31),(13,22),
(14,10),(15,21),(16,11),
(17,20),(18,17),(19,30),
(20,32),(21,29),(22,0);
SELECT * FROM produtos;

INSERT INTO produtos(nome_produto,preco,categoria_id) VALUES
('Magueira de jardim',200,6),
('Soprador de folha',600,6),
('Tesoura',50,6)
INSERT INTO produtos(nome_produto,preco,categoria_id) VALUES
('Toalha de banho',85,5),
('Toalha de rosto',40,5),
('Lençois Grandes Marcas',150,5);
INSERT INTO produtos(nome_produto,preco,categoria_id) VALUES
('Chave de roda',45,4),
('Alicate Universal',55,4),
('Chave de fenda',20,4)
INSERT INTO produtos(nome_produto,preco,categoria_id) VALUES 
('Calça Feminina',100,3),
('Calça Masculina',100,3),
('Blusa Feminina',180,3),
('Camisa Masculina',50,3);

INSERT INTO produtos(nome_produto,preco,categoria_id) VALUES
('Livro Auto Ajuda',65,2),
('Apostila de SQL',120,2),
('Biblia',150,2),
('Palavras cruzadas',5,2),
('Mangas',3,2);

INSERT INTO produtos(nome_produto,preco,categoria_id) VALUES('Bola de futebol',25,1);
INSERT INTO produtos(nome_produto,preco,categoria_id) VALUES('Bola de basquet',50,1),
('Bola de tenis de mes',10,1),
('Bola de boliche','80','1');

/*Desafio 2: Consulta de Produtos
Escreva uma consulta para exibir o nome,
preço e categoria de todos os produtos.*/

SELECT
--NOME DAS TABELAS.COLUNAS
produtos.nome_produto,produtos.preco,
categorias.nome_categoria AS categorias --ALIAS
FROM produtos--PRIMEIRA TABELA
INNER JOIN categorias --SEGUNDA TABELA
on produtos.categoria_id=categorias.id_categoria;--CAMPOS RELACIONADOS

/*Desafio 3: Atualização de Preço
Atualizar o preço de um produto específico 
na tabela de Produtos.*/
--COMANDO--TABELA
  UPDATE produtos 
-- ATRIBUTO E VALOR ATRIBUIDO
  SET preco=5800
--E DIZER O VALOR
  WHERE id_produto=6;
--SELECT SO PRA MOSTRAR A MUDAÇA
  SELECT * FROM estoque;
--TESTE UPDATE  
UPDATE estoque SET quantidade_estoque=0 WHERE id_estoque=8
/*Desafio 4: Contagem de Categorias
Calcule quantas categorias diferentes existem na tabela Categoria.*/ 
 --SELECT CONTAR TODAS LINHAS --AS ALIAS -- DA TABELA EXPECIFICADA
   SELECT COUNT(*) AS total_categorias FROM categorias

/*Desafio 5: Estoque Total
Calcule a quantidade total de produtos em estoque.*/

--SELECT SOMA(COLUNA A SE SOMADA)--APELIDO-- TABELA ONDE ESTA A COLUNA
   SELECT SUM(quantidade_estoque) AS total_geral_estoque FROM estoque

/*Desafio 6 (Bônus): Produtos Esgotados
Lista os produtos que estão completamente esgotados
(quantidade em estoque igual a zero).*/
	
	SELECT produtos.nome_produto, estoque.quantidade_estoque
	AS "produtos estoque zerados"
	FROM produtos
	INNER JOIN estoque
	ON id_produto=id_estoque
	WHERE quantidade_estoque=0

/*Desafio 7 (Bônus): Preço Médio por Categoria
Calcule o preço médio dos produtos para cada categoria.*/


	SELECT 
	--2ºdeclarei colunas e Alias juntamente com a função média no select
	c.nome_categoria AS Categoria, AVG(p.preco) AS "Preço Méido"
	--1º coloquei os alias p produtos c categorias
	FROM produtos p 
	INNER JOIN categorias c 
	--3º coloquei o relacionamento das tabelas onde estão as inf que preciso
	ON p.id_produto=c.id_categoria
	--4º agrupar os resultados. so sei que tem que usar mas não entendi porque
	GROUP BY c.nome_categoria;


/*Desafio 8 (Bônus): Produtos em Estoque Baixo
Listar os produtos que possuem uma quantidade em estoque menor do que
um valor específico*/

 SELECT p.nome_produto AS Produto, e.quantidade_estoque AS Estoque
 FROM produtos p
 INNER JOIN estoque e
 ON p.id_produto=e.id_estoque
 ORDER BY e.quantidade_estoque ASC;

/*Desafio 9 (Bônus): Produtos por Categoria
Exiba o nome da categoria e a quantidade de produtos nela para 
cada categoria existente.*/

---AINDA NÃO ENTENDI DIREITO...

SELECT c.nome_categoria AS "Categoria", COUNT(p.id_produto) AS "Número de Produtos"
FROM categorias c
LEFT JOIN produtos p 
ON c.id_categoria = p.categoria_id
GROUP BY c.nome_categoria

/*Desafio 10 (Bônus): Detalhes do Estoque
Crie uma consulta que mostre o nome do produto, a quantidade em estoque e
o nome da categoria para todos os produtos..*/

SELECT p.nome_produto, e.quantidade_estoque, c.nome_categoria
FROM produtos p
JOIN estoque e
ON e.produto_id = p.id_produto
JOIN categorias c
ON p.categoria_id = c.id_categoria