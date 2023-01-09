-- Criação do Banco de dados do Projeto feito para Oficina.(Projeto Lógico - Oficina BD)
-- Modelo de banco de dados de OS - Ordem de serviço para Oficina automotiva para carros; 

Create database Oficina;  
use Oficina;
Show tables;
-- drop database Oficina;
create table Clientes(
	Idclientes int auto_increment primary key,
    Fname varchar(40) not null, 
    Nome_meio varchar(40) not null,
    Lname varchar(40) not null,
    Contato char (11) not null,
    Email varchar(40) default null,
    Endereço varchar(100) not null,
    Cep varchar(15) not null,
    CPF char(11) not null, -- A pessoa que levou o carro pra consertar, vai ter que informar o CPF independente de ser funcionário de uma empresa ou empresa;
    CNPJ_Cliente char(14) default null,
    constraint unique_CPF_cliente unique(CPF),
    constraint unique_CNPJ_cliente unique(CNPJ_Cliente)
		);
	desc Clientes;
  
 create table Veiculo(
	IdVeiculo int auto_increment primary key,
    IdVeiculoCliente int,
    Placa varchar(10) not null, 
    Cor varchar(20) not null, 
    Marca varchar(20) not null, 
    Modelo varchar(50) not null,
    Ano year not null,
	Estilo enum('Carro', 'SUV & Crossover', 'Picape', 'Esportivo','Elétrico') default 'Carro',
    Chassi varchar(40) not null,
    constraint unique_Chassi_Veiculo unique(Chassi),
    constraint unique_Placa_Veiculo unique(Placa),
    constraint FK_Veiculo_do_Cliente foreign key (IdVeiculoCliente) references Clientes(Idclientes)
    );
    
create table Mecanico(
	IdMecanico int auto_increment primary key,
    Fname_mecanico varchar(40) not null, 
    Nome_meio_mecanico varchar(40) not null,
    Lname_mecanico varchar(40) not null,
    CPF_mecanico char(14) not null,
    Especialidade enum('Motor','Ar-Condicionado','Elétrica', 'Amortecedores & Suspensão', 'Performance', 'Bomba de Combustível', 'Amassados & Arranhões') default 'Motor',
    Contato_Mecanico char(11)
		);

create table Avaliacao_Mecanico(
	IdVeiculoAvaliacao int, 
    IdMecanicoAvaliador int,
    primary key(IdVeiculoAvaliacao, IdMecanicoAvaliador),
    Local_Avaliação enum('Residência Cliente', 'Oficina', 'Empresa do Cliente', 'Rua/Avenida') default 'Oficina',
    constraint FK_veiculo_avaliado foreign key (IdVeiculoAvaliacao) references Veiculo(IdVeiculo),
    constraint FK_mecanico_avaliar foreign key (IdMecanicoAvaliador) references Mecanico(IdMecanico)
		);

create table Serviços(
	IdServiço int auto_increment primary key,
    Data_de_Solicitação date not null, 
    Tipo_de_Servico enum('Revisão', 'Troca de Óleo', 'Conserto de Ar-condicionado', 'Remoção de amassados ou arranhões', 'Conserto de alguma parte elétrica',
    'Conserto no Motor', 'Upgrade de Performance', 'Troca/Conserto da Bomba de combustível', 'Amortecedor ou Suspensão','Troca de peças') default 'Revisão',
    Descrição varchar(200) not null,
	Status_Servico enum('Autorizado', 'Pendente', 'Não Autorizado') default 'Pendente'
		);

create table Servico_Mecanico( 
	IdServico_Realizar int,
    IdMecanico_Fazer int,
    primary key(IdServico_Realizar, IdMecanico_Fazer),
    Periodo_Medio_Realizacao varchar(20) not null,
    constraint FK_Servico_Realizar_Servico foreign key (IdServico_Realizar) references Serviços(IdServiço),
    constraint FK_Mecanico_Fazer_Mecanico foreign key (IdMecanico_Fazer) references Mecanico(IdMecanico)
		);

-- Essa tabela abaixo foi criada para que possa ser possível ligar qual o serviço que o cliente solicitou, para qual cliente é aquele serviço
 create table Servico_Cliente(
	IdCliente_Servico int,
    IdServico_Consultar int, 
    primary key(IdCliente_Servico, IdServico_Consultar),
    constraint FK_Cliente_Servico_Cliente foreign key (IdCliente_Servico) references Clientes(Idclientes),
    constraint FK_Servico_Consultar_Servico foreign key (IdServico_Consultar) references Serviços(IdServiço)
		);

