CREATE DATABASE livraria;

USE livraria;

CREATE TABLE livros(
	livro VARCHAR(100),
    autor VARCHAR(100),
    sexo CHAR(1),
    paginas INT(5),
    editora VARCHAR(30),
    valor FLOAT(10,2),
    uf CHAR(2),	
	ano INT(4)
);

SELECT * FROM livros;

INSERT INTO LIVROS (livro, autor, sexo, paginas, editora, valor, uf, ano)
VALUES('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009);

INSERT INTO LIVROS (livro, autor, sexo, paginas, editora, valor, uf, ano) 
VALUES ('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);

INSERT INTO LIVROS (livro, autor, sexo, paginas, editora, valor, uf, ano) 
VALUES ('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);

INSERT INTO LIVROS (livro, autor, sexo, paginas, editora, valor, uf, ano) 
VALUES('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ',2018);

INSERT INTO LIVROS (livro, autor, sexo, paginas, editora, valor, uf, ano) 
VALUES ('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ',2019);

INSERT INTO LIVROS (livro, autor, sexo, paginas, editora, valor, uf, ano)  
VALUES('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);

INSERT INTO LIVROS (livro, autor, sexo, paginas, editora, valor, uf, ano)  
VALUES('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);

INSERT INTO LIVROS (livro, autor, sexo, paginas, editora, valor, uf, ano)  
VALUES('Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES',2011);

INSERT INTO LIVROS (livro, autor, sexo, paginas, editora, valor, uf, ano)  
VALUES('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS',2018);

INSERT INTO LIVROS (livro, autor, sexo, paginas, editora, valor, uf, ano)  
VALUES('O poder da mente','Clara Mafra','F',120,'Continental',56,'SP',2017);

-- ALTERACOES
ALTER TABLE livros ADD id INT NOT NULL; -- errei aqui
ALTER TABLE livros DROP COLUMN id;

ALTER TABLE livros ADD id INT;
ALTER TABLE livros ADD PRIMARY KEY(id);
ALTER TABLE livros MODIFY COLUMN id INT AUTO_INCREMENT;

ALTER TABLE `livraria`.`livros` 
CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT ,
ADD PRIMARY KEY (`id`);
;
-- 


SELECT livro, editora FROM livros;
SELECT livro, uf FROM livros WHERE sexo = 'M';

SELECT autor, sexo FROM livros WHERE sexo = 'M' AND (uf = 'SP' OR uf = 'RJ');

/* COUNT(*), GROUP BY, PERFORMANCE COM OPERADORES
LOGICOS */

/* CONTANDO OS REGISTROS DE UMA TABELA */

SELECT COUNT(*) AS 'QUANTIDADE DE REGISTROS' FROM livros;
SELECT sexo, COUNT(*) AS 'Registros por sexo' FROM livros GROUP BY sexo;

-- criacao banco FUNCIONARIOS

CREATE DATABASE exercicios_udemy;
USE exercicios_udemy;

CREATE TABLE funcionarios(
 idFuncionario integer,
      nome varchar(100),
      email varchar(200),
      sexo varchar(10),
      departamento varchar(100),
      admissao varchar(10),
      salario integer,
      cargo varchar(100),
      idRegiao int
      );
    
    
# mil linhas adicionadas...

SELECT COUNT(*) FROM funcionarios;
SELECT COUNT(*), departamento FROM funcionarios GROUP BY departamento ORDER BY 1;
SELECT COUNT(*), sexo FROM funcionarios GROUP BY sexo;



SELECT nome, email, departamento, sexo FROM funcionarios 
WHERE (departamento = 'Lar' AND sexo = 'Feminino')
OR
	(departamento = 'Filmes' AND sexo = 'Feminino');    
  
  
SELECT COUNT(*), departamento FROM funcionarios WHERE departamento = 'Jardim' GROUP BY departamento;  
SELECT COUNT(*), sexo FROM funcionarios WHERE sexo = 'Masculino' GROUP BY sexo;

SELECT * FROM funcionarios WHERE departamento = 'Jardim' AND sexo = 'Masculino';

-- filtrando valores nulos

SHOW DATABASES;
USE exercicios_udemy;

SELECT * FROM funcionarios;

insert into funcionarios values (1001,'Howard',null ,'Feminino','Bebês','11/7/2023',148687,'General Manager',3);

SELECT idFuncionario, nome FROM funcionarios WHERE email IS NULL;
SELECT idFuncionario, nome FROM funcionarios WHERE email IS NOT NULL;

-- fim

/* UTILIZANDO O UPDATE PARA ATUALIZAR VALORES */

UPDATE funcionarios SET email = 'zemane@gmail.com' WHERE idFuncionario = 1001;
SELECT * FROM funcionarios WHERE idFuncionario = 1001;

/*commit e rollback > voltam atrás no banco */

/* CLAUSULA DELETE */

SELECT COUNT(*) FROM funcionarios WHERE idFuncionario = 1001;
SELECT * FROM funcionarios WHERE idFuncionario = 1001;

SELECT COUNT(*) FROM funcionarios;

DELETE FROM funcionarios WHERE idFuncionario = 1001;
DELETE FROM funcionarios WHERE idFuncionario = 1001 AND email = 'zemane@gmail.com';

SELECT idFuncionario, nome, email FROM funcionarios WHERE idFuncionario = 1001 OR 
nome = 'Howard';

SELECT idFuncionario, nome, email FROM funcionarios WHERE idFuncionario = 1001 AND 
nome = 'Howard';

/* criando novo banco
/* CADINALIDADE */

/* QUEM DEFINE A CARDINALIDADE É A REGRA DE NEGOCIOS */

/* PRIMEIRO ALGARISMO - OBRIGATORIEDADE 
0 - NAO OBRIGATORIO
1 - OBRIGATORIO

SEGUNDO ALGARISMO - CARDINALIDADE
1 - MAXIMO DE UM
N - MAIS DE Um
*/

/* ENDERECO - OBRIGATORIO 
CADASTRO DE SOMENTE UM.

TELEFONE - NAO OBRIGATORIO
CADASTRO DE MAIS DE UM (OPCIONAL) /*

/*
CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE
REGISTROS */

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA
CARDINALIDADE N */


CREATE DATABASE comercio;
USE comercio;

CREATE TABLE cliente(
	idcliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    sexo ENUM('M', 'F')	 NOT NULL,
    email VARCHAR(50) UNIQUE,
    cpf VARCHAR(50) UNIQUE
    );
    
CREATE TABLE endereco(
	id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado CHAR(2) NOT NULL,
	id_cliente INT UNIQUE,
    
    FOREIGN KEY (id_cliente) REFERENCES cliente(idcliente)
    );
    
    CREATE TABLE telefone(
		id_telefone INT PRIMARY KEY AUTO_INCREMENT,
        tipo ENUM('Residencial', 'Comercial', 'Celular') NOT NULL,
        id_cliente INT,
        
        FOREIGN KEY (id_cliente) REFERENCES cliente(idcliente)
        );

DESC cliente;

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889'); 

SELECT * FROM cliente;


DESC endereco;
INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

-- MOSTRANDO ERRO DA CHAVE UNIQUE do 
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','CENTRO','SAO PAULO','SP',5);


SELECT * FROM endereco;

DESC telefone;

ALTER TABLE telefone ADD numero_telefone VARCHAR(45) NOT NULL;

ALTER TABLE telefone 
CHANGE COLUMN `numero_telefone` `numero_telefone` VARCHAR(45) NOT NULL AFTER tipo;


INSERT INTO TELEFONE VALUES(NULL,'Celular','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'Residencial','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'Celular','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'Comercial','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'Residencial','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'Celular','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'Celular','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'Comercial','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'Residencial','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'Celular','88687909',2);

SELECT * FROM telefone;

/* SELECAO, PROJECAO E JUNCAO */

/* PROJECAO -> É TUDO QUE VOCE QUER VER NA TELA */

SELECT NOW() AS data_atual;
SELECT 2 + 2 AS soma;
SELECT 2 + 2 AS soma, nome, NOW() AS data FROM cliente;

/* SELECAO -> É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
A CLAUSULA DE SELECAO É O WHERE
*/;

SELECT nome, sexo, email FROM cliente WHERE sexo = 'F';
DESC telefone;

SELECT numero_telefone, tipo FROM telefone WHERE tipo = 'Celular';

/* JUNCAO -> JOIN */

DESC cliente;
DESC endereco;

SELECT nome, email, idcliente FROM cliente;

SELECT id_cliente, bairro, cidade FROM endereco;

-- NAO USAR!!!	-- POIS WHERE É CLAUSULA DE SELECAO.
SELECT nome, sexo, bairro, cidade -- PROJECAO
FROM cliente, endereco -- ORIGEM
WHERE idcliente = id_cliente; -- SELECAO

SELECT nome, sexo, bairro, cidade  /* projecao */
FROM cliente /* origem */
	INNER JOIN endereco /* juncao */
	ON idcliente = id_cliente
WHERE sexo = 'M'; /* selecao */

DESC telefone;
DESC cliente;
DESC endereco;

select * FROM telefone;
select * from cliente;


SELECT nome, sexo, email, tipo, numero_telefone
FROM  cliente
	INNER JOIN telefone 
    ON idcliente = id_cliente;

SELECT cliente.nome, cliente.sexo, endereco.bairro, endereco.cidade, telefone.tipo, telefone.numero_telefone
FROM cliente
	INNER JOIN endereco
    ON cliente.idcliente = endereco.id_cliente
    INNER JOIN telefone
    ON cliente.idcliente = telefone.id_cliente;
    

SELECT c.nome, c.sexo, e.bairro, e.cidade, tel.tipo, tel.numero_telefone
FROM cliente c
	INNER JOIN endereco e
    ON c.idcliente = e.id_cliente
    INNER JOIN telefone tel
    ON c.idcliente = tel.id_cliente;

/*
	
	DML - DATA MANIPULATION LANGUAGE
	DDL - DATA DEFINITION LANGUAGE
	DCL - DATA CONTROL LANGUAGE
	TCL - TRANSACTION CONTROL LANGUAGE

*/

/* INSERT */

INSERT INTO CLIENTE VALUES(NULL,'PAULA','M',NULL,'77437493');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

SELECT * FROM CLIENTE;

/* FILTROS */

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

/* UPDATE */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

/* DELETE */ 

INSERT INTO CLIENTE VALUES(NULL,'XXX','M',NULL,'XXX');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

DELETE FROM CLIENTE WHERE IDCLIENTE = 8;

/* DDL -> DATA DEFINITION LANGUAGE */

CREATE TABLE produto(
	idproduto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(45) NOT NULL,
    preco INT,
	frete FLOAT(10,2) NOT NULL
    );
   
/* ALTER TABLE */
   
	-- CHANGE > MUDAR NOMES DE COLUNAS
   
ALTER TABLE produto CHANGE preco VALOR_UNITARIO INT NOT NULL;
DESC produto;

	-- MODIFY > MUDAR TIPOS DE COLUNA
    
ALTER TABLE produto MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

	-- ADICIONANDO COLUNAS

ALTER TABLE produto ADD peso FLOAT(10,2) NOT NULL;

ALTER TABLE produto 
DROP COLUMN peso;
	
    -- COLOCANDO EM ORDEM com AFTER E FIRST
    
ALTER TABLE produto 
ADD peso FLOAT(8,2) NOT NULL
AFTER nome_produto;
 
 
 ################################
 SHOW TABLES;
 /* EXERCICIOS DML */
 DESC funcionarios;
 
 SHOW DATABASES;
 USE comercio;
 SHOW TABLES;
 
INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

 SELECT * FROM cliente;
 ###
 SELECT * FROM endereco;
 
INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

 ####
DESC telefone;

ALTER TABLE telefone MODIFY COLUMN tipo ENUM('RES', 'CEL', 'COM'); -- errado aqui

ALTER TABLE `comercio`.`telefone` 
CHANGE COLUMN `tipo` `tipo` ENUM('RES', 'COM', 'CEL') NOT NULL ;


INSERT INTO TELEFONE VALUES(NULL,'Residencial','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'Celular','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'Celular','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'Celular','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'Comercial','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'Comercial','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'Comercial','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'Celular','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'Comercial','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'Celular','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'Residencial','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'Residencial','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'Residencial','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'Residencial','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'Comercial','44522578',20);
###############


DESC cliente;
DESC endereco;
DESC telefone;

SELECT * FROM telefone;
SELECT * FROM endereco;
SELECT * FROM cliente; 


SELECT * FROM cliente
INNER JOIN endereco
ON idcliente = id_cliente;

SELECT c.idcliente, c.nome, c.sexo, c.email, c.cpf,
		e.rua, e.bairro, e.cidade, e.estado,
        t.tipo, t.numero_telefone
FROM cliente c
	INNER JOIN endereco e
    ON c.idcliente = e.id_cliente
    INNER JOIN telefone t
    ON c.idcliente = t.id_cliente;
		

SELECT nome, sexo FROM cliente
WHERE sexo = 'M';

SELECT c.idcliente, c.nome, c.sexo, c.email, c.cpf,
		e.rua, e.bairro, e.cidade, e.estado,
        t.tipo, t.numero_telefone
FROM cliente c
	INNER JOIN endereco e
    ON c.idcliente = e.id_cliente
    INNER JOIN telefone t
    ON c.idcliente = t.id_cliente
    WHERE c.sexo = 'M';
    
/*ACERTAR OS CLIENTES COM SEXO ERRADO*/

SELECT * FROM cliente 
WHERE idcliente IN (12, 13, 18);


UPDATE cliente SET sexo = 'F' 
WHERE idcliente IN (12, 13, 18);

UPDATE cliente SET sexo = 'M'
WHERE idcliente = 15;

    

SELECT c.idcliente, c.nome, c.sexo, c.email, c.cpf,
		e.rua, e.bairro, e.cidade, e.estado,
        t.tipo, t.numero_telefone
FROM cliente c
	INNER JOIN endereco e
    ON c.idcliente = e.id_cliente
    INNER JOIN telefone t
    ON c.idcliente = t.id_cliente
    WHERE c.sexo = 'F';
    
 
SELECT COUNT(*) AS quantidade, sexo
FROM cliente
WHERE sexo = 'M' OR sexo = 'F'
GROUP BY sexo;


SELECT c.idcliente, c.sexo, c.nome, c.email, e.bairro, e.estado, t.tipo, t.numero_telefone
FROM cliente c
	INNER JOIN endereco e
    ON c.idcliente = e.id_cliente
    INNER JOIN telefone t
    ON c.idcliente = t.id_cliente
    WHERE (e.bairro = 'CENTRO' AND e.estado = 'RJ')
    AND c.sexo = 'F'
    AND t.tipo != 'Celular';



SELECT c.nome AS 'Nome Cliente', c.email AS 'E-mail Cliente',
		t.numero_telefone AS 'Numero do celular',
        e.estado AS 'Estado'
FROM cliente c
	INNER JOIN telefone t
    ON c.idcliente = t.id_cliente
    INNER JOIN endereco e
    ON c.idcliente = e.id_cliente
    WHERE e.estado = 'RJ' AND t.tipo = 'Celular';
    
-- FUNCOES
# IFNULL();

SELECT NOW();

SELECT c.nome, 
		IFNULL(c.email, "sem email"), 
		e.estado, 
		t.numero_telefone
FROM cliente c
INNER JOIN endereco e
ON c.idcliente= e.id_cliente
INNER JOIN telefone t
ON c.idcliente = t.id_cliente;

-- VIEWS

SELECT	c.nome, 
		c.sexo, 
		c.email, 
		t.tipo, 
		t.numero_telefone, 
		e.bairro, 
		e.cidade, 
		e.estado
FROM cliente c
INNER JOIN telefone t
ON c.idcliente = t.id_cliente
INNER JOIN endereco e
ON c.idcliente = e.id_cliente;

CREATE VIEW relatorio_completo AS 
SELECT	c.nome, 
		c.sexo, 
		c.email, 
		t.tipo, 
		t.numero_telefone, 
		e.bairro, 
		e.cidade, 
		e.estado
FROM cliente c
INNER JOIN telefone t
ON c.idcliente = t.id_cliente
INNER JOIN endereco e
ON c.idcliente = e.id_cliente;

SELECT nome, numero_telefone, bairro 
FROM relatorio_completo
WHERE bairro = "CENTRO";

-- MOSTRAR VIEWS
SHOW TABLES;

-- 
SHOW DATABASES;

-- APAGANDO VIEW;

DROP VIEW relatorio_completo;

-- DML em views , INSERT, DELETE, UPDATE.ALTER

INSERT INTO relatorio_completo VALUES(
"Andrea", "F", "ANDREA@UOL.COM.BR", "Celular", "1209323482936", "CENTRO", "VITORIA", "RS"
); -- NAO FUNCIONA INSERT EM JOIN COM VIEW, NEM DELETE 

-- APENAS UPDATE 
SELECT * FROM relatorio_completo;
UPDATE relatorio_completo SET nome = "JOSEF" WHERE numero_telefone = "56576876";

SELECT * FROM cliente;

CREATE TABLE jogadores(
	idjogador INT,
    nome VARCHAR(40),
    estado CHAR(2)
    );
    
INSERT INTO jogadores VALUES (1, "GUERREIRO", 'RS');
INSERT INTO jogadores VALUES (1, "GABIGOL", 'RJ');
INSERT INTO jogadores VALUES (1, "GANSO", 'SP');
INSERT INTO jogadores VALUES (1, "NENE", 'RS');
INSERT INTO jogadores VALUES (1, "LOVE", 'MG');

CREATE VIEW v_jogadores AS
SELECT nome, estado
FROM jogadores;

-- com tabelas sem join é possível DML com view

SELECT * FROM v_jogadores;

DELETE FROM V_JOGADORES
WHERE NOME = 'GUERREIRO';

INSERT INTO V_JOGADORES VALUES('GUERRERO','RS');

-- ORDER BY - ordena coluna por alguma delas

CREATE TABLE ALUNOS(
	NUMERO INT,
	NOME VARCHAR(30)
);

INSERT INTO ALUNOS VALUES(1,'JOAO');
INSERT INTO ALUNOS VALUES(1,'MARIA');
INSERT INTO ALUNOS VALUES(2,'ZOE');
INSERT INTO ALUNOS VALUES(2,'ANDRE');
INSERT INTO ALUNOS VALUES(3,'CLARA');
INSERT INTO ALUNOS VALUES(1,'CLARA');
INSERT INTO ALUNOS VALUES(4,'MAFRA');
INSERT INTO ALUNOS VALUES(5,'JANAINA');
INSERT INTO ALUNOS VALUES(1,'JANAINA');
INSERT INTO ALUNOS VALUES(3,'MARCELO');
INSERT INTO ALUNOS VALUES(4,'GIOVANI');
INSERT INTO ALUNOS VALUES(5,'ANTONIO');
INSERT INTO ALUNOS VALUES(6,'ANA');
INSERT INTO ALUNOS VALUES(6,'VIVIANE'); 

SELECT * FROM alunos;

SELECT * FROM alunos
ORDER BY numero;

SELECT * FROM alunos
ORDER BY 1;

SELECT * FROM alunos
ORDER BY 2;

/* ORDENANDO POR MAIS DE UMA COLUNA */

SELECT * FROM alunos
ORDER BY numero, nome;

SELECT NOME FROM ALUNOS
ORDER BY NUMERO, NOME;

-- ORDENANDO COM JOIN

SELECT	c.nome, 
		c.sexo, 
		IFNULL(c.email, "NULO") AS "email",
		t.tipo, 
		t.numero_telefone, 
		e.bairro, 
		e.cidade, 
		e.estado
FROM cliente c
INNER JOIN telefone t
ON c.idcliente = t.id_cliente
INNER JOIN endereco e
ON c.idcliente = e.id_cliente
ORDER BY 1;

#####




