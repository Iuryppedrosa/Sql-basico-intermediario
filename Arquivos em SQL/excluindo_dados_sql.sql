# EXCLUINDO DADOS.

SELECT * FROM produtos_compra;
SELECT * FROM receitas_medicas;

DELETE FROM receitas_medicas WHERE id = 2;
DELETE FROM produtos_compra WHERE id = 3; -- produtos_compra é FK na tabela receitas medicas, portanto
										-- tem q ser exluido la na tabela que está a FK primeiro.