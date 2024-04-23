CREATE VIEW View_Produtos_Marcas AS 
SELECT 
    p.prd_id,
    p.prd_nome AS Produto,
    p.prd_qtd_estoque AS Quantidade_Estoque,
    p.prd_estoque_min AS Estoque_Minimo,
    p.prd_data_fab AS Data_Fabricacao,
    p.prd_perecivel AS Perecivel,
    p.prd_valor AS Valor,
    m.mrc_nome AS Marca,
    m.mrc_nacionalidade AS Nacionalidade_Marca
FROM Produtos p
JOIN Marcas m ON p.prd_marca_id = m.mrc_id;
SELECT*from View_Produtos_Marcas; -- select para visualizar a view

-- view criada para visualizar produtos e fornecedores
CREATE VIEW View_Produtos_Fornecedores AS 
SELECT 
    p.prd_id,
    p.prd_nome AS Produto,
    p.prd_qtd_estoque AS Quantidade_Estoque,
    p.prd_estoque_min AS Estoque_Minimo,
    p.prd_data_fab AS Data_Fabricacao,
    p.prd_perecivel AS Perecivel,
    p.prd_valor AS Valor,
    f.frn_nome AS Nome_Fornecedor,
    f.frn_email AS Email_Fornecedor
FROM Produtos p
JOIN Fornecedores f ON p.prd_marca_id = f.frn_id;

SELECT*FROM View_Produtos_Fornecedores; -- select para visualizar a view

-- view para visualizar todos os produtos, marcas e fornecedores.
CREATE OR REPLACE  VIEW View_Produtos_Fornecedores_Marcas AS
SELECT distinct
    p.prd_id,
    p.prd_nome AS Produto,
    p.prd_qtd_estoque AS Quantidade_Estoque,
    p.prd_estoque_min AS Estoque_Minimo,
    p.prd_data_fab AS Data_Fabricacao,
    p.prd_perecivel AS Perecivel,
    p.prd_valor AS Valor,
    m.mrc_nome AS Marca,
    m.mrc_nacionalidade AS Nacionalidade_Marca,
    f.frn_nome AS Fornecedor,
    f.frn_email AS Email_Fornecedor
FROM Produtos p
JOIN Marcas m ON p.prd_marca_id = m.mrc_id
JOIN Produto_fornecedor pf ON p.prd_id = pf.pf_prod_id
JOIN Fornecedores f ON pf.pf_forn_id = f.frn_id;
SELECT*from View_Produtos_Fornecedores_Marcas; -- comando select para visualizar a view

-- view criada para visualizar os produtos cujo o estoque esta abaixo do minimo
CREATE VIEW Produtos_Estoque_min AS
SELECT 
    prd_id,
    prd_nome AS Produto,
    prd_qtd_estoque AS Quantidade_Estoque,
    prd_estoque_min AS Estoque_Minimo
FROM Produtos
WHERE prd_qtd_estoque < prd_estoque_min;
SELECT*from Produtos_Estoque_min;

-- comando para adicionar data de validade
alter table Produtos add column prd_data_valid date AFTER prd_data_fab;
update Produtos set prd_data_valid = '2024-04-15' where prd_id=1;
update Produtos set prd_data_valid = '2024-05-16' where prd_id=2;
update Produtos set prd_data_valid = '2024-06-17' where prd_id=3;
update Produtos set prd_data_valid = '2024-07-18' where prd_id=4;
update Produtos set prd_data_valid = '2024-08-19' where prd_id=5;
-- adicionando mais 3 produtos
INSERT INTO Produtos (prd_id, prd_nome, prd_qtd_estoque, prd_estoque_min, prd_perecivel, prd_valor,prd_data_valid,prd_marca_id) VALUES
(6, 'LG UltraWide Monitor', 20, 5, false, 399.99,'2024-09-20',1),
(7, 'Microsoft Surface Laptop', 40, 10, false, 1299.99,'2024-10-21',2),
(8, 'Canon EOS Rebel T7', 60, 15, false, 699.99, '2024-10-22',3);

select*from Produtos; -- selec para visualizar a tabela produtos depois da adição da coluna data de validade e os 3 novos produtos.
	
-- view para visualizar produtos com data vencida.
CREATE VIEW View_Produtos_Validade_Vencida AS
SELECT 
    p.prd_id,
    p.prd_nome AS Produto,
    p.prd_data_valid AS Data_Validade,
    m.mrc_nome AS Marca,
    m.mrc_nacionalidade AS Nacionalidade_Marca
FROM Produtos p
JOIN Marcas m ON p.prd_marca_id = m.mrc_id
WHERE p.prd_data_valid < curdate(); 
SELECT*from View_Produtos_Validade_Vencida;

-- comando para calcular media dos preços
SELECT AVG(prd_valor) as media_Preco FROM Produtos;
-- view para visualizar produtos com estoque acima da media.
CREATE VIEW view_produto_valor_acima_media as 
SELECT
	prd_id,
	prd_nome as Nome,
    prd_qtd_estoque AS Quantidade_Estoque,
    prd_estoque_min AS Estoque_Minimo,
    prd_data_fab AS Data_Fabricacao,
    prd_perecivel AS Perecivel,
    prd_valor AS Preço from Produtos WHERE prd_valor > (SELECT AVG (prd_valor) FROM Produtos);
SELECT*from view_produto_valor_acima_media;