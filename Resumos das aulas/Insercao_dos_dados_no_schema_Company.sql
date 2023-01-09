-- Inserção de dados no BD;

use company;
show tables;
select * from employee;
insert into employee values ('John','B','Smith', 123456789, '1965-01-09', '731-Fondren-Houston-TX', 'M', 30000, null, 5);

insert into employee values ('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638-Voss-Houston-TX', 'M', 40000,123456789, 5),
                            ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321-Castle-Spring-TX', 'F', 25000,333445555 , 4),
                            ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291-Berry-Bellaire-TX', 'F', 43000,null, 4),
                            ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975-Fire-Oak-Humble-TX', 'M', 38000, 987654321, 5),
                            ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631-Rice-Houston-TX', 'F', 25000, 987654321, 5),
                            ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980-Dallas-Houston-TX', 'M', 25000,123456789 , 4),
                            ('James', 'E', 'Borg', 888665555, '1937-11-10', '450-Stone-Houston-TX', 'M', 55000,333445555 , 1);

select * from dependent;
insert into dependent values (333445555, 'Alice', 'F', '1986-04-05', 'Daughter'),
							 (333445555, 'Theodore', 'M', '1983-10-25', 'Son'),
                             (333445555, 'Joy', 'F', '1958-05-03', 'Spouse'),
                             (987654321, 'Abner', 'M', '1942-02-28', 'Spouse'),
                             (123456789, 'Michael', 'M', '1988-01-04', 'Son'),
                             (123456789, 'Alice', 'F', '1988-12-30', 'Daughter'),
                             (123456789, 'Elizabeth', 'F', '1967-05-05', 'Spouse');

select * from departament;
insert into departament values ('Research', 5, 333445555, '1988-05-22','1986-05-22'),
							   ('Administration', 4, 987654321, '1995-01-01','1994-01-01'),
                               ('Headquarters', 1, 888665555,'1981-06-19','1980-06-19');

select * from dept_location;
insert into dept_location values (1, 'Houston'),
								 (4, 'Stafford'),
                                 (5, 'Bellaire'),
                                 (5, 'Sugarland'),
                                 (5, 'Houston');


select * from project;
insert into project values ('ProductX', 1, 'Bellaire', 5),
						   ('ProductY', 2, 'Sugarland', 5),
						   ('ProductZ', 3, 'Houston', 5),
                           ('Computerization', 10, 'Stafford', 4),
                           ('Reorganization', 20, 'Houston', 1),
                           ('Newbenefits', 30, 'Stafford', 4);

select * from works_on;
insert into works_on values (123456789, 1, 32.5),
							(123456789, 2, 7.5),
                            (666884444, 3, 40.0),
                            (453453453, 1, 20.0),
                            (453453453, 2, 20.0),
                            (333445555, 2, 10.0),
                            (333445555, 3, 10.0),
                            (333445555, 10, 10.0),
                            (333445555, 20, 10.0),
                            (999887777, 30, 30.0),
                            (999887777, 10, 10.0),
                            (987987987, 10, 35.0),
                            (987987987, 30, 5.0),
                            (987654321, 30, 20.0),
                            (987654321, 20, 15.0),
                            (888665555, 20, 0.0);                           

-- Queries 
-- gerente e seu departamento 

select Ssn, Fname, Dname from employee e, departament d where (e.Ssn = d.Mgr_ssn);

-- O emprego e o seu dependente
Select Fname, Dependent_name, Relationship from employee, dependent where Essn = Ssn;

-- Buscando a data de aniversário e o endereço de 1 empregado especifíco;
select Bdate, Address from employee 
	where Fname = 'John' AND Minit= 'B' And Lname = 'Smith';

-- Selecionando departamento especifíco 
select * from departament where Dname = 'Research';

-- Selecionando os empregados que trabalham no departamento de pesquisa;
select Fname,Lname, Address from employee, departament
	where Dname = 'Research' and Dnumber=Dno; 

-- Selecionando a identificação do empregado, o projeto que ele trabalha e a quantidade de horas trabalhadas;

select Pname, Essn, Fname, Hours from project, works_on, employee
	where Pnumber = Pno and Essn=Ssn;


-- Retirar a ambiguidade do Dnumber através do alias ou AS Statement;

select Dname, l.Dlocation  
	from departament as d, dept_location as l 
	where d.Dnumber = l.Dnumber;

-- Utilizando o concat, para colocar o primeiro e o segundo nome juntos;
select concat(Fname, ' ', Lname) as Nomes_completos from employee;


-- Expressões e alias 

-- Recolhendo o valor do INSS 
select Fname, Lname, Salary, round(Salary*0.011,2) AS  INSS from employee;

-- Definir o aumento de salário para os gerentes que trabalham no projeto associado ao ProductX;

select *
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno = p.Pnumber);
    
-- Aumento de salário de 10% aos empregados que trabalham no ProductX;
select concat(Fname,' ', Lname) as Complete_name, Salary, round(1.1*Salary,2) as increased_salary 
	from employee as e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname = 'ProductX');
    
-- Nome e endereço dos empregados que trabalham no departamento de pesquisa;
select concat(e.Fname, ' ', e.Lname) as Complete_name, e.Address
	from employee as e, departament as d 
		where d.DName = 'Research' and d.Dnumber = e.Dno;
-- Todas as informações da tabela employee que o salário do empregado seja entre 30 e 40 mil e trabalhem no departamento 5;
select * 
from employee
where (Salary between 30000 and 40000) and Dno=5;

-- Recuperando informações dos departamentos presentes em Stafford;

select Dname as Department_Name, Mgr_ssn as Manager_id, Address
 from departament as d, dept_location as l, employee as e
 where d.Dnumber = l.Dnumber and l.Dlocation='Stafford' and d.Mgr_ssn= e.Ssn;
 
 -- Recuperando todos os gerentes,departamentos e seus nomes;;
 select Dname as Department_Name, concat(e.Fname,' ',e.Lname) as Complete_name, Dlocation, Mgr_ssn as Manager_id
 from departament as d, dept_location as l, employee as e
 where d.Dnumber = l.Dnumber and d.Mgr_ssn= e.Ssn;
 
 -- Recuperando o número do projeto, o primeiro nome do gerente, endereço e data de aniversário do gerente 
 -- Em Stafford
 select Pname, Pnumber, Dnum, Fname, Address, Bdate, p.Plocation
	from departament as d, project as p, employee as e 
		where d.Dnumber = p.Dnum and p.Plocation ='Stafford' and d.Mgr_ssn= e.Ssn;
-- Utilizando operadores lógicos Like e Between

-- Recuperar informações de empregado, nome do departamento e endereço utilizando match parcial like
select concat(e.Fname,' ',e.Lname) as Complete_Name, Address, Dname as Departament_Name
	from employee as e, departament as d
		where (Dno=d.Dnumber and Address like '%Houston%') 