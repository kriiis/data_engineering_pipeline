create database test_1;
use test_1;

create table test_table (
	test_id int auto_increment,
    FirstName varchar(255),
    City varchar(255),
    primary key (test_id)
    );
    
insert into test_table (FirstName, City)
values
("Joan", "Barcelona"),
("Tim", "Berlin");

select * from test_table;