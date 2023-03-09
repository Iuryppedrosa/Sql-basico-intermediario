# inserindo dados de teste

SELECT * FROM tipos_produtos;
SELECT * FROM fabricantes;
SELECT * FROM medicos;
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM compras;
SELECT * FROM produtos_compra;
SELECT * FROM receitas_medicas;

-- TIPOS PRODUTOS

INSERT INTO tipos_produtos (tipo) VALUES ('Remedios');
INSERT INTO tipos_produtos (tipo) VALUES ('Cosmeticos');
INSERT INTO tipos_produtos (tipo) VALUES ('Perfumaria');

-- FABRICANTES

INSERT INTO fabricantes (nome_fabricante) VALUES ('Roque');
INSERT INTO fabricantes (nome_fabricante) VALUES ('Vitalis');
INSERT INTO fabricantes (nome_fabricante) VALUES ('Palmolive');

-- MEDICOS

INSERT INTO medicos (nome_medico, crm) VALUES ('Alfredo Muniz', '12345SP');
INSERT INTO medicos (nome_medico, crm) VALUES ('Fernanda Silva', '1234MG');
INSERT INTO medicos (nome_medico, crm) VALUES ('Manuela Julieta', '43456SC');

-- CLIENTES 

INSERT INTO clientes (nome, endereco, telefone, cep, cidade, cpf) 
VALUES ('Jose', 'R. Manaus, n56', '32316098', '38408383', 'Uberlandia', '01243586799');

INSERT INTO clientes (nome, endereco, telefone, cep, cidade, cpf) 
VALUES ('Afonso', 'R. Almeida, n99', '52452345234', '12341234', 'Araguari', '785662341');

INSERT INTO clientes (nome, endereco, telefone, cep, cidade, cpf) 
VALUES ('Lucas', 'R. Cajau, n78', '23445243', '4567567', 'Uberaba', '845662345234');

-- PRODUTOS 

INSERT INTO produtos (designacao, preco_venda, nome_produto, 
composicao, id_tipo_produto, id_fabricante) VALUE ('Dores', '13.45', 'Dipirona', 'Quimico', 
1, 1);

INSERT INTO produtos (designacao, preco_venda, nome_produto, 
composicao, id_tipo_produto, id_fabricante) VALUE ('Limpeza', '1.50', 'Sabonete', 'Quimico', 
2, 2);

INSERT INTO produtos (designacao, preco_venda, nome_produto, 
composicao, id_tipo_produto, id_fabricante) VALUE ('Dermato', '32.20', 'Protetor Solar', 'Natural', 
2, 1);

-- COMPRAS

INSERT INTO compras (id_cliente, data_compra) VALUES (1, '2019-03-10');
INSERT INTO compras (id_cliente, data_compra) VALUES (2, '2019-04-15');
INSERT INTO compras (id_cliente, data_compra) VALUES (1, '2019-05-18');

-- PRODUTOS COMPRA 

INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (1, 1, 2);
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (1, 2, 3);
INSERT INTO produtos_compra (id_compra, id_produto, quantidade) VALUES (2, 3, 1);

-- Receitas Medicas

INSERT INTO receitas_medicas (id_produto_compra, id_medico, receita) VALUES (1, 1, 'receita1.pdf');
INSERT INTO receitas_medicas (id_produto_compra, id_medico, receita) VALUES (3, 2, 'receita2.pdf');

