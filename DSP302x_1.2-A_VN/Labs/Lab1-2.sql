create database lab1;
use lab1;
drop table if exists INSTRUCTOR;
create table INSTRUCTOR(
	ins_id integer primary key not null,
	lastname varchar(30) not null,
	firstname varchar(30)  not null,
	city varchar(30),
	country char(2)	
);

insert into INSTRUCTOR (ins_id, lastname, firstname, city, country) values (1, 'Ahuja', 'Rav', 'Toronto', 'CA');

insert into INSTRUCTOR (ins_id, lastname, firstname, city, country) values (2, 'Chong', 'Raul', 'Toronto', 'CA'), (3, 'Vasudevan', 'Hima', 'Chicago', 'US');

select * from INSTRUCTOR;

update INSTRUCTOR set city = 'Markham' where lastname = 'Ahuja';

delete from INSTRUCTOR where lastname = 'Chong' and firstname = 'Raul';

select * from INSTRUCTOR;