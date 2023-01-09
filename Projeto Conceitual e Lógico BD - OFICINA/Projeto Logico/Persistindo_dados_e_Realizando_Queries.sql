-- Inserção de dados(Persistindo dados para teste do DB) & Queries

use Oficina;
show tables;
-- Persistindo dados na tabela Clientes;

insert into Clientes(Fname, Nome_meio, Lname, Contato, Email, Endereço, Cep, CPF, CNPJ_Cliente)
	values('Carlos', 'Pinto', 'Rocha', '18977585482', 'CarlosP.Rocha@armyspy.com', 'Rua Guararapes, 698 Andradina-SP', '16900-109', '81503317510',null),
		('Gabrielly', 'Almeida', 'Cardoso', '86945344820', 'GabriellyA.Cardoso@dayrep.com', 'Quadra Mocambinho - Setor B, 1133 Teresina-PI', '64010-220', '24764735296', null),
        ('Giovana', 'Martins', 'Sousa', '62982524985', 'GiovanaM.Sousa@jourrapide.com', 'Rua Raul Carramaschi, 538 Goiânia-GO', '74425-660', '60690566719', '47307237000183'),
        ('Kauã', 'Barros', 'Pereira', '16963054594', 'KauaB.Pereira@rhyta.com', 'Rua Rolando Rolemberg, 1768 São Carlos-SP', '13560-360', '67998698519', null),
        ('Igor', 'Martins', 'Cardoso', '65991705414', 'IgorM.C@jourrapide.com', 'Rua Três, 1254 Cuiabá-MT', '78068-348', '87395429800', null),
        ('Arthur', 'Barros', 'Gomes', '71925813810', 'ArthurBarrosG@jourrapide.com', '5ª Travessa da Amendoeira, 1117 Salvador-BA', '40290-695', '52500766888', '84429218000156'),
        ('Marina', 'Cardoso', 'Martins', '92924523165', 'MarinaCMartins@dayrep.com', 'Beco Santa Isabel, 780 Manaus-AM', '69035-740', '40760866198', '51928233000190'),
        ('Martim', 'Oliveira', 'Carvalho', '81949398262', 'MartimOliveira10@jourrapide.com', 'Rua Doutor Júlio Campelo, 1025 Recife-PE', '50680-360', '24995954260', null),
        ('Rodrigo', 'Souza', 'Alves', '11929785871', 'RodrigoS.Alves@jourrapide.com', 'Rua Guanapus, 1927 São Paulo-SP', '02244-050', '16490460572', '95342175000193'),
        ('Mariana', 'Santos', 'Costa', '11968797643', 'MarianaSantos08@armyspy.com', 'Rua Andrea Cesalpino, 398 São Paulo-SP', '02478-030', '97103202460', '85613543000137');


-- Persistindo dados na tabela Veículo;
-- Estilo enum('Carro', 'SUV & Crossover', 'Picape', 'Esportivo','Elétrico') default 'Carro',
insert into Veiculo(IdVeiculoCliente, Placa, Cor, Marca, Modelo, Ano, Estilo, Chassi) 
	values(1, 'NAG-6405', 'Preto', 'Chevrolet', 'Onix Plus 1.0T Premier', '2022', 'Carro', '255 2Y4Wek VA 4V7021'),
		  (1, 'IHJ-1880', 'Branco', 'Toyota', 'Hilux Diesel D/C STD POWER PACK', '2022', 'Picape', '8ut 05cAe9 AA 0a1945'),
          (2, 'HAG-8454', 'Prata', 'Toyota', 'TOYOTA YARIS XLS SEDAN 1.5 FLEX 16V 4P AUT.', '2020', 'Carro', '8pm 8cHB9f mp rx0587'),
          (3, 'HSN-3132', 'Branco', 'Toyota', 'COROLLA XEI 2.0 FLEX 16V AUT.', '2023', 'Carro', '8aE JNBLA2 1x 3A4446'),
          (4, 'JYW-9878', 'Cinza', 'Chevrolet', 'CHEVROLET TRACKER 1.2 TURBO FLEX PREMIER AUTOMATIC', '2020', 'SUV & Crossover', '7Y6 A1480n w7 AS3861'),
          (5, 'JGK-6245', 'Preto', 'Hyundai', 'HYUNDAI CRETA 2.0 16V FLEX PRESTIGE AUTOMÁTICO', '2017', 'SUV & Crossover', '46J 5233Fe E4 Ud6682'),
          (6, 'MZU-1844', 'Prata', 'Ford', 'FORD ECOSPORT 2.0 TITANIUM PLUS 16V FLEX 4P', '2015', 'SUV & Crossover', '5pR fASpdA NU Cx0513'),
          (7, 'KTW-1726', 'Prata', 'Nissan', 'NISSAN 370Z 3.7 V6 GASOLINA ROADSTER AUTOMÁTICO', '2011', 'Esportivo', '4WY tJzLXz X8 5t3909'),
          (7, 'MZY-4074', 'Cinza', 'Audi', 'AUDI E-TRON ELÉTRICO SPORTBACK', '2021', 'Elétrico', '34H Awm1jf 8U Ds1147'),
          (8, 'MQR-3459', 'Vermelho', 'Volkswagen', 'VOLKSWAGEN GOLF 1.6 MI SPORTLINE 8V FLEX 4P MANUAL', '2012', 'Carro', '87x ShmRb7 M6 AE2095'),
          (9, 'HXS-0966', 'Cinza', 'Fiat', 'FIAT STRADA 1.4 FIRE FLEX ENDURANCE CS MANUAL', '2020', 'SUV & Crossover', '23A 4AWaW3 UY 9p4390'),
          (10, 'LDV-5858', 'Branco', 'Mitsubishi', 'L200 TRITON 2.4 16V T DIESEL SPORT 4X4 AUTO', '2021', 'Picape', '1Mh ZXwgA4 AA M32009');


