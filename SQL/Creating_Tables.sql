CREATE DATABASE Ecommerce;
USE Ecommerce;

CREATE TABLE Customer(
	idCustomer INT NOT NULL AUTO_INCREMENT,
    Fname VARCHAR(15),
    Mname VARCHAR(15),
    Lname VARCHAR(15),
    CPF CHAR(11),
    CNPJ CHAR(14),
    Address TEXT,
    BirthDate date,
    CustomerType ENUM("PF", "PJ"),
    PRIMARY KEY(idCustomer),
    CHECK ((CPF IS NOT NULL AND CNPJ IS NULL) OR 
    (CPF IS NULL AND CNPJ IS NOT NULL))
);

CREATE TABLE OrderALT(
	idOrder INT NOT NULL AUTO_INCREMENT,
    Descrptn VARCHAR(120),
    FK_idCustomer INT,
    PRIMARY KEY(idOrder),
    FOREIGN KEY(FK_idCustomer) REFERENCES Customer(idCUstomer)
);

CREATE TABLE Delivery(
	idDelivery INT NOT NULL AUTO_INCREMENT,
    OrderStatus ENUM("PENDENTE", "EM TRANSITO", "ENTREGUE"),
    OrderCode VARCHAR(15) NOT NULL,
    DeliveryCost float,
    FK_idOrder INT,
    PRIMARY KEY(idDelivery),
    FOREIGN KEY(FK_idOrder) REFERENCES OrderALT(idOrder)
);

CREATE TABLE Stock (
	idStock INT NOT NULL AUTO_INCREMENT,
    Location VARCHAR(45),
    Quantity INT,
    PRIMARY KEY(idStock)
);

CREATE TABLE Product(
	idProduct INT NOT NULL AUTO_INCREMENT,
    Category VARCHAR(45),
    Descrptn VARCHAR(120),
    Price FLOAT,
    PRIMARY KEY(idProduct)
);

CREATE TABLE Supplier(
	idSupplier INT NOT NULL AUTO_INCREMENT,
    CompanyName VARCHAR(120),
    CNPJ CHAR(14),
    Contact VARCHAR(45),
    PRIMARY KEY(idSupplier)
);

CREATE TABLE Third_Party_Seller(
	idTP_Seller INT NOT NULL AUTO_INCREMENT,
    CompanyName VARCHAR(120),
    CNPJ CHAR(14),
    Contact VARCHAR(45),
    PRIMARY KEY(idTP_Seller)
);

CREATE TABLE Product_Has_Order(
	FK_idProduct INT,
    FK_idOrderProduct INT,
    Quantity INT,
    PRIMARY KEY(FK_idProduct, FK_idOrderProduct),
    FOREIGN KEY(FK_idProduct) REFERENCES Product(idProduct),
    FOREIGN KEY(FK_idOrderProduct) REFERENCES OrderALT(idOrder)
);

CREATE TABLE Stock_Has_Product(
	FK_idStock INT,
    FK_idProductStock INT,
    Location VARCHAR(120),
    -- Quantity INT,
    PRIMARY KEY(FK_idStock, FK_idProductStock),
    FOREIGN KEY(FK_idStock) REFERENCES Stock(idStock),
    FOREIGN KEY(FK_idProductStock) REFERENCES Product(idProduct)
);

CREATE TABLE Supplier_Has_Product(
	FK_idSupplier INT,
    FK_idProductSupplier INT,
    Quantity INT,
    PRIMARY KEY(FK_idSupplier, FK_idProductSupplier),
    FOREIGN KEY(FK_idSupplier) REFERENCES Supplier(idSupplier),
    FOREIGN KEY(FK_idProductSupplier) REFERENCES Product(idProduct)
);

CREATE TABLE Thirt_Part_Seller_Has_Product(
	FK_TP_idTP_Seller INT,
    FK_idProductTPseller INT,
    Quantity INT,
    PRIMARY KEY(FK_TP_idTP_Seller, FK_idProductTPseller),
    FOREIGN KEY(FK_TP_idTP_Seller) REFERENCES Third_Party_Seller(idTP_Seller),
    FOREIGN KEY(FK_idProductTPseller) REFERENCES Product(idProduct)
);

