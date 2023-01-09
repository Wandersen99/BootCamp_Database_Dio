-- Inserção de dados do projeto Nawstory

use nawstory;

show tables;

-- Preenchendo dados da tabela: Cliente
-- Fname, NomeDoMeio, Lname, Endereço, Email, Bdate, Numero_de_telefone
insert into Cliente (Fname, NomeDoMeio, Lname, Endereço, Email, Bdate, Numero_de_telefone)
	values('Cauã', 'Ribeiro', 'Cunha', 'Praça Horácio Pinto, 234 Cruzeiro-SP', 'CauaRibeiroCunha@dayrep.com', '1983-06-07', '(12) 9544-2031'),
		  ('Samuel', 'Souza', 'Cunha', 'Rua A, 852 Goiânia-GO', 'SamuelSouzaCunha@rhyta.com', '1987-12-06', '(62) 5849-7742'),
          ('Victor', 'Pinto', 'Almeida', 'Rua Bagé, 299 Várzea Paulista-SP', 'VictorPintoAlmeida@rhyta.com', '1981-05-07', '(11) 8071-7047'),
          ('Julieta', 'Azevedo', 'Almeida','Rua Santa Cecília, 539 Sete Lagoas-MG', 'JulietaAzevedoAlmeida@rhyta.com', '1989-05-19', '(31) 8703-4227'),
          ('Fernanda', 'Ferreira', 'Correia', 'Rua Doutor Moacir de Castro Xavier, 1695 Juiz de Fora-MG', 'FernandaFerreiraCorreia@dayrep.com', '1991-10-24', '(32) 2619-3248'),
          ('Larissa', 'Rocha', 'Pinto', 'Rua Silvério de Medeiros, 12 Três Rios-RJ', 'LarissaRochaPinto@dayrep.com', '2002-07-25', '(24) 7956-5152'),
          ('Beatrice', 'Azevedo', 'Ferreira', 'Rua Licínio dos Santos Conte, 112 Vitória-ES', 'BeatriceAzevedoFR@rhyta.com', '1983-09-10', '(27) 9175-3327');

-- Preenchendo dados da tabela pessoa física: 
-- CPF;
insert into Cliente_P_Fisica(CPF)
	values('33961751153'),
		  ('38024122499'),
          ('94210167002'),
          ('27108491516'),
          ('45343303404'),
          ('84414702003'),
          ('13543160290');

-- Preenchendo dados da tabela pessoa jurídica; 
-- CNPJ; 
insert into Cliente_P_Juridica(CNPJ)
	values('31444641000169'),
		  (null),
          (null),
          ('38267152000128'),
          (null),
          ('62168100000189'),
          ('81356164000158');

-- Preenchendo a tabela Produto;
-- 'Eletrônicos','Eletrodomésticos','Alimentos','Brinquedos','Roupas', 'Acessórios', 'Calçados','Cozinha','Móveis';
insert into Produto(Nome_do_Produto, categoria, avaliação, tamanho, preço, classificação_infantil, descrição)
	values('Lavadora Lavamax Eco 10kg', 'Eletrodomésticos', 4.5, '41D x 54.4W x 91.4H', 436.00, false, 'Lavadora Lavamax Eco 10kg 110V branca Suggar'),
		  ('Cafeteira Elétrica Cadence', 'Cozinha', 5.0, '14.9 x 19.3 x 25.5', 87.90, false, 'Cafeteira Elétrica Cadence Desperta Constrast 127V'),
          ('Apple iPhone 11', 'Eletrônicos', 5.0, '6.1 polegadas', 2999.00, false , 'Apple iPhone 11 (64 GB)'),
          ('Apple iPhone 14 Pro Max', 'Eletrônicos', 5.0, '6.7 polegadas', 10499.00, false, 'Apple iPhone 14 Pro Max (128 GB) – Roxo-profundo'),
          ('Hering Bermuda Masculina', 'Roupas', 0, 'XG', 79.99, false, 'Marca: Hering Bermuda Masculina Cargo Em Sarja, Cor: Preto'),
          ('Chinelo Slim Logo Metallic', 'Calçados', 5.0, '35/36', 44.99, false, 'Chinelo Slim Logo Metallic, Havaianas, feminino. Tamanho: 35/36. Cor: Azul Ashley.'),
          ('Whey Zero Lactose 250ml', 'Alimentos', 4.5, '250 ml', 5.39, false, 'Whey Zero Lactose Sabor Cacau Piracanjuba 250ml sem glúten.'),
          ('Massinhas De Modelar', 'Brinquedos', 4.0, '19 x 6.5 x 28', 40.41, true, 'Massinhas De Modelar - Estudio De Cabelereiro Batiki Modele E Crie Colorido. Marca: Batiki.'),
          ('Cadeira de Escritório', 'Móveis', 0, '52D x 52W x 120H', 699.00, false, 'Cadeira de Escritório Presidente Confortável Giratória. Marca: Genérico. Cor: Preto.'),
          ('Mini Carteira Feminina', 'Acessórios', 5.0, '10 x 7,5 x 01 cm', 53.90, false, 'Mini Carteira Feminina Porta Cartão Couro Legítimo Mariart 554. Cor: Preto.');
          
