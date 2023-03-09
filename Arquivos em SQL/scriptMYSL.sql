-- SELECT #DML

SELECT * FROM tipos_produto;
SELECT id, descricao FROM tipos_produto;
SELECT * FROM produtos;
SELECT id, descricao FROM tipos_produto WHERE id > 2;
SELECT id, descricao, preco, id_tipo_produto FROM produtos WHERE preco > 1500;
SELECT id, preco, descricao FROM produtos WHERE descricao = 'Macbook';
SELECT p.id AS 'qualquernome', p.descricao AS descr, p.preco AS pc, 
p.id_tipo_produto AS id_tp FROM produtos AS p;


SELECT p.id, p.descricao, p.preco, tp.descricao AS 'Tipo do Produto' FROM produtos AS p, tipos_produto AS tp
WHERE p.id_tipo_produto = tp.id;


-- INSERT

INSERT INTO tipos_produto (descricao) VALUES ('relogio');
INSERT INTO tipos_produto (descricao) VALUES ('Computadores Desktop');
INSERT INTO tipos_produto (descricao) VALUES ('Impressora');
INSERT INTO tipos_produto (descricao, peso_maximo) VALUES ('Televisao', 350);
INSERT INTO tipos_produto (descricao, peso_maximo) VALUES ('Acessorio', 350);




INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('relogio', 1500, 2);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Hp Jato', 2000, 4);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Dell', 5000, 3);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Macbook', 8000, 1);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Mouse', '120', 1);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Laptop', '1800', 1);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Impr. Jato Tinta', '300', 2);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Impr. Laser', '500', 2);
INSERT INTO produtos (descricao, preco, id_tipo_produto) VALUES ('Notebook', '1200', 1);

-- UPDATE 
# nunca esquecer de filtrar o registro com WHERE!!!!!! 

UPDATE `secao03`.`produtos` SET `descricao` = 'Apple Watch' WHERE (`id` = '1');
UPDATE `secao03`.`tipos_produto` SET `descricao` = 'Relogio' WHERE (`id` = '2');
UPDATE `secao03`.`tipos_produto` SET `descricao` = 'Notebook' WHERE (`id` = '1');
UPDATE produtos SET id_tipo_produto = 3 WHERE id = 4;
UPDATE produtos SET descricao = 'Notebook DELL', preco = '3000' WHERE id = 3;
UPDATE tipos_produto SET peso = 'Notebook DELL', preco = '3000' WHERE id = 3;
UPDATE tipos_produto SET peso_maximo = '250' WHERE id > 1;
UPDATE produtos SET id_tipo_produto = 4 WHERE id = 8;
UPDATE produtos SET id_tipo_produto = 6 WHERE id = 5;
UPDATE produtos SET id_tipo_produto = 1 WHERE id = 4;







-- DELETE, apagando uma linha na tabela
# nunca esquecer de filtrar o registro com WHERE!!!!!! 

DELETE FROM produtos WHERE id = 9;

-- ALTER TABLE

ALTER TABLE tipos_produto ADD peso DECIMAL(8,2);
ALTER TABLE tipos_produto RENAME COLUMN peso TO peso_maximo;
ALTER TABLE `secao03`.`tipos_produto` CHANGE COLUMN `peso_maximo` `peso_maximo` DECIMAL(8,2) NOT NULL;

-- 


