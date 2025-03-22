-- Quantos pedidos foram feitos por cada cliente?
SELECT c.idCustomer, CONCAT(c.Fname, ' ', c.Lname) as CustomerName, COUNT(o.idOrder) as TotalOrders
	FROM Customer c
    LEFT JOIN
		OrderALT o on c.idCustomer = o.FK_idCustomer
	GROUP BY
		c.idCustomer
	ORDER BY
		TotalOrders DESC;
-- Algum vendedor também é fornecedor?
SELECT 
    s.CompanyName AS SupplierName, 
    tps.CompanyName AS SellerName, 
    s.CNPJ
FROM 
    Supplier s
INNER JOIN 
    Third_Party_Seller tps ON s.CNPJ = tps.CNPJ;
-- Relação de produtos fornecedores e estoques;
SELECT 
    p.Descrptn AS ProductName, 
    s.CompanyName AS SupplierName, 
    shp.Quantity AS SuppliedQuantity
FROM 
    Product p
INNER JOIN 
    Supplier_Has_Product shp ON p.idProduct = shp.FK_idProductSupplier
INNER JOIN 
    Supplier s ON shp.FK_idSupplier = s.idSupplier
ORDER BY 
    p.Descrptn;
-- Relação de nomes dos fornecedores e nomes dos produtos;
SELECT 
    s.CompanyName AS SupplierName, 
    p.Descrptn AS ProductName
FROM 
    Supplier s
INNER JOIN 
    Supplier_Has_Product shp ON s.idSupplier = shp.FK_idSupplier
INNER JOIN 
    Product p ON shp.FK_idProductSupplier = p.idProduct
ORDER BY 
    s.CompanyName, p.Descrptn;

-- Recuperações com SELECT Statement
SELECT 
    idCustomer, 
    CONCAT(Fname, ' ', Lname) AS FullName, 
    CustomerType, 
    CASE 
        WHEN CustomerType = 'PF' THEN CPF 
        WHEN CustomerType = 'PJ' THEN CNPJ 
    END AS Document
FROM 
    Customer;
    
-- Filtros com WHERE Statement
SELECT 
    idCustomer, 
    CONCAT(Fname, ' ', Lname) AS FullName, 
    CPF
FROM 
    Customer
WHERE 
    CustomerType = 'PF';
    
-- Expressões para gerar atributos derivados
SELECT 
    o.idOrder, 
    SUM(p.Price * pho.Quantity) AS TotalOrderValue
FROM 
    OrderALT o
INNER JOIN 
    Product_Has_Order pho ON o.idOrder = pho.FK_idOrderProduct
INNER JOIN 
    Product p ON pho.FK_idProduct = p.idProduct
GROUP BY 
    o.idOrder;

-- Ordenações dos dados com ORDER BY
	SELECT 
    Descrptn AS ProductName, 
    Price
FROM 
    Product
ORDER BY 
    Price DESC;
    
-- Condições de filtros aos grupos – HAVING Statement
SELECT 
    c.idCustomer, 
    CONCAT(c.Fname, ' ', c.Lname) AS CustomerName, 
    COUNT(o.idOrder) AS TotalOrders
FROM 
    Customer c
INNER JOIN 
    OrderALT o ON c.idCustomer = o.FK_idCustomer
GROUP BY 
    c.idCustomer
HAVING 
    TotalOrders > 2; -- Nenhum Customer fez mais que 1 pedido.
    
-- Junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT 
    o.idOrder, 
    CONCAT(c.Fname, ' ', c.Lname) AS CustomerName, 
    d.OrderStatus, 
    p.Descrptn AS ProductName, 
    pho.Quantity
FROM 
    OrderALT o
INNER JOIN 
    Customer c ON o.FK_idCustomer = c.idCustomer
INNER JOIN 
    Delivery d ON o.idOrder = d.FK_idOrder
INNER JOIN 
    Product_Has_Order pho ON o.idOrder = pho.FK_idOrderProduct
INNER JOIN 
    Product p ON pho.FK_idProduct = p.idProduct
ORDER BY 
    o.idOrder;

-- My Queries
-- Order by one Client
SELECT o. idOrder, o.Descrptn, c.Fname, c.Lname
	FROM OrderALT o
    JOIN Customer c ON o.FK_idCustomer = c.idCustomer
    WHERE c.idCustomer = 3;
    
-- List products that have never been ordered
SELECT 
    p.idProduct, 
    p.Descrptn AS ProductName
FROM 
    Product p
LEFT JOIN 
    Product_Has_Order pho ON p.idProduct = pho.FK_idProduct
WHERE 
    pho.FK_idOrderProduct IS NULL;
    
-- List the 5 most expensive products
SELECT 
    idProduct, 
    Descrptn AS ProductName, 
    Price
FROM 
    Product
ORDER BY 
    Price DESC
LIMIT 5;

-- List suppliers that supply more than 3 products
SELECT 
    s.CompanyName AS SupplierName, 
    COUNT(shp.FK_idProductSupplier) AS TotalProductsSupplied
FROM 
    Supplier s
INNER JOIN 
    Supplier_Has_Product shp ON s.idSupplier = shp.FK_idSupplier
GROUP BY 
    s.idSupplier
HAVING 
    TotalProductsSupplied > 3;
    
-- List orders with "PENDING" status and their customers
SELECT 
    o.idOrder, 
    CONCAT(c.Fname, ' ', c.Lname) AS CustomerName, 
    d.OrderStatus
FROM 
    OrderALT o
INNER JOIN 
    Customer c ON o.FK_idCustomer = c.idCustomer
INNER JOIN 
    Delivery d ON o.idOrder = d.FK_idOrder
WHERE 
    d.OrderStatus = 'PENDENTE';
    
-- List best-selling products (top 5)
SELECT 
    p.idProduct, 
    p.Descrptn AS ProductName, 
    SUM(pho.Quantity) AS TotalQuantitySold
FROM 
    Product p
INNER JOIN 
    Product_Has_Order pho ON p.idProduct = pho.FK_idProduct
GROUP BY 
    p.idProduct
ORDER BY 
    TotalQuantitySold DESC
LIMIT 5;

-- List best-selling products (top 5)
SELECT 
    c.idCustomer, 
    CONCAT(c.Fname, ' ', c.Lname) AS CustomerName, 
    SUM(p.Price * pho.Quantity) AS TotalOrderValue
FROM 
    Customer c
INNER JOIN 
    OrderALT o ON c.idCustomer = o.FK_idCustomer
INNER JOIN 
    Product_Has_Order pho ON o.idOrder = pho.FK_idOrderProduct
INNER JOIN 
    Product p ON pho.FK_idProduct = p.idProduct
GROUP BY 
    c.idCustomer
HAVING 
    TotalOrderValue > 500;