-- select * from Produto order by IdProduto;

-- Preenchendo Pedidos
-- 'Cancelado','Em processamento', 'Aprovado', 'Enviado', 'Entregue' default 'Em processamento'
insert into Pedidos(IdPedido_cliente, Status_do_pedido, Descrição_do_pedido, IdPagamento_pedido_cliente)
	values(1, 'Em processamento', 'Whey Zero Lactose 250ml', 5.39, 1),
		  (1, 'Em processamento', 'Apple iPhone 14 Pro Max', 10499.00, 1),
          (2, 'Aprovado', 'Apple iPhone 11', 2999.00, 2),
          (2, 'Aprovado', 'Apple iPhone 11', 2999.00, 2),
          (3, 'Enviado', 'Massinhas De Modelar', 40.41, 3),
          (4, 'Cancelado', 'Chinelo Slim Logo Metallic', 44.99, 4),
          (4, 'Cancelado', 'Mini Carteira Feminina',  53.90, 4),
          (5, 'Enviado', 'Cafeteira Elétrica Cadence', 87.90, 5),
          (6, 'Em processamento', 'Lavadora Lavamax Eco 10kg', 436.00, 6),
          (6, 'Em processamento', 'Cadeira de Escritório', 699.00, 6),
          (7, 'Aprovado', 'Hering Bermuda Masculina', 79.99, 7),
		  (7, 'Aprovado', 'Hering Bermuda Masculina', 79.99, 7);

-- Preenchendo a tabela Opções de Pagamento
-- Formas_De_Pagamento enum('Pix','Boleto','Cartão de Crédito', 'Cartão de Débito','Dois Cartões de Crédito') default 'Cartão de Crédito',
insert into Opcoes_Pagamentos(IdPagamentoCliente, Formas_De_Pagamento, IdPagamentoPix, IdPagamentoCredito, IdPagamentoBoleto, IdPagamentoDebito)
	values(1, 'Pix', 1, null, null, null),
		  (2, 'Cartão de Crédito', null, 2, null, null),
          (3, 'Cartão de Crédito', null, 3, null, null),
		  (4, 'Cartão de Crédito', null, 4, null, null),
          (5, 'Pix', 5, null, null, null),
          (6, 'Boleto', null, null, 6, null),
          (7, 'Cartão de Débito', null, null, null, 7);

-- Tipos_Chaves_Pix enum('Email','Telefone Celular','CPF','CNPJ','Chave Aleatória') default null,
-- Preenchendo a tabela Pix;
insert into Pix(Idpixcliente, Tipos_Chaves_Pix, Chave_Email, Chave_TelCelular, Chave_CPF, Chave_CNPJ, Chave_Aleatoria, Pagar_QrCode, Data_realizada)
	values(1, 'Email', 'CauaRibeiroCunha@dayrep.com', null, null, null, null, null, null),
		  (5, 'CPF', null, null, '45343303404', null, null, null, '2022-12-10');


-- Preenchendo a tabela Credito;
-- Status_pagamento enum ('Em Análise','Processando','Pagamento Efetuado','Recusado') default 'Em Análise'
insert into Credito(IdCardCreditClient, Nome_inscrito, Número_Card, Data_de_Validade, CVV, Status_pagamento)
	values(1, 'Cauã R Cunha', '5280653778943916', '2024-12-11', '190', 'Processando'),
		  (2, 'Samuel S Cunha','4099006627469134', '2023-05-12', '770', 'Pagamento Efetuado'),
          (3, 'Victor P Almeida', '6062828495487254', '2023-06-14', '845', 'Pagamento Efetuado'),
          (4, 'Julieta A Almeida', '3790078300397121', '2024-04-16', '756', 'Recusado');

-- Preenchendo a tabela Boleto;
insert into Boleto(IdBoletoCliente, Nome_banco, Data_de_vencimento, Data_de_emissão_boleto)
	values(6, 'Banco do Brasil', '2022-08-16', '2022-08-09'); 

