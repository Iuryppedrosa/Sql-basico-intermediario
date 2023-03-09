# Atualizando Dados

SELECT * FROM tipos_produtos;
UPDATE tipos_produtos SET tipo = 'Bijoterias' WHERE id = 3;

SELECT * FROM produtos;
UPDATE produtos SET preco_venda = '4.16', id_tipo_produto = 1, id_fabricante = 1 WHERE id = 2;

SELECT * FROM produtos_compra;