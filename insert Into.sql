  -- Inserir dados na tabela Marcas
INSERT INTO Marcas (mrc_nome, mrc_nacionalidade) VALUES
('Nike', 'Estados Unidos'),
('Adidas', 'Alemanha'),
('Apple', 'Estados Unidos'),
('Samsung', 'Coreia do Sul'),
('Sony', 'Japão');
-- Inserir dados na tabela Produtos
INSERT INTO Produtos (prd_id,prd_nome, prd_qtd_estoque, prd_estoque_min,prd_perecivel, prd_valor, prd_marca_id) VALUES
(1,'Nike Air Max', 100, 20, False, 199.99, 1),
(2,'Adidas Superstar', 80, 15, false, 149.99, 2),
(3,'iPhone 13', 50, 10,false, 999.99, 3),
(4,'Samsung Galaxy S22', 70, 12, false, 899.99, 4),
(5,'Sony PlayStation 5', 30, 8, false, 499.99, 5);

-- Inserir dados na tabela Fornecedores
INSERT INTO Fornecedores (frn_nome, frn_email) VALUES
('Tech Supplier', 'techsupplier@example.com'),
('Sports Co', 'sportsco@example.com'),
('Electronics R', 'electronicsr@example.com'),
('Mobile Store', 'mobilestore@example.com'),
('Gaming World', 'gamingworld@example.com');

INSERT INTO Produto_fornecedor (pf_prod_id, pf_forn_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);
