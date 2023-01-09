-- inserção de dados e queries 
use ecommerce; 

show tables;
-- idClient, Fname, Minit, Lname, CPF, Address
insert into clients (Fname, Minit, Lname, CPF, Address)
	values('Maria', 'M', 'Silva', 123456789, 'Rua Silva de Prata 29, Carangola - Cidade das Flores'),
		  ('Mathes','O','Pimentel','987654321','Rua alemeda 289, Centro - Cidade das Flores'),
          ('Ricardo', 'F', 'Silva','45678913', 'Avenidad alemeda vinha 1009, Centro - Cidade das flores'),
          ('Julia', 'S', 'França', '789123456', 'Rua lareijras 861, Centro - Cidade das flores'),
          ('Roberta', 'G', 'Assis', '98745631','avenidade koller 19, Centro - Cidade das flores'),
          ('Isabela', 'M', 'Cruz', '654789123','Rua alemeda das flores 28, Centro - Cidade das flores');

-- idProduct, Pname, Classification_kids boolean, category('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos','Móveis'), avaliação, side
	insert into product (Pname,  classification_kids, category, avaliação, size)
		values ('Fone de ouvido', false, 'Eletrônico', '4', null),
			   ('Barbie Elsa', true, 'Brinquedos', '3', null),
               ('Body Carters',true, 'Vestimenta', '5', null),
               ('Microfone Vedo - Youtuber', False, 'Eletrônico', '4', null),
               ('Sofá retrátil',false,'Móveis', '3', '3x57x80'),
			   ('Farinha de arroz', False, 'Alimentos','2',null),
               ('Fire Stick Amazon', False, 'Eletrônico','3', null);
               
select * from clients;
select * from product;

insert into orders (idOrdersClients,orders_Status,orders_Description,sendValue,paymentCash) values
	(1, default, 'compra via aplicativo',null,1),
    (2, default, 'compra via aplicativo',50,0),
    (3,'Confirmado',null,null,1),
    (4, default,'compra via web site',150,0);

select * from orders;

insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
	(1,1,2, null),
	(2,1,1,null),
    (3,2,1,null);
    
insert into productStorage (storagelocation,quantity) values
	('Rio de Janeiro',1000),
    ('Rio de Janeiro',1000),
    ('São Paulo',10),
    ('São Paulo',100),
    ('São Paulo',10),
    ('Brasília',60);

insert into storageLocation (idLproduct, idLstorage, location) values 
	(1,2,'RJ'),
    (2,6,'GO');

insert into supplier (SocialName, CNPJ, contact) values 
	('Almeida e filhos', 123456789123456, '21985474'),
    ('Eletrônicos e Silva',854519649143457,'21985484'),
    ('Eletrônicos Valma', 934567893934695, '21975474');

insert into productSupplier (idPsSupplier, idPsProduct, quantity) values 
	(1,1,500),
    (1,2,400),
    (2,4,633),
    (3,3,5),
    (2,5,10);

insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
	('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
    ('Botique Durgas', null, null, 123456783,'Rio de Janeiro', 219567895),
    ('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);
    
insert into productSeller (idPseller, idPproduct,prodQuantity) values
			(1,6,80),
			(2,7,10);

-- Queries 

-- Recuperar o número de clientes;
select count(*) from clients;

select * from orders, clients where idOrdersClients = idClients;
select concat(Fname,' ',Lname) as Client, idOrders as Request, orders_Status as Status from clients as c, orders as o where idOrdersClients = idClients;

insert into orders (idOrdersClients,orders_Status,orders_Description,sendValue,paymentCash) values
    (2, default, 'compra via aplicativo',null,1);
    
select * from clients left outer join orders on idClients = idOrdersClients;

select * from clients as c inner join orders as o ON c.idClients = o.idOrdersClients
	inner join productOrder as p on p.idPOorder = o.idOrders
    group by idClients;

-- Recuperação de pedido com produto associado; (Mesmo pedido com 2 produtos iguais) (quem fez o pedido de uma determinada camisa)
select c.idClients, Fname, count(*) as Number_of_orders from clients as c inner join orders as o ON c.idClients = o.idOrdersClients
	inner join productOrder as p on p.idPOorder = o.idOrders
    group by idClients;

-- Recuperar quantos pedidos foram realizados pelos clientes; (Pedidos diferentes realizados)
select c.idClients, Fname, count(*) as Number_of_orders from clients as c inner join 
orders as o ON c.idClients = o.idOrdersClients
    group by idClients;