-- Populating Customer Table
INSERT INTO Customer (Fname, Mname, Lname, CPF, CNPJ, Address, BirthDate, CustomerType) VALUES
('João', 'Carlos', 'Silva', '12345678901', NULL, 'Rua A, 123', '1990-05-15', 'PF'),
('Maria', 'Eduarda', 'Santos', NULL, '12345678901234', 'Av. B, 456', '1985-10-20', 'PJ'),
('Pedro', 'Henrique', 'Oliveira', '23456789012', NULL, 'Rua C, 789', '1995-03-25', 'PF'),
('Ana', 'Clara', 'Costa', NULL, '23456789012345', 'Av. D, 101', '1980-07-30', 'PJ'),
('Lucas', 'Gabriel', 'Pereira', '34567890123', NULL, 'Rua E, 202', '1992-12-10', 'PF'),
('Carla', 'Fernanda', 'Lima', NULL, '34567890123456', 'Av. F, 303', '1975-09-05', 'PJ'),
('Marcos', 'Antonio', 'Rocha', '45678901234', NULL, 'Rua G, 404', '1988-06-18', 'PF'),
('Juliana', 'Beatriz', 'Mendes', NULL, '45678901234567', 'Av. H, 505', '1998-02-22', 'PJ'),
('Fernando', 'Luiz', 'Almeida', '56789012345', NULL, 'Rua I, 606', '1991-11-12', 'PF'),
('Patricia', 'Rosa', 'Nunes', NULL, '56789012345678', 'Av. J, 707', '1983-04-28', 'PJ');

-- Populating OrderALT Table
INSERT INTO OrderALT (Descrptn, FK_idCustomer) VALUES
('Pedido de eletrônicos', 1),
('Compra de móveis', 2),
('Pedido de roupas', 3),
('Compra de alimentos', 4),
('Pedido de livros', 5),
('Compra de eletrodomésticos', 6),
('Pedido de brinquedos', 7),
('Compra de materiais de construção', 8),
('Pedido de produtos de beleza', 9),
('Compra de ferramentas', 10);

-- Populating Delivery Table
INSERT INTO Delivery (OrderStatus, OrderCode, DeliveryCost, FK_idOrder) VALUES
('PENDENTE', 'ORD123456', 15.99, 1),
('EM TRANSITO', 'ORD234567', 20.50, 2),
('ENTREGUE', 'ORD345678', 10.00, 3),
('PENDENTE', 'ORD456789', 25.75, 4),
('EM TRANSITO', 'ORD567890', 18.30, 5),
('ENTREGUE', 'ORD678901', 12.45, 6),
('PENDENTE', 'ORD789012', 22.60, 7),
('EM TRANSITO', 'ORD890123', 14.90, 8),
('ENTREGUE', 'ORD901234', 19.99, 9),
('PENDENTE', 'ORD012345', 30.00, 10);

-- Populating Stock Table
INSERT INTO Stock (Location, Quantity) VALUES
('São Paulo', 100),
('Rio de Janeiro', 200),
('Belo Horizonte', 150),
('Curitiba', 120),
('Porto Alegre', 180),
('Recife', 90),
('Salvador', 110),
('Fortaleza', 130),
('Brasília', 140),
('Manaus', 160);

-- Populating Pruduct Table
INSERT INTO Product (Category, Descrptn, Price) VALUES
('Eletrônicos', 'Smartphone XYZ', 1500.00),
('Móveis', 'Sofá de Couro', 2500.00),
('Roupas', 'Camiseta Branca', 50.00),
('Alimentos', 'Arroz 5kg', 20.00),
('Livros', 'Livro de Ficção', 30.00),
('Eletrodomésticos', 'Geladeira Frost-Free', 3000.00),
('Brinquedos', 'Boneca de Pelúcia', 80.00),
('Materiais de Construção', 'Cimento 50kg', 25.00),
('Produtos de Beleza', 'Creme Hidratante', 40.00),
('Ferramentas', 'Furadeira Elétrica', 200.00);

