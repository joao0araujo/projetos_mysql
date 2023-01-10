
-- PARTE 1 - CRIAÇÃO  DE TABELAS E ATRIBUTOS

-- A) CRIAÇÃO DE UM BANCO DE UMA LOCADORA.

CREATE DATABASE locadora;

USE locadora;

CREATE TABLE carros(
idcarros INT UNSIGNED NOT NULL AUTO_INCREMENT,
placa VARCHAR(45),
ano VARCHAR(45),
cor VARCHAR(45),
PRIMARY KEY(idcarros)
)

CREATE TABLE clientes(
idclientes INT UNSIGNED NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
cpf VARCHAR(45),
datanascimento DATE,
PRIMARY KEY(idclientes)
)


CREATE TABLE telefones(
idtelefones INT UNSIGNED NOT NULL AUTO_INCREMENT,
numero VARCHAR(45),
idclientes INT UNSIGNED NOT NULL,
PRIMARY KEY(idtelefones),
FOREIGN KEY(idclientes) REFERENCES clientes(idclientes)
)

CREATE TABLE aluguel(
dataaluguel VARCHAR(45),
datafinal DATE,
idcarros INT UNSIGNED NOT NULL,
idclientes INT UNSIGNED NOT NULL,
FOREIGN KEY(idcarros) REFERENCES carros(idcarros),
FOREIGN KEY(idclientes) REFERENCES clientes(idclientes)
)

-- 1) ALTERE O ATRIBUTO PLACA (CARRO) PARA VARCHAR(12) OBRIGATÓRIO E ÚNICO

ALTER TABLE carros MODIFY placa VARCHAR(12) NOT NULL UNIQUE;

-- 2) ADICIONE O ATRIBUTO MODELO PARA CARRO

ALTER TABLE carros ADD modelo VARCHAR(45);

-- 3) ALTERE O ATRIBUTO ANO PARA YEAR

ALTER TABLE carros MODIFY ano YEAR;

-- 4) REMOVA O ATRIBUTO ADICIONADO NA QUESTAO 2

ALTER TABLE carros DROP modelo;

-- 5) ALTERE O ATRIBUTO DATAALUGUEL PARA DATE NOT NULL

ALTER TABLE aluguel MODIFY dataaluguel DATE NOT NULL;

-- 6) ADICIONE O ATRIBUTO VALOR DOUBLE PARA O ALUGUEL

ALTER TABLE aluguel ADD valor DOUBLE;

-- 7) ALTERE O ATRIBUTO CPF PARA VARCHAR(11) UNIQUE

ALTER TABLE clientes MODIFY cpf VARCHAR(11) UNIQUE;

-- 8) RENOMEIE O NOME DO ATRIBUTO DATANASCIMENTO PARA DATADENASCIMENTO TIPO DATE

ALTER TABLE clientes CHANGE datanascimento datadenascimento DATE;

-- 9) ADICIONE O ATRIBUTO CNH (CARTEIRA DE HABILITAÇÃO) PARA O CLIENTE

ALTER TABLE clientes ADD cnh VARCHAR(15);

-- 10) ADICIONE O ATRIBUTO DDD PARA TELEFONE 

ALTER TABLE telefones ADD ddd VARCHAR(3);


-- PARTE 2 - INSERÇÃO DE DADOS

-- 1) INSIRA  10 CARROS COM TODOS OS ATRIBUTOS 

INSERT INTO carros(placa, ano, cor) VALUES ('OGL-1547', 2014, 'branco'), ('TDO-9035', 2008, 'preto'), 
('FTD-2387', 2016, 'prata'), ('OTG-5748', 2013, 'preto'), ('LOL-4194', 2018, 'azul'),
('FFA-3128', 2012, 'branco'), ('GGH-7319', 2007, 'vermelho'), ('KFC-1234', 2019, 'preto'), 
('DDT-9952', 2010, 'prata'), ('QWD-0282', 2018, 'preto');

-- 2 ) INSIRA  6 CLIENTES 

INSERT INTO clientes(nome, datadenascimento, cpf, cnh) VALUES ('Marcos Santos', '2001-05-20', '1234-5', '95348290'), 
('Marilia Nery', '1982-04-11', '9876-5', '34592172'), ('Patricia Leite', '1994-07-10', '6104-2', '02381942'), 
('Gustavo Silva', '1990-06-24', '9101-5', '88314567'), ('Ana Costa', '1998-01-05', '0271-5', '37814925'),
('Tiago Campos', '2000-12-15', '4931-8', '99317204');

-- 3) INSIRA 2 TELEFONES PARA CADA CLIENTE CADASTRADO

