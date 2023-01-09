show databases;
create database if not exists first_example;
use first_example;
CREATE TABLE person(
	person_id smallint unsigned,
	fname varchar(25),
	lname varchar(25),
	gender enum('M','F'),
	birth_date DATE,
	street varchar(30),
	city varchar (20),
	state varchar (20),
	country varchar (20),
	postal_code varchar (20),
    CONSTRAINT pk_person primary key (person_id)
    );
    desc person;
    
    
CREATE TABLE favorite_food (
	person_id smallint unsigned,
    food varchar(20), 
    constraint pk_favorite_food primary key (person_id,food),
    constraint fk_favorite_food_person_id foreign key (person_id) 
    references person(person_id)
    );
    desc favorite_food;
    
show databases;
select * from information_schema.table_constraints
where constraint_schema = 'first_example';


desc person;

insert into person values('2','Maria','Medeiros','F','2001-08-04','Rua de cima','Natal','RN','Brasil','59075-420');

select * from person;

delete from person where person_id=3; 

insert into favorite_food values('1','Smash burguer'),
								('2','Pizza');
                                
select * from favorite_food;       

delete from favorite_food where person_id=1                         