create table OS(
	IdOS int auto_increment primary key,
	Status_OS enum('Concluído', 'Pendente', 'Em Execução') default 'Pendente',
    Data_de_Inicio_OS date default null,
    Data_de_Conclusão_OS date default null
		);

-- Tabela criada pra ver qual mecânico vai realizar a OS
create table OS_Mecanico(
		IdOS_A_Realizar int,
        IdMecanico_Vai_Fazer int,
        primary key(IdOS_A_Realizar, IdMecanico_Vai_Fazer),
        constraint FK_OS_A_Realizar_OS foreign key (IdOS_A_Realizar) references OS(IdOS),
        constraint FK_Mecanico_Vai_Fazer_Mecanico foreign key (IdMecanico_Vai_Fazer) references Mecanico(IdMecanico)
        ); 

-- Tabela de relação entre OS e Serviço
create table OS_Servico(
		IdOS_Servico int,
        IdServico_OS int,
        primary key(IdOS_Servico, IdServico_OS),
        constraint FK_OS_Servico_OS foreign key (IdOS_Servico) references OS(IdOS),
        constraint FK_Servico_OS foreign key (IdServico_OS) references Serviços(IdServiço)
        );

create table Mao_De_Obra(
	IdMaodeObra int auto_increment primary key,
    HorasTrabalhadas int,
    Valor_da_hora float,
    Tipo_da_acao enum('Troca de peças', 'Conserto de peças', 'Vistoria do veículo', 'Remoção de amassados/arranhões'),
    Valor_Mao_de_Obra float
    );

create table Mao_de_Obra_OS(
		IdOS_MaodeObra int,
        IdMaodeObra_OS int,
        primary key (IdOS_MaodeObra, IdMaodeObra_OS),
        constraint FK_OS_MaodeObra_OS foreign key (IdOS_MaodeObra) references OS(IdOS),
        constraint FK_MaodeObra_OS_Mao_De_Obra foreign key (IdMaodeObra_OS) references Mao_De_Obra(IdMaodeObra)
        );

create table Peça(
	IdPeça int auto_increment primary key,
    Peso Float default null,
    Marca varchar(130) not null,
    Descricao_peça varchar(200) not null,
    Valor_da_peça float,
    Tipo_da_Peça varchar(60) not null 
    );

create table Peça_OS(
		IdPeçaSolicitada int, -- foram usadas 3 peças da peça cujo id é 01 na ordem de serviço 02;
        IdOS_Registrar_Peca int, -- Registrar a OS que essa determinada peça foi utilizada, EX: Nessa OS aqui, foi ou foram utilizadas tais peças;
        primary key(IdPeçaSolicitada, IdOS_Registrar_Peca),
        constraint FK_PeçaSolicitada_Peça foreign key(IdPeçaSolicitada) references Peça(IdPeça),
        constraint FK_OS_REGISTRAR_PECA_OS foreign key(IdOS_Registrar_Peca) references OS(IdOS)
	);
 
 create table Valor_a_Pagar(
	IdValor_Total int auto_increment primary key,
    IdOS_Pagar int, -- FK
    IdPeça_pagar int, -- FK
	Quantidade_peça int,
    IdMaodeObra_Pagar int, -- FK
	ValorTotal float,
    constraint FK_OS_A_PAGAR_OS foreign key (IdOS_Pagar) references OS(IdOS),
    constraint FK_Peçar_A_PAGAR_PEÇA foreign key (IdPeça_pagar) references Peça(IdPeça),
    constraint FK_MAO_DE_OBRA_A_PAGAR_MaoDeObra foreign key (IdMaodeObra_Pagar) references Mao_De_Obra(IdMaodeObra)
    );
 
 create table Veiculo_Servico(
	IdVeiculoServico int,
    IdServicoAFazer int, 
    primary key(IdVeiculoServico, IdServicoAFazer),
    constraint FK_Veiculo_Associado_Serviço foreign key (IdVeiculoServico) references Veiculo(IdVeiculo),
    constraint FK_Serviço_Associado_Veiculo foreign key (IdServicoAFazer) references Serviços(IdServiço)
    );
        
    
    
    
    
    