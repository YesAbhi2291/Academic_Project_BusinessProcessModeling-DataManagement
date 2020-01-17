--Create table brokers
create table brokers(
broker_id integer constraint pk_broker_id primary key,
first_name char(20),
last_name char(20),
contact varchar(13),
email varchar(40)
);
--Create table amenties
create table amenities(
amenity_id integer constraint pk_amenity_id primary key,
amenity_name char(40) not null,
monthly_charges number(4,2)
);
--Create table buildings
create table buildings(
building_id char(1) constraint pk_building_id primary key,
building_name varchar(40) not null
);
--Create table apartments
create table apartments(
apartment_id varchar(20) constraint pk_apartment_id primary key,
building_id char(1) constraint fk_building_id references buildings(building_id) on delete cascade,
sold char(1) not null,
apartment_type varchar(20) not null
);
--Constraint to begin apartment_id with building_id
alter table apartments add constraint chk_apartment_id check( substr(apartment_id,1,1)=building_id);
--table Customers creation
create table customers (
customer_id integer constraint pk_cust_id primary key,
broker_id integer constraint fk_cust_broker references brokers(broker_id) not null,
apartment_id varchar(20) constraint fk_cust_apartment references apartments(apartment_id) not null,
first_name char(40) not null,
last_name char(40) not null,
contact varchar(13) not null,
email varchar(40) not null,
DOB date not null,
Marital_Status  char(10),
salary number(10,2) not null,
Family_members integer not null,
Balance_Due number(10,2) not null
);
--table staff creation
create table staff(
staff_id integer constraint pk_staff_id primary key,
building_id  char(1) constraint fk_building references buildings(building_id) on delete cascade,
manager_id  integer,
--integer constraint  fk_manager_id references staff_id(staff_id),
first_name char(40) not null,
last_name char(40) not null,
contact varchar(13) not null,
designation varchar(40) not null
);
--addition of constraint in staff(unary relationship)
alter table staff add  constraint fk_manager_id foreign key(manager_id) references staff(staff_id) ;
--create table transactions
create table transactions(
transaction_id varchar(10) constraint pk_transact_id primary key,
customer_id integer constraint fk_cust_id references customers(customer_id)  on delete cascade not null,
DoT date not null,
amount number(10,2));
--Not Null condition in amount
alter table transactions modify amount not null;
---create table complaints
create table complaints (
complaint_id varchar(10) constraint pk_complaint_id primary key,
customer_id integer constraint fk_cust_comp references customers(customer_id)  on delete cascade not null,
building_id  char(1) constraint fk_building_comp references buildings(building_id) not null,
description varchar(200) not null);
--table building_amenities creation
create table building_amenities(
building_id  char(1),
amenity_id integer ,
constraint pk_build_amenity primary key(building_id,amenity_id)
);
--creating constraints in building_amenities;
alter table building_amenities add constraint fk_build_amenity foreign key(building_id) references buildings(building_id)on delete cascade;
alter table building_amenities add constraint fk_amenity_build foreign key(amenity_id) references amenities(amenity_id) on delete cascade;









--tables Project_SQL.txt
--Displaying tables Project_SQL.txt.