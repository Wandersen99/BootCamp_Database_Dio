create schema if not exists company;
use company;

create table if not exists employee(
	Fname varchar(15) NOT NULL, 
	Minit char,
	Lname varchar(15) NOT NULL,
	Ssn char(9) NOT NULL,
	Bdate date NOT NULL, 
	Address varchar(30),
	Sex char NOT NULL,
	Salary decimal(10,2) NOT NULL,
	Super_ssn char(9),
	Dno int NOT NULL,
    constraint chk_salary_employee check (Salary>2000.00),
	constraint pk_employee primary key (Ssn)
);

alter table employee 
	add constraint fk_employee
	foreign key (Super_ssn) references employee (Ssn)
    on delete set null
    on update cascade;
    
alter table employee modify Dno int not null default 1;
    
desc employee;

create table if not exists departament(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    Mgr_start_date date,
    Dept_create_date date,
    constraint chk_date_dept check (Dept_create_date <= Mgr_start_date),
    constraint pk_dept primary key (Dnumber), 
    constraint unique_name_dept Unique (Dname),
    foreign key(Mgr_ssn) references employee(Ssn)
);

alter table departament drop constraint departament_ibfk_1;
alter table departament 
	add constraint fk_dept foreign key (Mgr_ssn) references employee(Ssn)
    on update cascade;

desc departament;

create table if not exists dept_location(
	Dnumber int not null, 
    Dlocation varchar(15) not null,
    constraint pk_dept_locations primary key(Dnumber, Dlocation),
    constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
);

alter table dept_location drop constraint fk_dept_locations;
alter table dept_location
	add constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
    on delete cascade
	on update cascade;

create table if not exists project(
	Pname varchar(15) not null,
    Pnumber int not null,
    Plocation varchar(15),
	Dnum int not null,
    primary key (Pnumber),
    constraint unique_project unique(Pname),
    constraint fk_project foreign key (Dnum) references departament(Dnumber)
);

create table if not exists works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null, 
    primary key(Essn,Pno), 
    constraint fk_employee_works_on foreign key(Essn) references employee(Ssn),
    constraint fk_project_works_on foreign key(Pno) references project(Pnumber)
);
 
create table if not exists dependent(
	Essn char(9) not null, 
    Dependent_name varchar(15) not null, 
    Sex char, -- 'F', 'M'
    Bdate date, 
    Relationship varchar(8),
    primary key(Essn,Dependent_name),
    constraint fk_dependent foreign key(Essn) references employee(Ssn)
);

show tables;
desc employee;

select * from information_schema.table_constraints
	where constraint_schema = 'company';
    
-- drop table employee;
-- drop table departament;
-- drop table dept_location;
-- drop table project;
-- drop table works_on;
-- drop table dependent;