-- nawstory é o nome do Ecommerce. Desafio de Projeto da DIO;

create database Nawstory;
use Nawstory; 
show tables;
drop database Nawstory;
-- Criação da tabela cliente 
create table Cliente(
	Idcliente int auto_increment primary key,
    Fname varchar(25) not null,
    NomeDoMeio varchar(15), 
    Lname varchar(20),
    Endereço varchar(60) not null,
    Email varchar(50) not null, 
    Bdate date not null, 
    Numero_De_Telefone varchar(14),
    constraint email_unique unique(Email),
    constraint Numero_De_Telefone_unique unique(Numero_De_Telefone)
    );
   
-- Criação da tabela cliente pessoa física;
create table Cliente_P_Fisica(
	IdPfisica int auto_increment primary key,
    CPF char(11) default null,
    constraint unique_cpf_cliente unique(CPF),
    constraint fk_pessoa_fisica foreign key(IdPfisica) references Cliente(Idcliente)
    );


-- Criação da tabela cliente pessoa jurídica;
create table Cliente_P_Juridica(
	IdPjuridica int auto_increment primary key,
    CNPJ char(14) default null, 
    constraint unique_cnpj_cliente unique(CNPJ), 
    constraint fk_pessoa_juridica foreign key(IdPjuridica) references Cliente(Idcliente)
    );

-- Criação da tabela produto;
create table Produto(
	IdProduto int auto_increment primary key,
    Nome_do_Produto varchar(30) not null, 
    categoria enum ('Eletrônicos','Eletrodomésticos','Alimentos','Brinquedos','Roupas', 'Acessórios', 'Calçados','Cozinha','Móveis') not null, 
    avaliação float default 0,
    tamanho varchar(20),
    preço float not null, 
    classificação_infantil bool default false,
    descrição varchar(120)
    );
 
-- Criação da tabela pedido;
create table Pedidos(
	IdPedido int auto_increment primary key,
    IdPedido_cliente int,
    Status_do_pedido enum('Cancelado','Em processamento', 'Aprovado', 'Enviado', 'Entregue') default 'Em processamento',
    Descrição_do_pedido varchar(150), 
    ValorTotal float default 0.00,
    IdPagamento_pedido_cliente int,
    constraint FK_pedido_cliente foreign key (IdPedido_cliente) references Cliente(Idcliente),
    constraint FK_pagamento_do_pedido foreign key (IdPagamento_pedido_cliente) references Opcoes_Pagamentos(IdPagamentoCliente)
    );

-- Criação da tabela meios de pagamentos 
create table Opcoes_Pagamentos( 
	Idpagamento int auto_increment primary key,
    IdPagamentoCliente int,
	Formas_De_Pagamento enum('Pix','Boleto','Cartão de Crédito', 'Cartão de Débito','Dois Cartões de Crédito') default 'Cartão de Crédito',
    IdPagamentoPix int default null, 
    IdPagamentoCredito int default null,
    IdPagamentoBoleto int default null, 
    IdPagamentoDebito int default null,
    constraint Fk_Pagamento_Cliente foreign key (IdPagamentoCliente) references Cliente(Idcliente),
    constraint fK_Pagamento_Pix foreign key (IdPagamentoPix) references Pix(Idpixcliente),
    constraint FK_Pagamento_Credito foreign key (IdPagamentoCredito) references Credito(IdCardCreditClient),
    constraint fk_Pagamento_Boleto foreign key (IdPagamentoBoleto) references Boleto(IdBoletoCliente),
	constraint Fk_Pagamento_Debito foreign key (IdPagamentoDebito) references Debito(IdDebitoCliente)
    );
    
-- Criação da tabela Pagamento/Pix
create table Pix (
	Idpix int auto_increment primary key,
    Idpixcliente int,
    Tipos_Chaves_Pix enum('Email','Telefone Celular','CPF','CNPJ','Chave Aleatória') default 'CPF',
    Chave_Email varchar (40) default null,
    Chave_TelCelular char(11) default null,
    Chave_CPF char(11) default null,
    Chave_CNPJ char(14) default null,
    Chave_Aleatoria varchar(50) default null,
    Pagar_QrCode varchar (50) default null,
    Data_realizada Date default null,
    constraint unique_ChavePix_CPF unique (Chave_CPF),
    constraint unique_ChavePix_CNPJ unique (Chave_CNPJ),
    constraint fk_pix_cliente foreign key (Idpixcliente) references Cliente(Idcliente)
    ); 

-- Criação da tabela Pagamento/Cartão de Crédito
create table Credito(
	IdCredito int auto_increment primary key,
    IdCardCreditClient int,
    Nome_inscrito varchar (50) not null,
    Número_Card varchar(16) not null,
    Data_de_Validade date not null,
    CVV char(3) not null, 
    Status_pagamento enum ('Em Análise','Processando','Pagamento Efetuado','Recusado') default 'Em Análise',
    constraint unique_number_Card unique (Número_Card),
    constraint unique_CVV_Card unique (CVV),
    constraint fk_cardcredit_cliente foreign key (IdCardCreditClient) references Cliente(Idcliente)
	);

