use company;
show tables;

-- Recuperando informações com Between
select Fname, Lname, Salary from employee where (Salary between 30000 and 40000);

select Fname, Lname from employee where (Salary >= 30000 and Salary <=40000);

-- Operadores lógicos 

select Bdate, Address from employee where Fname='John' and Minit='B' and Lname='Smith';

select * from departament where Dname='Research' or Dname='Administration';

select Fname, Lname from departament, employee where Dname='Research' and Dnumber=Dno;

-- subqueries 
-- Recuperando informação de quais projetos o empregado Smith esta trabalhando;

select distinct Pnumber from project 	
	where Pnumber in 
     (	select distinct Pno 
		from works_on, employee 
			where (Essn=Ssn and Lname = 'Smith')
            )
    or
	(	select Pnumber from project, departament, employee
			where (Mgr_ssn=Ssn and Lname='Smith' and Dnum=Dnumber)
				) ;

select distinct * from works_on
	where (Pno,Hours) in (select Pno, Hours from works_on 
						  where Essn=123456789);

-- Cláusulas com exists e unique 
-- Quais employees possuem dependentes?
select e.Fname, e.Lname from employee as e 
	where exists ( select * from dependent as d 
					where e.Ssn = d.Essn and Relationship = 'Daughter');

-- Employees que não possuem dependentes
select e.Fname, e.Lname from employee as e 
	where not exists ( select * from dependent as d 
					where e.Ssn = d.Essn);

-- Listar o nome dos gerentes que possuem pelo menos 1 dependente; 
select e.Fname, e.Lname from employee as e, departament as d
	where (e.Ssn=d.Mgr_ssn) and exists ( select * from dependent as d 
					where e.Ssn = d.Essn);
                    
-- Contando o número de dependentes para employee que possuem 2 ou mais dependentes;
select Fname,Lname from employee 
where (select count(*) from dependent where Ssn=Essn)>=1;

select distinct Essn,Pno from works_on where Pno in (1,2,3);
                  
-- Cláusulas de Ordenação

select * from employee order by Fname,Lnamet;

-- Nome do departamento, nome do gerente
select distinct d.Dname, concat (Fname,' ',Lname) as Manager 
	from departament as d, employee as e, works_on as w, project as p
	where (d.Dnumber= e.Dno and e.Ssn= d.Mgr_ssn and w.Pno = p.Pnumber)
    order by d.Dname, e.Fname, e.Lname; 

-- Recupero todos os empregados e seus projetos em andamento;
select distinct d.Dname as Departament, concat (Fname,' ',Lname) as Employee, p.Pname as Project_Name, w.Hours
	from departament as d, employee as e, works_on as w, project as p
		where (d.Dnumber = e.Dno and e.Ssn = w.Essn and w.Pno = p.Pnumber)
		order by d.Dname, e.Fname, e.Lname;

-- Estrutura da querie;
-- SELECT <attribute list> 
-- FROM <table list>
-- [WHERE <condition>]
-- [ORDER BY <EXPRESSION>]
-- [DESC | ASC];

-- Funções e cláusulas de agrupamento 

select * from employee;
select count(*) from employee;

select count(*) from employee, departament 
	where Dno=Dnumber and Dname = 'Research';

-- média salarial com base no número do departamento, ou seja, por departamento utilizando a tabela employee;
select Dno, count(*), round(avg(Salary),2)from employee
	group by Dno;

select Dno, count(*) as Number_of_employees, round(avg(Salary),2) as Salary_avg
	from employee
	group by Dno;

select Pnumber, Pname, count(*)
	from project, works_on
    where Pnumber=Pno 
    group by Pnumber,Pname;

-- Quantos salários diferentes eu tenho dentro da tabela employee;
select count(distinct Salary) from employee;

select sum(Salary) as total_salary, max(Salary) as max_salary, min(Salary) as min_salary, round(avg(Salary),2) as media_salary
from employee;

-- join será abordado no curso 5 

-- group by
-- para cada departamento recuperar a média salarial, o nome do departamento e os empregados

select Pnumber, Pname, count(*) as Number_of_register, round(avg(Salary),2) as avg_salary
	from project, works_on, employee
		where Pnumber = Pno and Ssn=Essn 
			group by Pnumber, Pname
            order by avg(Salary) desc;


select Pnumber, Pname, count(*)
	from project, works_on
    where Pnumber = Pno
    group by Pnumber, Pname
	having count(*) >2
    order by Pnumber;

select Dno, count(*)
	from employee 
    where Salary > 30000
    group by Dno
    having count(*)>=2;

select Dno as Departament, count(*) as Number_of_employees from employee 
	where Salary > 20000 and Dno in (select Dno from employee
									 group by Dno
									 having count(*)>=2)
    group by Dno;