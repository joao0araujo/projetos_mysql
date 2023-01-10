
-- 1. Mostre o total de filmes que um ator participou

SELECT ator.idator, ator.primeiro_nome, COUNT(filme.idfilme) AS totalfilmes FROM ator 
LEFT JOIN filme_ator ON ator.idator = filme_ator.idator 
LEFT JOIN filme ON filme_ator.idfilme = filme.idfilme GROUP BY ator.idator;


-- 2. Mostre o preço de aluguel médio de um filme, por idioma

SELECT idioma.ididioma, idioma.nome, AVG(filme.preco_da_locacao) AS mediapreço FROM idioma 
INNER JOIN filme ON idioma.ididioma = filme.ididioma GROUP BY idioma.ididioma;


-- 3. Mostre o total de itens de inventário de cada loja

SELECT loja.idloja, COUNT(inventario.idfilme) AS inventariofilme FROM inventario 
LEFT JOIN loja ON inventario.idloja = loja.idloja GROUP BY loja.idloja;

-- 4. Mostre  o valor total pago para cada loja

SELECT loja.idloja, SUM(pagamento.valor) AS totalpagamento FROM loja 
INNER JOIN funcionario ON loja.idloja = funcionario.idloja 
INNER JOIN pagamento ON funcionario.idfuncionario = pagamento.idfuncionario GROUP BY loja.idloja;


-- 5. Mostre os dados de um cliente e para aquele que pagou por aluguéis, os dados do pagamento

SELECT cliente.idcliente, cliente.primeiro_nome, cliente.ultimo_nome, 
pagamento.pagamento_id, pagamento.valor, pagamento.data_de_pagamento FROM cliente 
LEFT JOIN pagamento ON cliente.idcliente = pagamento.idcliente;


-- 6. Mostre as categorias e para aquelas que tem filmes, os dados dos filmes

SELECT categoria.idcategoria, categoria.nome, filme.idfilme, filme.titulo, filme.duracao_do_filme FROM categoria
LEFT JOIN filme_categoria ON categoria.idcategoria = filme_categoria.idcategoria 
INNER JOIN filme on filme_categoria.idfilme = filme.idfilme;


-- 7. Mostre os idiomas, e para aqueles que tem filmes, o título, preço de locação e o ano de lançamento

SELECT idioma.ididioma, idioma.nome, filme.titulo, filme.preco_da_locacao, filme.ano_de_lancamento FROM idioma 
LEFT JOIN filme ON idioma.ididioma = filme.ididioma;

-- 8. Mostre as cidades de clientes que alugaram filmes, sem repetição

SELECT DISTINCT cidade.idcidade, cidade.cidade FROM cidade INNER JOIN endereco ON cidade.idcidade= endereco.idcidade 
INNER JOIN cliente ON cliente.idendereco= endereco.idendereco
INNER JOIN pagamento ON cliente.idcliente = pagamento.idcliente;