-- Populating Supplier Table
INSERT INTO Supplier (CompanyName, CNPJ, Contact) VALUES
('Fornecedor A', '12345678901234', 'contato@fornecedora.com'),
('Fornecedor B', '23456789012345', 'contato@fornecedorb.com'),
('Fornecedor C', '34567890123456', 'contato@fornecedorc.com'),
('Fornecedor D', '45678901234567', 'contato@fornecedord.com'),
('Fornecedor E', '56789012345678', 'contato@fornecedore.com'),
('Fornecedor F', '67890123456789', 'contato@fornecedorf.com'),
('Fornecedor G', '78901234567890', 'contato@fornecedorg.com'),
('Fornecedor H', '89012345678901', 'contato@fornecedorh.com'),
('Fornecedor I', '90123456789012', 'contato@fornecedori.com'),
('Fornecedor J', '01234567890123', 'contato@fornecedorj.com');

-- Populating Third_Party_Seller Table
INSERT INTO Third_Party_Seller (CompanyName, CNPJ, Contact) VALUES
('Vendedor A', '12345678901234', 'contato@vendedora.com'),
('Vendedor B', '23456789012345', 'contato@vendedorb.com'),
('Vendedor C', '34567890123456', 'contato@vendedorc.com'),
('Vendedor D', '45678901234567', 'contato@vendedord.com'),
('Vendedor E', '56789012345678', 'contato@vendedore.com'),
('Vendedor F', '67890123456789', 'contato@vendedorf.com'),
('Vendedor G', '78901234567890', 'contato@vendedorg.com'),
('Vendedor H', '89012345678901', 'contato@vendedorh.com'),
('Vendedor I', '90123456789012', 'contato@vendedori.com'),
('Vendedor J', '01234567890123', 'contato@vendedorj.com');

-- Populating Product_Has_Order Table
INSERT INTO Product_Has_Order (FK_idProduct, FK_idOrderProduct, Quantity) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 5),
(4, 4, 10),
(5, 5, 3),
(6, 6, 1),
(7, 7, 4),
(8, 8, 20),
(9, 9, 2),
(10, 10, 1);

-- Populating Stock_Has_Product Table
INSERT INTO Stock_Has_Product (FK_idStock, FK_idProductStock, Location) VALUES
(1, 1, 'São Paulo'),    -- Combinação única (1, 1)
(2, 2, 'Rio de Janeiro'), -- Combinação única (2, 2)
(3, 3, 'Belo Horizonte'), -- Combinação única (3, 3)
(4, 4, 'Curitiba'),       -- Combinação única (4, 4)
(5, 5, 'Porto Alegre'),   -- Combinação única (5, 5)
(6, 6, 'Recife'),         -- Combinação única (6, 6)
(7, 7, 'Salvador'),       -- Combinação única (7, 7)
(8, 8, 'Fortaleza'),      -- Combinação única (8, 8)
(9, 9, 'Brasília'),       -- Combinação única (9, 9)
(10, 10, 'Manaus');       -- Combinação única (10, 10)

-- Populating Supplier_Has_Product Table
INSERT INTO Supplier_Has_Product (FK_idSupplier, FK_idProductSupplier, Quantity) VALUES
(1, 1, 50),   -- Combinação única (1, 1)
(2, 2, 30),   -- Combinação única (2, 2)
(3, 3, 100),  -- Combinação única (3, 3)
(4, 4, 200),  -- Combinação única (4, 4)
(5, 5, 60),   -- Combinação única (5, 5)
(6, 6, 40),   -- Combinação única (6, 6)
(7, 7, 80),   -- Combinação única (7, 7)
(8, 8, 150),  -- Combinação única (8, 8)
(9, 9, 70),   -- Combinação única (9, 9)
(10, 10, 90); -- Combinação única (10, 10)

-- Populating Thirt_Part_Seller_Has_Product Table
INSERT INTO Thirt_Part_Seller_Has_Product (FK_TP_idTP_Seller, FK_idProductTPseller, Quantity) VALUES
(1, 1, 20),
(2, 2, 15),
(3, 3, 50),
(4, 4, 100),
(5, 5, 30),
(6, 6, 25),
(7, 7, 40),
(8, 8, 75),
(9, 9, 35),
(10, 10, 45);