
-- 1 Crie uma procedure que insira um dado de cliente.

delimiter $$

CREATE PROCEDURE InsereCliente(pessoanome VARCHAR(45), pessoatelefone VARCHAR(45)) 
BEGIN 

INSERT INTO cliente(nome, telefone) VALUES (pessoanome, pessoatelefone);

END

$$

CALL InsereCliente('Vitor Costa', '156789');



-- 2 Crie uma procedure que insira uma venda

delimiter $$

CREATE PROCEDURE InsereVenda(datav DATE, totalv FLOAT, idcli INT) 
BEGIN

	INSERT INTO venda(DATA, total, idcliente) VALUES (datav, totalv, idcli);
	
END

$$

CALL InsereVenda('2016-08-07', 80, 13);



-- 3 Crie uma procedure que atualize os dados de uma venda

delimiter $$

CREATE PROCEDURE AtualizaVenda(dataven DATE, totalven FLOAT, idcl INT, idven INT) 
BEGIN

	UPDATE venda SET DATA = dataven, total= totalven, idcliente= idcl WHERE idvenda= idven;

END

$$

CALL AtualizaVenda('2018-08-02', 120, 13, 23);



-- 4 Crie uma procedure que apague um cliente

delimiter $$

CREATE PROCEDURE DeletaCliente(idcli INT) 
BEGIN

	DELETE FROM cliente WHERE idcliente= idcli;

END

$$

CALL DeletaCliente(7);



-- 5 Crie uma procedure que receba o nome de um cliente e mostre os dados relativos as suas vendas

delimiter $$

CREATE PROCEDURE NomeVenda (nomeven VARCHAR(45)) 
BEGIN

	SELECT venda.`data`, venda.total, cliente.idcliente, cliente.nome FROM venda 
	INNER JOIN cliente ON venda.idcliente= cliente.idcliente WHERE cliente.nome=nomeven;

END

$$


CALL NomeVenda('Vitor Costa');



-- 6 Crie uma procedure que receba o nome de uma editora e mostre o nome dos autores que escreveram livros editados por ela.

delimiter $$

CREATE PROCEDURE NomeEditora(nomeed VARCHAR(45)) 
BEGIN

	SELECT autor.nome AS nomeautor, editora.nome AS nomeeditora FROM editora 
	INNER JOIN livro ON editora.ideditora= livro.ideditora INNER JOIN escreve ON livro.idlivro=escreve.idlivro 
	INNER JOIN autor ON escreve.idautor=autor.idautor WHERE editora.nome= nomeed;

END

$$


CALL NomeEditora('Record')



-- 7 Crie uma procedure que receba duas datas e mostre o titulo dos livros vendidos naquele período.

delimiter $$ 

CREATE PROCEDURE DataVendaLi(dataini DATE, datafim DATE) 
BEGIN

	SELECT livro.titulo, venda.`data` FROM livro INNER JOIN itens_da_venda AS iv ON livro.idlivro= iv.idlivro 
	INNER JOIN venda ON iv.idvenda= venda.idvenda WHERE venda.`data` BETWEEN dataini AND datafim;

END

$$


CALL DataVendaLi('2012-01-01', '2012-06-06');

