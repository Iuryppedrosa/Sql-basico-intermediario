# REALIZANDO CONSULTAS SIMPLES e COMPLEXAS 
-- tipos_produtos


SELECT * FROM tipos_produtos;
SELECT id, tipo FROM tipos_produtos;
SELECT tipo FROM tipos_produtos;
SELECT tipo, id FROM tipos_produtos;
SELECT id, tipo FROM tipos_produtos ORDER BY id DESC;
SELECT id, tipo FROM tipos_produtos ORDER BY tipo ASC;

-- fabricantes

SELECT * FROM fabricantes;

-- medicos
SELECT * FROM medicos;

-- clientes

SELECT * FROM clientes;

-- compras

SELECT * FROM compras;

SELECT c.id, c.id_cliente AS 'id_tabela_compras', cl.nome, c.data_compra FROM compras AS c, clientes AS cl
WHERE c.id_cliente = cl.id;

-- produtos e compras 

SELECT * FROM produtos_compra;
SELECT * FROM produtos_compra WHERE	quantidade > 2;

-- receitas medicas
SELECT * FROM receitas_medicas;

# REALIZANDO CONSULTAS COMPLEXAS 
-- compras 
-- trazer compras:
SELECT * FROM compras;

-- colocar nome dos clientes nas compras;
SELECT c.id AS 'id_compra', cl.nome AS 'nome_cliente', c.data_compra FROM compras AS c, clientes AS cl
WHERE c.id_cliente = cl.id;


-- produtos compras
SELECT * FROM produtos_compra;


SELECT cp.id AS 'Compra', cl.nome AS 'cliente',
SUM(pd.preco_venda * pc.quantidade) AS 'Total'
FROM produtos_compra AS pc, compras AS cp, produtos AS pd, clientes AS cl
WHERE cp.id = pc.id_compra 
AND pd.id = pc.id_produto 
AND cp.id_cliente = cl.id
GROUP BY cp.id;
