-- Criação do Banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;
show tables;
show databases;
-- Dropar todo o banco de dados -> drop database ecommerce;
-- criar as tabelas 
-- criar tabela cliente 
create table clients(
	idClients int auto_increment primary key,
    Fname varchar (15),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(70),
    constraint unique_cpf_client unique(cpf)    
);
-- drop schema ecommerce;
alter table clients auto_increment = 1;

-- desc clients;
-- criar tabela produto
-- size é que vale a dimensão do produto 
create table product(
	idProduct int auto_increment primary key,
    Pname varchar (30) not null,
    classification_kids bool default false,
    category enum('Eletrônico', 'Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    avaliação float default 0,
    size varchar(10)
);
alter table product auto_increment = 1;
-- para ser continuado no desafio: terminar de implementar a tabela e crie a conexão com as tabelas necessárias
-- Além disso, reflita essa modificação no diagrama de esquema relacional
-- Criar constraints relacionadas ao pagamento;
Create table payments(
	idClients int,
	idPayment int,
	limitAvailable float,
	typePayment enum('Boleto','Cartão','Dois cartões'),
	primary key(idClients, idPayment)
	);


-- criar tabela pedido
create table orders(
	idOrders int auto_increment primary key,
    idOrdersClients int,
    orders_Status enum ('Cancelado','Confirmado','Em processamento','Enviado','Entregue') default 'Em processamento',
    orders_Description varchar(255),
    sendValue float default 10,
    paymentCash bool default false, 
    -- idPayment int, 
    -- constraint fk_orders_payments foreign key (idPayment) references payments(idPayment),
    constraint fk_orders_clients foreign key (idOrdersClients) references clients(idClients)
    );
desc orders;

-- Criar tabela produto/estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storagelocation varchar(255),
    quantity int default 0
    ); 

-- Criar tabela fornecedor 
create table supplier(
	idSupplier int auto_increment primary key, 
	SocialName varchar(255) not null,
	CNPJ char(14) not null,
    contact char(11) not null,
    constraint unique_supplier unique(CNPJ)
    
);
desc supplier;

-- Criar tabela Vendedor 
create table seller(
	idSeller int auto_increment primary key, 
	SocialName varchar(255) not null,
    AbstName varchar(255),
	CNPJ char(14) not null,
    CPF char(11) default null,
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique(CNPJ),
    constraint unique_cpf_seller unique(CPF)
);
desc seller;

-- Criar a tabela Produto/Vendedor 
create table productSeller(
	idPseller int,
    idPproduct int, 
    prodQuantity int default 1,
    primary key (idPseller,idPproduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
    );
desc productSeller;

-- Criar a tabela Produto/Pedido 
create table productOrder (
	idPOproduct int,
    idPOorder int, 
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct,idPOorder),
    constraint fk_productOrder_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_productOrder_order foreign key (idPOorder) references orders(idOrders)
    );

-- Criar a tabela Estoque/Produto  
create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null, 
    primary key (idLproduct,idLstorage), 
    constraint fk_storageLocation_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storageLocation_productStorage foreign key (idLstorage) references productStorage(idProdStorage)
    );
    
-- Criar a tabela produto/Fornecedor 
create table productSupplier(
	idPsSupplier int,
    idPsProduct int, 
    quantity int not null, 
    primary key (idPsSupplier,idPsProduct),
    constraint fk_productSupplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_productSupplier_product foreign key (idPsProduct) references product(idProduct)
    );
    
    -- desc productSupplier;
    -- show databases;
    -- use information_schema;
    -- show tables;
    -- desc REFERENTIAL_CONSTRAINTS;
    -- select * from referential_constraints where constraint_schema = 'ecommerce';