INSERT INTO telefones(numero, ddd, idclientes) VALUES ('8567-0045', '71', 1), ('8233-9145', '71', 1),
('9876-3155', '74', 2), ('8852-7180', '74', 2), ('8201-8320', '75', 3), ('9150-1569', '75', 3),
('8798-0841', '71', 4), ('8102-0122', '71', 4), ('9430-5097', '71', 5), ('8412-2515', '71', 5),
('8107-1195', '71', 6), ('9921-4503', '71', 6);

-- 4) INSIRA 10 ALUGUÉIS DE CARROS POR CLIENTES (TABELA ALUGUEL)

INSERT INTO aluguel(dataaluguel, datafinal, valor, idcarros, idclientes) VALUES 
('2018-05-21', '2018-06-21', 2200, 1, 4), ('2019-08-01', '2019-10-01', 5000, 2, 1),
('2020-01-05', '2020-02-08', 2800, 4, 6), ('2018-03-18', '2018-04-19', 2600, 8, 3),
('2017-05-09', '2017-05-21', 1200, 6, 5), ('2016-08-20', '2016-09-30', 3000, 9, 4),
('2019-11-03', '2019-12-03', 2000, 7, 2), ('2020-03-10', '2020-04-11', 2300, 1, 5),
('2018-06-07', '2018-07-07', 2500, 5, 1), ('2017-09-20', '2017-10-20', 2400, 3, 6);

-- 5) REMOVA O ÚLTIMO TELEFONE INFORMADO

DELETE FROM telefones WHERE idtelefones=12;

-- 6) ALTERE A DATA DO PENULTIMO ALUGUEL REGISTRADO PARA 30/06/2021

UPDATE aluguel SET dataaluguel='2021-06-30', datafinal='2021-07-30' 
WHERE idcarros=5 AND idclientes=1 AND dataaluguel='2018-06-07';

-- 7) ALTERE OS DADOS DO TERCEIRO CLIENTE PARA O NOME DE UM DOS SEUS AVÓS

UPDATE clientes SET nome='Manoel Araujo' WHERE idclientes=3;

-- 8)  INSIRA UM ALUGUEL PARA O PRIMEIRO CARRO CADASTRADO E O ÚLTIMO CLIENTE COM A DATA DE HOJE

INSERT INTO aluguel(dataaluguel, datafinal, valor, idcarros, idclientes) VALUES 
('2021-06-08', '2021-07-08', 2500, 1, 6);

-- 9) REMOVA O PRIMEIRO TELEFONE CADASTRADO

DELETE FROM telefones WHERE idtelefones=1;

-- 10) INSIRA 2 NOVOS CLIENTES

INSERT INTO clientes(nome, cpf, cnh) VALUES ('Mauricio Pinheiro', '1995-03-28', '5691-1', '16270024'), 
('Flora Santana', '1992-10-29', '0507-9', '29850845');


-- PARTE 3 -  SELEÇÃO DE DADOS

-- 1) MOSTRE OS DADOS DOS CLIENTES ORDENADOS PELO NOME

SELECT nome, cpf, cnh FROM clientes ORDER BY nome;

-- 2) MOSTRE  O TOTAL DOS CARROS AGRUPADOS PELA COR

SELECT cor, COUNT(idcarros) AS totalcarros FROM carros GROUP BY cor;

-- 3) MOSTRE O TOTAL DE ALUGUEIS POR CLIENTES

SELECT idclientes, COUNT(dataaluguel) AS totalaluguel FROM aluguel GROUP BY idclientes;

-- 4) MOSTRE OS CLIENTES QUE NUNCA ALUGARAM CARROS

SELECT idclientes FROM clientes WHERE idclientes NOT IN (SELECT idclientes FROM aluguel) ORDER BY idclientes;

-- 5) MOSTRE OS 3 CLIENTES MAIS VELHOS

SELECT nome, datadenascimento FROM clientes ORDER BY datadenascimento LIMIT 3;

-- 6) MOSTRE OS CLIENTES CUJO NOME EM ALGUMA PARTE TENHA A LETRA "O"

SELECT nome, cpf FROM clientes WHERE nome LIKE '%O%';

-- 7) MOSTRE O VALOR TOTAL DE ALUGUEL POR CARRO

SELECT idcarros, SUM(valor) as valoraluguel FROM aluguel GROUP BY idcarros;

-- 8) MOSTRE O VALOR TOTAL DE ALUGUEL POR DATA DO ALUGUEL

SELECT dataaluguel, SUM(valor) as valdataluguel FROM aluguel GROUP BY dataaluguel;







