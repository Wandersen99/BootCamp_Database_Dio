-- union, except e intersect 

create database teste;
use teste;

create table R(
	A char(2)
    );

create table S(
	A char(2)
    );

insert into R(A) values ('a1'),('a2'),('a2'),('a3');

insert into S(A) values ('a1'),('a1'),('a2'),('a3'),('a4'),('a5');

-- drop table S;
select * from R;

-- ex de except: (Os elementos que estão no atributo A que estão contidos apenas em S e não estão dentro de R;
select * from S where A not in (select A from R);

-- Union 
(select distinct R.A from R)
	UNION
    (select distinct S.A from S);
    
-- intersect
select distinct R.A from R where R.A in (select S.A from S); 


-- case statement 
use company;
select Fname, Salary, Dno from employee;

-- para realizar esse exemplo, é necessário desabillitar o safe mode
update employee set Salary = 
	case 	
		when Dno = 5 then Salary + 2000
        when Dno = 4 then Salary + 1500
        when Dno = 1 then Salary + 3000
        else Salary + 0
    end;
    
-- JOIN STATEMENT 
desc employee;
desc works_on;

select * from employee JOIN works_on;

-- JOIN ON -> INNER JOIN ON
select * from employee, works_on where Ssn=Essn;
-- Mesma informação;
select * from employee JOIN works_on on Ssn = Essn;

select * from employee JOIN departament on Ssn = Mgr_ssn;

select Fname, Lname, Address 
	from (employee join departament on Dno=Dnumber)
		where Dname = 'Research'; 

select * from dept_location; -- address e Dnumber
select * from departament;  -- Dname, Dept_create_Date 

select Dname as Department, Dept_create_date as StartDate, Dlocation as Location
	from departament inner join dept_location using (Dnumber)
    order by Dept_create_date;


-- CROSS JOHN (SEM ATRIBUTO DE JUNÇÃO) produto cartesiano 

select * from employee cross join dependent;

-- JOIN com mais de 3 tabelas


-- project, works_on e employee 
select concat(e.Fname,' ',e.Lname) as Complete_name, Dno as Dept_number, 
Pname as ProjectName, Pno as ProjectNumber, Plocation as Location from employee as e 
	inner join works_on as w on e.Ssn = w.Essn
    inner join project on Pno = Pnumber
    where Pname like 'Product%' 
    order by Pnumber;

-- departament, dept_location, employee

 select Dnumber, Dname, concat(Fname,' ',Lname) as Manager,
	Salary, round(Salary*0.05,2) as Bonus 
    from departament 
	inner join dept_location using (Dnumber)
	inner join employee on Ssn = Mgr_ssn
    group by Dnumber
    having count(*)>1; 
    

select Dnumber, Dname, concat(Fname,' ',Lname) as Manager,
	Salary, round(Salary*0.05,2) as Bonus 
    from departament 
	inner join dept_location using (Dnumber)
	inner join (dependent inner join employee on Ssn = Essn) on Ssn = Mgr_ssn
    group by Dnumber;
    
-- departament, project e employee
desc project;
select concat(Fname,' ',Lname) as Complete_Name, Dname as Departament_Name, Dnumber as Departament_Number,
	Pname as Project_Name, Pnumber as Project_Number 
    from employee inner join departament on Dno = Dnumber 
    inner join project on Dnum = Dnumber
    where Dname = 'Research'
    order by Project_Number;

-- OUTER JOIN

select * from employee;
select * from dependent;

select * from employee inner join dependent on Ssn= Essn;
select *  from employee left join dependent on Ssn = Essn;