-- Persistindo dados na tabela Mecanico;
-- enum('Motor','Ar-Condicionado','Elétrica', 'Amortecedores & Suspensão', 'Performance', 'Bomba de Combustível', 'Amassados & Arranhões') default 'Motor'
insert into Mecanico(Fname_mecanico, Nome_meio_mecanico, Lname_mecanico, CPF_mecanico, Especialidade, Contato_Mecanico)
	values('Thiago', 'Silva', 'Pinto', '993.755.624-41', 'Motor', '54949873391'),
		  ('Douglas', 'Gonçalves', 'Costa', '991.014.064-00', 'Ar-Condicionado', '34987119768'),
          ('Fernanda', 'Azevedo', 'Correia', '652.587.876-48', 'Elétrica', '81998772752'),
          ('Bianca', 'Barros', 'Santos', '402.721.495-19', 'Amortecedores & Suspensão', '61933424374'),
          ('Renan', 'Oliveira', 'Cariani', '530.356.018-01', 'Performance', '27941936112'),
          ('Thomas', 'Rocha', 'Cavalcanti', '795.674.002-96', 'Bomba de Combustível', '55995406996'),
          ('Diego', 'Batista', 'Pereira', '530.574.049-52', 'Amassados & Arranhões', '82996644620');
          
 show databases;         
select * from Veiculo;
select * from Mecanico;
-- Persistindo dados na tabela Avaliacao_Mecanico;
-- Local_Avaliação enum('Residência Cliente', 'Oficina', 'Empresa do Cliente', 'Rua/Avenida') default 'Oficina',
insert into Avaliacao_Mecanico(IdVeiculoAvaliacao, IdMecanicoAvaliador, Local_Avaliação)
	values(37, 3, 'Oficina'),
		  (38, 3, 'Residência Cliente'),
          (39, 1, 'Empresa do Cliente'),
          (40, 2, 'Rua/Avenida'),
          (41, 4, 'Oficina'),
          (42, 5, 'Residência Cliente'),
          (43, 6, 'Rua/Avenida'),
          (44, 7, 'Empresa do Cliente'),
          (45, 3, 'Residência Cliente'),
          (46, 2, 'Oficina'),
          (47, 4, 'Oficina'),
          (48, 7, 'Rua/Avenida');

