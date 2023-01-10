
-- 1 Mostre os dados dos autores e seus livros

CREATE VIEW autorlivro as SELECT autor.idautor, autor.nome, livro.titulo, livro.idgenero, 
livro.idlivro, livro.ideditora FROM autor LEFT JOIN escreve ON autor.idautor = escreve.idautor 
INNER JOIN livro ON escreve.idlivro = livro.idlivro;

-- 2 Mostre os dados das vendas e seus clientes

CREATE VIEW vendacliente AS SELECT cliente.nome, cliente.idcliente, venda.idvenda, 
venda.`data`, venda.idcliente AS idclientevenda FROM venda 
INNER JOIN cliente ON venda.idcliente = cliente.idcliente;

-- 3 Mostre o total de livros por editora

CREATE VIEW editoralivro AS SELECT editora.ideditora, editora.nome, 
count(livro.idlivro) AS quantidadelivro, livro.idgenero, livro.ideditora AS ideditoralivro FROM editora 
LEFT JOIN livro ON editora.ideditora = livro.ideditora GROUP BY editora.ideditora;

-- 4 Mostre os dados de um livro com seu genero e editora

CREATE VIEW dadoslivro as SELECT livro.idlivro, livro.titulo, livro.preco, genero.descricao, editora.nome, 
genero.idgenero, editora.ideditora FROM livro INNER JOIN editora ON livro.ideditora = editora.ideditora 
INNER JOIN genero ON livro.idgenero = genero.idgenero;

-- 5 Mostre os dados de uma venda e os itens dela

CREATE VIEW vendalivro AS SELECT venda.idvenda, venda.`data`, venda.total, 
itens_da_venda.idlivro, livro.titulo, livro.idgenero, livro.ideditora, venda.idcliente FROM venda 
LEFT JOIN itens_da_venda ON venda.idvenda = itens_da_venda.idvenda 
INNER JOIN livro ON itens_da_venda.idlivro = livro.idlivro ORDER BY venda.idvenda;


-- 6 Mostre os dados dos livros com seus respectivos autores

SELECT livro.idlivro, livro.titulo, livro.preco, autorlivro.nome, autorlivro.idautor FROM livro 
INNER JOIN autorlivro ON livro.idlivro = autorlivro.idlivro;

-- 7 Mostre os livros que estiveram em vendas, com os dados de sua editora

SELECT DISTINCT livro.idlivro, livro.titulo, editora.ideditora, editora.nome FROM livro 
INNER JOIN vendalivro ON livro.idlivro = vendalivro.idlivro 
INNER JOIN editora ON vendalivro.ideditora = editora.ideditora;

-- 8 Mostre os titulos de livros comprados por clientes

SELECT livro.titulo, cliente.nome FROM livro INNER JOIN vendalivro ON livro.idlivro=vendalivro.idlivro 
INNER JOIN cliente ON vendalivro.idcliente = cliente.idcliente;

-- 9 Mostre em quantas editoras diferentes (total) cada autor publicou

SELECT autor.idautor, autor.nome, COUNT(DISTINCT editora.ideditora) AS totaleditora FROM autor 
INNER JOIN autorlivro AS autorview ON autor.idautor = autorview.idautor 
INNER JOIN editora ON autorview.ideditora = editora.ideditora GROUP BY autor.idautor;

-- 10 Mostre os gêneros literários mais vendidos

 SELECT genero.idgenero, genero.descricao, COUNT(itens_da_venda.idlivro) AS totalporgenero FROM genero 
 INNER JOIN livro ON genero.idgenero = livro.idgenero
 INNER JOIN itens_da_venda ON livro.idlivro = itens_da_venda.idlivro 
 GROUP BY genero.idgenero ORDER BY totalporgenero DESC;




