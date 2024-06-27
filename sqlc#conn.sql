create database car_data;
use car_data;
create table car (
Id int primary key,
Brand varchar(250),
Year int,
Model varchar(250)

);
insert into car values(1,"Volvo",2017,"dddd"),(2,"Bmw",2023,"jjj");