-- Preenchendo a tabela de Cartão de Débito;
insert into Debito(IdDebitoCliente, Nome_inscrito_debito, Numero_card_debito, CVVD, Data_De_Validade_debito)
	values(6, 'Larissa R Pinto', '4024007144817169', '297', '2026-01-23'),
	      (7, 'Beatrice A Ferreira', '5262472587879365', '432', '2025-04-10');

-- Preenchendo a tabela de estoques de produtos, onde se localizam;
 insert into ProdutoEstoque(Localização_Produto, Quantidade)
	values('São Paulo', 2000),
		  ('Rio Grande do Norte', 1200),
		  ('Rio de Janeiro', 3000),
          ('Florianópolis', 1000),
          ('Curitiba', 3400); 
          
-- Preenchendo a tabela Fornecedores;
insert into Fornecedor(NomeSocial, CNPJ_Fornecedor, Contato_Tel)
	values('RB Eletrônicos', '85272147000193', '7924748233'),
		  ('Americanus', '48432545000101','9628263711'),
          ('Amason', '99442224000110', '3737485121'),
          ('Magalhu', '51280537000193', '5135156346'),
          ('Casas Bahêa', '17761251000191', '6731372613'),
          ('Riachãoelo', '82115629000141', '6620641917'),
          ('Sarah', '85962053000146', '3130165122');           
    
-- Preenchendo a tabela Vendedor;
insert into Vendedor(NomeSocial_Vendedor, CNPJ_Vendedor, CPF_Vendedor, Localização_Vendedor, Contato_Vendedor)
	values('Green Street Vendas', '61720860000194', null, 'Rua Samuel Freitas, 573 Porto Velho-RO 78923-360', '6933157835'),
		  ('WL Story', null, '12345678900', 'Rua Manoel Domingues, 1830 Teresina-PI 64003-073', '8621853761'),
          ('GB imports', null, '24108834941', 'Rua Manoel Honorato dos Santos, 1751 Suzano-SP 08696-330', '1199045498'),
          ('BlackDog Vendas', '33565550000107', null, 'Rua Iracema, 324 Fortaleza-CE 60870-020', '8583664611'),
          ('Shop Varejo', '82534732000126', '21816957178', 'Rua A, 1998 Indaiatuba-SP 13336-700', '1924097464'); 

-- Preenchendo a tabela Produto e Vendedor;
insert into ProdutoVendedor(IdPVendedor, idPproduto, prodQuantidade)
	values(1, 3, 200),
		  (1, 4, 300),
          (2, 5, 230),
          (2, 6, 400),
          (3, 2, 100),
          (3, 10, 75),
          (4, 1, 23),
          (4, 9, 30),
          (5, 7, 200),
          (5, 8, 100),
          (5, 3, 14); 

-- Preenchendo a tabela produto e pedido, a relação entre elas;
-- poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
insert into ProdutoPedido(IdPOproduto , IdPOpedido, poQuantidade, poStatus)
	values(7, 1, 1, 'Disponível'),
		  (4, 2, 1, 'Disponível'),
          (3, 3, 1, 'Disponível'),
          (3, 4, 1, 'Disponível'),
          (8, 5, 1, 'Disponível'),
          (6, 6, 1, 'Sem estoque'),
          (10, 7, 1, 'Sem estoque'),
          (2 , 8, 1, 'Disponível'),
          (1 , 9, 1, 'Disponível'),
          (9 , 10, 1, 'Disponível'),
          (5 , 11, 1, 'Disponível'),
          (5 , 12, 1, 'Disponível');

-- Preenchendo a tabela Localização do estoque dos produtos no estoque da Nawstory, 
insert into localização_Estoque(IdLproduto, IdLestoque, Localização_estoque)
	values(1, 1, 'São Paulo'),
		  (2, 1, 'São Paulo'),
          (3, 3, 'Rio de Janeiro'),
          (4, 3, 'Rio de Janeiro'),
          (5, 2, 'Rio Grande do Norte'),
          (6, 2, 'Rio Grande do Norte'),
          (7, 4, 'Florianópolis'),
          (8, 5, 'Curitiba'),
          (9, 5, 'Curitiba'),
          (10, 2, 'Rio Grande do Norte');

-- Preenchendo a tabela Produto fornecedor, que possibilita ver quais fornecedores fornecem os produtos que a nawstory vende;
insert into ProdutoFornecedor(IdPsFornecedor, IdPsProduto, Quantidade_produto_fornecedor)
	values(1, 3, 4000),
		  (1, 4, 5000),
          (2, 8, 3400),
          (3, 7, 10000),
          (4, 1, 2500),
          (4, 2, 3000),
          (5, 9, 10000),
          (6, 10, 30000),
          (6, 5, 10000),
          (7, 6, 20000);