-- Persistindo dados na tabela Serviços;
-- enum('Revisão', 'Troca de Óleo', 'Conserto de Ar-condicionado', 'Remoção de amassados ou arranhões', 'Conserto de alguma parte elétrica',
-- Conserto no Motor', 'Upgrade de Performance', 'Troca/Conserto da Bomba de combustível', 'Amortecedor ou Suspensão','Troca de peças') default 'Revisão'
-- enum('Autorizado', 'Pendente', 'Não Autorizado') default 'Pendente'
insert into Serviços(Data_de_Solicitação, Tipo_de_Servico, Descrição, Status_Servico)
	values('2023-01-02', 'Revisão', 'É necessário realizar a revisão completa do veículo para a segurança do cliente.', 'Autorizado'),
		  ('2022-12-28', 'Conserto de Ar-condicionado', 'O Ar-Condicionado do veículo está precisando de reparo e troca de algumas peças para poder gelar novamente', 'Pendente'),
          ('2022-12-29', 'Conserto no Motor', 'Os bicos do motor precisam ser trocados para o motor voltar a funcionar.', 'Autorizado'),
          ('2022-11-30', 'Amortecedor ou Suspensão', 'Instalação de Suspensão a AR', 'Pendente'),
          ('2022-11-25', 'Conserto de alguma parte elétrica', 'É importante abrir o painel para poder fazer a troca de alguns cabos que estão partidos', 'Não Autorizado'),
          ('2023-01-05', 'Remoção de amassados ou arranhões', 'Precisa fazer polimento técnico no carro todo', 'Autorizado'),
          ('2023-01-08', 'Upgrade de Performance', 'Colocar 2 garrafas de NO2', 'Pendente'),
          ('2022-12-20', 'Troca/Conserto da Bomba de Combustível', 'Trocar a bomba de combustível, pois estourou a ligação para o motor', 'Não Autorizado'),
          ('2023-01-09', 'Troca de Óleo', 'Trocar o óleo, pois já esta no período certo de troca', 'Autorizado'),
          ('2022-06-24', 'Troca de peças', 'Trocar as velas do carro, pois estão queimadas', 'Pendente'),
          ('2022-12-18', 'Remoção de amassados ou arranhões', 'É necessário demonstar o parachoque para pintar e desamassar', 'Pendente');
          
-- QUERIES/CONSULTAS AOS DADOS;	
-- Selecionando tudo da tabela Clientes por ordem alfabética;
select * from Clientes order by Fname asc; 

-- Visualizando os funcionários(mecânicos da oficina);
select * from Mecanico order by Fname_Mecanico desc;

-- Selecionando nome completo, especialidade do mecânico e telefone apartir de uma especialidade solicitada;
select concat(Fname_mecanico, ' ', Lname_mecanico) as Nome_Completo, Especialidade as Especialista, Contato_Mecanico as Telefone
from Mecanico where Especialidade = 'Elétrica';

-- Selecionando todos os clientes que moram no estado de São Paulo;
select concat(Fname, ' ', Lname) as Nome_Cliente, CPF, Endereço from Clientes where Endereço like '%SP';

-- Somente os clientes que possuem CNPJ;
select concat(Fname, ' ', Lname) as Nome_Cliente, CPF, Endereço from Clientes where CNPJ_Cliente like '%';
 
 -- Recuperando informações dos carros dos clientes, cpf, cor do carro e nome do cliente; 
 select concat(Fname, ' ', Lname) as Nome_Cliente, CPF, Cor as Cor_Do_Carro, Modelo as Carro_Do_Cliente from 
	Clientes, Veiculo where Idclientes = IdVeiculoCliente order by Fname;
 
 -- Quantos carros pretos eu tenho registrado na oficina; 
select count(*) Cor from Veiculo Where Cor = 'Preto';

-- Quais são os clientes que residem no Estado de São Paulo e os seus respectivos carros;
select concat(Fname, ' ', Lname) as Nome_Cliente, Cor as Cor_Do_Carro, Modelo as Carro_Do_Cliente, Endereço 
 from Clientes, Veiculo where Endereço like '%SP' and Idclientes = IdVeiculoCliente order by Fname;
 
 -- Quais são os clientes que possuem mais de 1 carro cadastrado na oficina; 
 select concat(Fname, ' ', Lname) as Nome_Cliente  
	from Clientes, Veiculo where Idclientes = IdVeiculoCliente group by Nome_Cliente having count(*) > 1; 
 
 -- Qual o ano e o modelo dos carros registrados na oficina que são da marca Toyota; 
 select Modelo, Ano from Veiculo where Marca = 'Toyota';
 
 -- Quantos carros tem registrado na oficina que são da marca Toyota?
 select count(*) Marca from Veiculo where Marca = 'Toyota';

-- Ano pra saber quais são os carros mais novos e mais antigos registrados;
select Ano, Modelo, Cor from Veiculo order by Ano desc;

-- Quem é o dono do carro de modelo tal, onde ele mora, qual o telefone, placa tal, chassi tal, cor do carro;
select  concat(Fname, ' ', Nome_meio, ' ', Lname) as Nome_Completo_do_Cliente, Endereço, Contato as Telefone_do_Cliente, 
	Modelo as Modelo_Carro, Placa, Cor as Cor_do_Carro from Clientes inner join Veiculo on Idclientes = IdVeiculoCliente 
    order by Nome_Completo_do_Cliente; 

-- Quais foram os carros e onde foi o local da avaliação dos carros que a mecânica Fernanda, avaliou;
select Modelo as Veiculo_do_Cliente, Placa as Placa_do_Carro, Local_Avaliação, Fname_Mecanico as Mecânico_Avaliador
from Veiculo, Mecanico, Avaliacao_Mecanico
where IdMecanicoAvaliador = IdMecanico and IdVeiculo = IdVeiculoAvaliacao and Fname_Mecanico = 'Fernanda';

-- Quantos carros a mecânica Fernanda avaliou?
select Fname_Mecanico as Mecânico_Avaliador, count(*) as Qtde_Carros_Avaliados
from Veiculo, Mecanico, Avaliacao_Mecanico
where IdMecanicoAvaliador = IdMecanico and IdVeiculo = IdVeiculoAvaliacao and Fname_Mecanico = 'Fernanda';

-- Quantos carros foram avaliados na Oficina?
select Local_Avaliação, count(*) as Qtde_Carros
from Veiculo, Mecanico, Avaliacao_Mecanico
where IdMecanicoAvaliador = IdMecanico and IdVeiculo = IdVeiculoAvaliacao and Local_Avaliação = 'Oficina';

-- Quais serviços encontram-se com status de autorização do cliente como Pendente?
select Tipo_de_Servico, Data_de_Solicitação, Status_Servico from Serviços
where Status_Servico = 'Pendente';