-- Criação da tabela Pagamento/Boleto
create table Boleto(
	IdBoleto int auto_increment primary key,
    IdBoletoCliente int,
	Nome_banco varchar(50),
    Data_de_vencimento date,
    Data_de_emissão_boleto date,
    constraint fk_boleto_cliente foreign key (IdBoletoCliente) references Cliente(Idcliente)
    );

-- Criação da tabela Pagamento/Débito 
create table Debito(
	IdDebito int auto_increment primary key,
    IdDebitoCliente int,
    Nome_inscrito_debito varchar(60) not null,
    Numero_card_debito varchar(16) not null,
    CVVD varchar(5) not null, 
    Data_De_Validade_debito date,
    constraint number_Card_debito unique(Numero_card_debito),
    constraint CVVD_codigo_seguranca unique(CVVD),
    constraint fk_DebitoCard_Cliente foreign key (IdDebitoCliente) references Cliente(Idcliente)
    );

-- Criação da tabela produto/estoque  
create table ProdutoEstoque(
	IdProdutoEstoque int auto_increment primary key, 
    Localização_Produto varchar(150),
    Quantidade int default 0
    );

-- Criar tabela fornecedor 
create table Fornecedor(
	IdFornecedor int auto_increment primary key, 
    NomeSocial varchar(80) not null,
    CNPJ_Fornecedor char(14) not null,
    Contato_Tel varchar(11) not null,
    Constraint unique_CNPJ_Fornecedor unique(CNPJ_Fornecedor)
    );

-- Criar a tabela Vendedor 
create table Vendedor(
	IdVendedor int auto_increment primary key, 
	NomeSocial_Vendedor varchar(255) not null,
	CNPJ_Vendedor char(14) default null,
    CPF_Vendedor char(11) default null,
    Localização_Vendedor varchar(255),
    Contato_Vendedor char(11) not null,
    constraint unique_cnpj_Vendedor unique(CNPJ_Vendedor),
    constraint unique_cpf_Vendedor unique(CPF_Vendedor)
);

-- Criação da tabela relacionamento entre vendedor e produto
create table ProdutoVendedor(
	IdPVendedor int,
    idPproduto int, 
    prodQuantidade int default 1,
    primary key (IdPVendedor,idPproduto),
    constraint fk_product_seller foreign key (IdPVendedor) references Vendedor(IdVendedor),
    constraint fk_product_product foreign key (idPproduto) references Produto(IdProduto)
    );

-- Criar a tabela relacionamento entre Produto/Pedido 
create table ProdutoPedido (
	IdPOproduto int,
    IdPOpedido int, 
    poQuantidade int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (IdPOproduto,IdPOpedido),
    constraint fk_productOrder_product foreign key (IdPOproduto) references Produto(IdProduto),
    constraint fk_productOrder_order foreign key (IdPOpedido) references Pedidos(IdPedido)
    );

-- Criação da tabela estoque com produto(relacionamento)
create table localização_Estoque(
	IdLproduto int,
    IdLestoque int,
    Localização_estoque varchar(255) not null, 
    primary key (IdLproduto,IdLestoque), 
    constraint fk_storageLocation_product foreign key (IdLproduto) references Produto(IdProduto),
    constraint fk_storageLocation_productStorage foreign key (IdLestoque) references ProdutoEstoque(IdProdutoEstoque)
    );

-- Criar a tabela produto/Fornecedor 
create table ProdutoFornecedor(
	IdPsFornecedor int,
    IdPsProduto int, 
    Quantidade_produto_fornecedor int not null, 
    primary key (IdPsFornecedor,IdPsProduto),
    constraint fk_productSupplier_supplier foreign key (IdPsFornecedor) references Fornecedor(IdFornecedor),
    constraint fk_productSupplier_product foreign key (IdPsProduto) references Produto(IdProduto)
    );

-- Criação da tabela Entrega 
create table Entrega(
	IdEntrega int auto_increment primary key,
    Status_da_Entrega enum ('Na Loja','Objeto em trânsito','Chegou na cidade destino','Saiu para Entrega', 'Entregue','Não recebido') default 'Na Loja',
    Codigo_Rastreio varchar(40) not null,
    Endereço_de_destino varchar(150),
    constraint codigo_rastreio_entrega unique (Codigo_Rastreio)
	);

-- Criação da tabela Pedido/Entrega (Relacionamento)
create table EntregaPedido(
	IdEPentrega int,
    IdEPpedido int, 
    primary key(IdEPentrega,IdEPpedido),
    Entregue bool default false,
    constraint fk_entregapedido_entrega foreign key (IdEPentrega) references Entrega(IdEntrega),
    constraint fk_entregapedido_pedido foreign key (IdEPpedido) references Pedidos(IdPedido)
    );

show tables ;	
	


    