-- Queries/ Consultas;

-- Relação de produtos fornecedores e estoques; E -- Relação de nomes dos fornecedores e nomes dos produtos;
select NomeSocial, CNPJ_Fornecedor, Nome_do_Produto, categoria, Quantidade_produto_fornecedor as Estoque_fornecedor from 
	Produto inner join ProdutoFornecedor inner join Fornecedor
	on IdFornecedor = IdPsFornecedor and Idproduto = IdPsProduto
    order by NomeSocial;
    
-- Produto e a localização do estoque dele; 
select Localização_estoque, Nome_do_Produto from 
	Produto inner join localização_Estoque 
    on IdProduto = IdLproduto
    order by localização_Estoque;

-- Clientes com CPF que possuem também CNPJ;
select concat(Fname,' ',Lname) as Nome_Completo, CNPJ, CPF 
		from Cliente_P_Juridica, Cliente, Cliente_P_Fisica
        where Idcliente = IdPfisica and Idcliente = IdPjuridica
        order by Nome_Completo;
-- Utilizando junção para trazer os clientes que possuem cnpj:
select concat(Fname,' ',Lname) as Nome_Completo, CNPJ
	from Cliente right join Cliente_P_Juridica on Idcliente = IdPjuridica; 
-- Selecionando os clientes que são pessoas físicas, recuperando com o CPF dos clientes informações; 
select concat(Fname,' ',Lname) as Nome_Completo, CPF from Cliente_P_Fisica, Cliente where IdPfisica = IdCliente order by Fname; 
-- Selecionando todos os registros da tabela Cliente;
select * from Cliente;
-- Selecionando todos os clientes que possuem o Lastname(Lname) Cunha;
select * from Cliente where Lname = 'Cunha';
--  Selecionando todos os clientes que possuem o Lastname(Lname) Almeida;
select * from Cliente where Lname = 'Almeida';
-- Lista de emails e telefones dos Clientes;
select Email, Numero_de_telefone from Cliente;
-- Selecionando Fname, Lname, (Nome completo) do cliente, Email, Numero_de_telefone da tabela Cliente, usando aliasing , orderby, concat, ordem alfabética; 
select concat(Fname,' ',Lname) as Nome_Completo, Email, Numero_de_telefone from Cliente order by Fname;
-- Ver com a data de aniversário quais são os clientes mais de idade mais avançada e os clientes mais novos; 
select concat(Fname,' ',Lname) as Nome_do_CLiente, Bdate as Data_de_Aniversário from Cliente order by Bdate desc;

-- Usando Operadores lógicos
-- Recuperando Email, Primeiro nome e último nome dos clientes que possuem último nome Almeida ou Cunha;
select Fname, Lname, Email from Cliente where Lname = 'Almeida' or Lname= 'Cunha';
-- Recuperando endereço e número de telefone de um cliente específico; 
select Endereço, Numero_de_telefone from Cliente where Fname = 'Beatrice' and Lname = 'Ferreira'; 

-- Quantos pedidos foram feitos por cada cliente?
select concat(Fname,' ',Lname) as Nome_Completo, Descrição_do_pedido, IdPedido, ValorTotal
	from Cliente, Pedidos
    where Idcliente = IdPedido_cliente ; 

-- Formas de pagamentos de cada cliente;
select concat(Fname,' ',Lname) as Nome_Completo, Formas_De_Pagamento
	from Cliente, Opcoes_Pagamentos
    where Idcliente = IdPagamentoCliente;

-- Todas as formas de pagamento disponíveis para esse Ecommerce: 
select concat(Fname,' ',Lname) as Nome_Completo, Formas_De_Pagamento
	from Cliente, Opcoes_Pagamentos
    where Idcliente = IdPagamentoCliente group by Formas_De_Pagamento;

-- Relação entre Vendedor, Produto e Estoque desse vendedor; 
select NomeSocial_Vendedor as Nome_do_Vendedor, Nome_do_Produto as Produto, prodQuantidade as Em_Estoque
	from ProdutoVendedor, Produto, Vendedor
	where idPproduto = IdProduto and IdVendedor = IdPVendedor
    order by Nome_do_Vendedor;

-- Pra saber quais são os vendedores que vendem mais de 3 produtos ou igual a 3; 
select NomeSocial_Vendedor as Nome_do_Vendedor, Nome_do_Produto as Produto, prodQuantidade as Em_Estoque
	from ProdutoVendedor, Produto, Vendedor
	where idPproduto = IdProduto and IdVendedor = IdPVendedor
    group by Nome_do_Vendedor
    having count(*)>= 3;
