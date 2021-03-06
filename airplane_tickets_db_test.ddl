--Skrypt do testowania bazy danych AIRPLANE TICKETS 

-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2020-01-04 18:28:10 CET
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c

--PLANE_MANUFACTURER TABLE

--Inserting correct records
insert into plane_manufacturer
( plane_man_name, phone, email )
values
( 'Airbus', 48123456789, 'airbus@gmail.com' );

insert into plane_manufacturer
( plane_man_name, phone, email )
values
( 'Textron', 48321456789, 'textron@outlook.com' );

insert into plane_manufacturer
( plane_man_name, phone, email )
values
( 'Embraer', 48231456789, 'embraer@gmail.com' );

--Verification
select * from plane_manufacturer;

--Inserting incorrect records
--Wrong phone
insert into plane_manufacturer ( plane_man_name, phone, email ) values ( 'Pilatus', -48123456789, 'pilatus@gmail.com' );
insert into plane_manufacturer ( plane_man_name, phone, email ) values ( 'Pilatus', 0, 'pilatus@gmail.com' );

--Wrong plane_man_name
insert into plane_manufacturer ( plane_man_name, phone, email ) values ( 'Airbus', 45123456789, 'pilatus@gmail.com' );

--Verification
select * from plane_manufacturer;

--Updating records correctly
update plane_manufacturer
set
plane_man_name = 'Pilatus',
phone = 44123456789,
email = 'pilatus@gmail.com'
where lower(plane_man_name) = 'embraer';

--Verification
select * from plane_manufacturer;

--Updating records incorrectly
--Wrong phone
update plane_manufacturer
set
phone = -44123456789
where lower(plane_man_name) = 'pilatus';

update plane_manufacturer
set
phone = 0
where lower(plane_man_name) = 'pilatus';

--Wrong plane_man_name
update plane_manufacturer
set
plane_man_name = 'Airbus'
where lower(plane_man_name) = 'pilatus';

--Verification
select * from plane_manufacturer;

--Deleting records
delete from plane_manufacturer where plane_man_name='Airbus';

--Verification
select * from plane_manufacturer;
select * from planes where plane_man_name = 'Airbus';

-- -----------------------------------------------------------------------------------------------------------------------------

--TICKET_CLASS TABLE

--Inserting correct records
insert into ticket_class
(class_name, price_percentage)
values
('first', 100);

insert into ticket_class
(class_name, price_percentage)
values
('business', 80);

insert into ticket_class
(class_name, price_percentage)
values
('economy', 70);

--Verification
select * from ticket_class;

--Inserting incorrect records
--Wrong price_percentage
insert into ticket_class
(class_name, price_percentage)
values
('second', 0);

insert into ticket_class
(class_name, price_percentage)
values
('second', 101);

--Wrong class_name
insert into ticket_class
(class_name, price_percentage)
values
('first', 50);

--Verification
select * from ticket_class;

--Update records correctly
update ticket_class
set
class_name = 'economy_1',
price_percentage = 65
where class_name = 'economy';

--Verification
select * from ticket_class;

--Update records incorrectly
--Wrong price_percentage
update ticket_class
set
price_percentage = 0
where class_name = 'economy';

update ticket_class
set
price_percentage = 101
where class_name = 'economy';

--Wrong class_name
update ticket_class
set
class_name = 'business'
where class_name = 'economy';

--Verification
select * from ticket_class;

--Deleting records
delete from ticket_class where class_name='economy';

--Verification
select * from ticket_class;
select * from tickets where class_name = 'economy';

-- -----------------------------------------------------------------------------------------------------------------------------

--LUGGAGE_CLASS TABLE

--Inserting correct records
insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('small', 27, 14, 21, 20, 50);

insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('middle', 47, 34, 41, 40, 100);

insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('big', 67, 54, 51, 60, 150);

--Verification
select * from luggage_class;

--Inserting incorrect records
--Wrong max_height
insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('huge', 0, 54, 51, 60, 150);

insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('huge', -1, 54, 51, 60, 150);

--Wrong max_width
insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('huge', 67, 0, 51, 60, 150);

insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('huge', 67, -1, 51, 60, 150);

--Wrong max_lg_length
insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('huge', 67, 54, 0, 60, 150);

insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('huge', 67, 54, -1, 60, 150);

--Wrong max_weight
insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('huge', 67, 54, 61, 0, 150);

insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('huge', 67, 54, 61, -1, 150);

--Wrong price
insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('huge', 67, 54, 61, 61, 0);

insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('huge', 67, 54, 61, 61, -1);

--Wrong class_name
insert into luggage_class
(class_name, max_height, max_width, max_lg_length, max_weight, price)
values
('small', 67, 54, 61, 61, 300);

--Verification
select * from luggage_class;

--Updating records correctly
update luggage_class
set
class_name = 'huge',
max_height = 87,
max_width = 74,
max_lg_length = 87,
max_weight = 80,
price = 200
where class_name = 'big';

--Verification
select * from luggage_class;

--Updating records incorrectly
--Wrong max_height
update luggage_class
set
max_height = 0
where class_name ='small';

update luggage_class
set
max_height = -1
where class_name ='small';

--Wrong max_width
update luggage_class
set
max_width = 0
where class_name ='small';

update luggage_class
set
max_width = -1
where class_name ='small';

--Wrong max_lg_length
update luggage_class
set
max_lg_length = 0
where class_name ='small';

update luggage_class
set
max_lg_length = -1
where class_name ='small';

--Wrong max_weight
update luggage_class
set
max_weight = 0
where class_name ='small';

update luggage_class
set
max_weight = -1
where class_name ='small';

--Wrong price
update luggage_class
set
price = 0
where class_name ='small';

update luggage_class
set
price = -1
where class_name ='small';

--Wrong class_name
update luggage_class
set
class_name = 'middle'
where class_name ='small';

--Verification
select * from luggage_class;

--Deleting records
delete from luggage_class where class_name='small';

--Verification
select * from luggage_class;
select * from luggage where class_name = 'small';

-- -----------------------------------------------------------------------------------------------------------------------------

--PLANES TABLE

--Inserting correct records
insert into planes
(plane_reg_number, plane_model, max_pass_number, plane_man_name)
values
(123, 'AT49', 5, 'Pilatus');

insert into planes
(plane_reg_number, plane_model, max_pass_number, plane_man_name)
values
(456, 'CB75', 20, 'Textron');

insert into planes
(plane_reg_number, plane_model, max_pass_number, plane_man_name)
values
(789, 'UZ194', 30, 'Airbus');

insert into planes
(plane_reg_number, plane_model, max_pass_number, plane_man_name)
values
(321, 'YS27', 40, 'Pilatus');

--Verification
select * from planes;

--Inserting incorrect records
--Wrong plane_reg-number
insert into planes
(plane_reg_number, plane_model, max_pass_number, plane_man_name)
values
(0, 'GT27', 100, 'Pilatus');

insert into planes
(plane_reg_number, plane_model, max_pass_number, plane_man_name)
values
(-1, 'GT27', 100, 'Pilatus');

insert into planes
(plane_reg_number, plane_model, max_pass_number, plane_man_name)
values
(123, 'GT27', 100, 'Pilatus');

--Wrong max_pass_number
insert into planes
(plane_reg_number, plane_model, max_pass_number, plane_man_name)
values
(159, 'GT27', 0, 'Pilatus');

insert into planes
(plane_reg_number, plane_model, max_pass_number, plane_man_name)
values
(159, 'GT27', -1, 'Pilatus');

--Verification
select * from planes;

--Updating records correctly
update planes
set 
plane_reg_number = 753,
plane_model = 'GB987',
max_pass_number = 15,
plane_man_name = 'Airbus'
where
plane_reg_number = 123;

--Verification
select * from planes;

--Updating records incorrectly
--Wrong plane_reg_number
update planes
set 
plane_reg_number = 0
where
plane_reg_number = 753;

update planes
set 
plane_reg_number = -1
where
plane_reg_number = 753;

update planes
set 
plane_reg_number = 456
where
plane_reg_number = 753;

--Wrong max_pass_number
update planes
set 
max_pass_number = 0
where
plane_reg_number = 753;

update planes
set 
max_pass_number = -1
where
plane_reg_number = 753;

--Verification
select * from planes;

--Deleting records
delete from planes where plane_reg_number=456;

--Verification
select * from planes;
select * from flights where plane_reg_number=456;

-- -----------------------------------------------------------------------------------------------------------------------------

--EXTRA_BONUS_SERVICES TABLE

--Inserting correct records
insert into extra_bonus_services
(service_name, bonus_points)
values
('Me and my dog', 20);

insert into extra_bonus_services
(service_name, bonus_points)
values
('Breakfast', 10);

insert into extra_bonus_services
(service_name, bonus_points)
values
('Lunch', 10);

insert into extra_bonus_services
(service_name, bonus_points)
values
('Dinner', 15);

insert into extra_bonus_services
(service_name, bonus_points)
values
('Drinks', 15);

insert into extra_bonus_services
(service_name, bonus_points)
values
('Surprise', 30);

--Verification
select * from extra_bonus_services;

--Inserting incorrect records
--Wrong bonus_points
insert into extra_bonus_services
(service_name, bonus_points)
values
('Something special', 0);

insert into extra_bonus_services
(service_name, bonus_points)
values
('Something special', -1);

--Wrong service_name
insert into extra_bonus_services
(service_name, bonus_points)
values
('Surprise', 50);

--Verification
select * from extra_bonus_services;

--Updating records correctly
update extra_bonus_services
set
service_name = 'Surprise me',
bonus_points = 35
where service_name = 'Surprise';

--Verification
select * from extra_bonus_services;

--Updating records incorrectly
--Wrong bonus_points
update extra_bonus_services
set
service_name = 'Special offer',
bonus_points = 0
where service_name = 'Surprise me';

update extra_bonus_services
set
service_name = 'Special offer',
bonus_points = -1
where service_name = 'Surprise me';

--Wrong service_name
update extra_bonus_services
set
service_name = 'Lunch',
bonus_points = 15
where service_name = 'Surprise me';

--Verification
select * from extra_bonus_services;

--Deleting records
delete from extra_bonus_services where service_name='Dinner';

--Verification
select * from extra_bonus_services;

-- -----------------------------------------------------------------------------------------------------------------------------

--PASSENGERS TABLE

--Inserting correct records
insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('AAA', 'Napoleon', 'Bonaparte', 
to_date('1769/08/15', 'yyyy/mm/dd'), to_date('2014/08/16', 'yyyy/mm/dd'), to_date('2024/08/16', 'yyyy/mm/dd'), 'FR');

insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('BBB', 'Joseph', 'Stalin', 
to_date('1878/12/18', 'yyyy/mm/dd'), to_date('2018/12/19', 'yyyy/mm/dd'), to_date('2028/12/19', 'yyyy/mm/dd'), 'RU');

insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('CCC', 'Jack', 'Nelson', 
to_date('1946/06/14', 'yyyy/mm/dd'), to_date('2016/06/15', 'yyyy/mm/dd'), to_date('2026/06/15', 'yyyy/mm/dd'), 'US');

insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('HHH', 'Kim', 'Kim', 
to_date('1984/01/08', 'yyyy/mm/dd'), to_date('2012/01/09', 'yyyy/mm/dd'), to_date('2022/01/09', 'yyyy/mm/dd'), 'KP');

insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('DDD', 'Isaac', 'Newton', 
to_date('1643/01/04', 'yyyy/mm/dd'), to_date('2017/01/05', 'yyyy/mm/dd'), to_date('2027/01/05', 'yyyy/mm/dd'), 'GB');

insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('EEE', 'Albert', 'Einstein', 
to_date('1879/03/14', 'yyyy/mm/dd'), to_date('2019/03/15', 'yyyy/mm/dd'), to_date('2029/03/15', 'yyyy/mm/dd'), 'GB');

insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('GGG', 'Bill', 'Jason', 
to_date('1955/10/28', 'yyyy/mm/dd'), to_date('2017/10/29', 'yyyy/mm/dd'), to_date('2027/10/29', 'yyyy/mm/dd'), 'US');

insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('FFF', 'Alexander', 'The Great', 
to_date('356/06/01', 'yyyy/mm/dd'), to_date('2019/06/02', 'yyyy/mm/dd'), to_date('2029/06/02', 'yyyy/mm/dd'), 'GR');

insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('III', 'Karl', 'Marx', 
to_date('1818/05/05', 'yyyy/mm/dd'), to_date('2018/05/06', 'yyyy/mm/dd'), to_date('2028/05/06', 'yyyy/mm/dd'), 'GB');

insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('JJJ', 'Friedrich', 'Nietzsche', 
to_date('1844/10/15', 'yyyy/mm/dd'), to_date('2015/10/16', 'yyyy/mm/dd'), to_date('2025/10/16', 'yyyy/mm/dd'), 'GB');

--Verification
select * from passengers;

--Inserting incorrect records
--Wrong passport_number
insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('JJJ', 'O.', 'Henry', 
to_date('1844/10/15', 'yyyy/mm/dd'), to_date('2015/10/16', 'yyyy/mm/dd'), to_date('2025/10/16', 'yyyy/mm/dd'), 'US');

--Wrong birth_date
insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('JJJ', 'O.', 'Henry', 
to_date('2016/10/15', 'yyyy/mm/dd'), to_date('2015/10/16', 'yyyy/mm/dd'), to_date('2025/10/16', 'yyyy/mm/dd'), 'US');

--Wrong passport_issue
insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('JJJ', 'O.', 'Henry', 
to_date('2000/10/15', 'yyyy/mm/dd'), to_date('2015/10/16', 'yyyy/mm/dd'), to_date('2010/10/16', 'yyyy/mm/dd'), 'US');

--Verification
select * from passengers;

--Updating records correctly
update passengers
set
passport_number = 'RRR',
pass_name = 'Sigmund',
surname = 'Freud',
birth_date = to_date('1856/05/06', 'yyyy/mm/dd'),
passport_issue = to_date('2018/05/07', 'yyyy/mm/dd'),
passport_expiration = to_date('2028/05/07', 'yyyy/mm/dd'),
country_code = 'AT'
where passport_number = 'JJJ'; 

--Verification
select * from passengers;

--Updating records incorrectly
--Wrong passport_number
update passengers
set
passport_number = 'EEE'
where passport_number = 'RRR'; 

--Wrong birth_date
update passengers
set
birth_date = to_date('2020/01/01', 'yyyy/mm/dd')
where passport_number = 'RRR'; 

--Wrong passport_issue
update passengers
set
passport_issue = to_date('2030/01/01', 'yyyy/mm/dd')
where passport_number = 'RRR'; 

--Verification
select * from passengers;

--Deleting records
delete from passengers where passport_number='AAA';

--Verification
select * from passengers;
select * from tickets where passport_number='AAA';

-- -----------------------------------------------------------------------------------------------------------------------------

--FLIGHTS TABLE

--Inserting correct records
call insert_flight(
'123AC', 'MAD', 'EZE',
to_date('2020/01/11 15:30', 'yyyy/mm/dd hh24:mi'), to_date('2020/01/12 00:45', 'yyyy/mm/dd hh24:mi'),
800, 321);

call insert_flight(
'345DG', 'LHR', 'MIA',
to_date('2020/01/25 09:20', 'yyyy/mm/dd hh24:mi'), to_date('2020/01/25 17:50', 'yyyy/mm/dd hh24:mi'),
1000, 789);

call insert_flight(
'456JR', 'KTW', 'MBJ',
to_date('2020/02/17 07:05', 'yyyy/mm/dd hh24:mi'), to_date('2020/02/17 15:20', 'yyyy/mm/dd hh24:mi'),
400, 456);

call insert_flight(
'789KM', 'KRK', 'HAV',
to_date('2020/02/27 00:05', 'yyyy/mm/dd hh24:mi'), to_date('2020/02/27 07:10', 'yyyy/mm/dd hh24:mi'),
500, 321);

call insert_flight(
'891SU', 'TXL', 'GIG',
to_date('2020/03/01 18:00', 'yyyy/mm/dd hh24:mi'), to_date('2020/03/02 04:15', 'yyyy/mm/dd hh24:mi'),
700, 321);

--Verification
select * from flights;

--Inserting incorrect records
--Wrong flight number
call insert_flight(
'891SU', 'HAV', 'GIG',
to_date('2020/03/01 18:00', 'yyyy/mm/dd hh24:mi'), to_date('2020/03/02 04:15', 'yyyy/mm/dd hh24:mi'),
700, 789);

--Wrong origin-destination airports
call insert_flight(
'812AU', 'GIG', 'GIG',
to_date('2020/04/01 18:00', 'yyyy/mm/dd hh24:mi'), to_date('2020/04/02 04:15', 'yyyy/mm/dd hh24:mi'),
700, 321);

--Wrong departure-arrival dates
call insert_flight(
'812AU', 'HAV', 'GIG',
to_date('2020/03/01 18:00', 'yyyy/mm/dd hh24:mi'), to_date('2020/03/01 04:15', 'yyyy/mm/dd hh24:mi'),
700, 789);

--Wrong price

call insert_flight(
'812AU', 'HAV', 'GIG',
to_date('2020/05/01 18:00', 'yyyy/mm/dd hh24:mi'), to_date('2020/05/02 04:15', 'yyyy/mm/dd hh24:mi'),
0, 789);

call insert_flight(
'812AU', 'HAV', 'GIG',
to_date('2020/05/01 18:00', 'yyyy/mm/dd hh24:mi'), to_date('2020/05/02 04:15', 'yyyy/mm/dd hh24:mi'),
-1, 789);

--Verification
select * from flights;

--Updating records correctly
call update_flight(
'101SY', 'GIG', 'TXL',
to_date('2020/06/05 15:00', 'yyyy/mm/dd hh24:mi'), to_date('2020/06/06 01:10', 'yyyy/mm/dd hh24:mi'),
750, 456);

--Verification
select * from flights;

--Updating records incorrectly
--Wrong departure-destination airports
call update_flight(
'101SY', 'GIG', 'GIG',
to_date('2020/06/05 15:00', 'yyyy/mm/dd hh24:mi'), to_date('2020/06/06 01:10', 'yyyy/mm/dd hh24:mi'),
750, 456);

--Wrong departure-arrival dates
call update_flight(
'101SY', 'GIG', 'TXL',
to_date('2020/06/05 15:00', 'yyyy/mm/dd hh24:mi'), to_date('2020/06/05 01:10', 'yyyy/mm/dd hh24:mi'),
750, 456);

--Wrong price
call update_flight(
'101SY', 'GIG', 'TXL',
to_date('2020/06/05 15:00', 'yyyy/mm/dd hh24:mi'), to_date('2020/06/06 01:10', 'yyyy/mm/dd hh24:mi'),
0, 456);

call update_flight(
'101SY', 'GIG', 'TXL',
to_date('2020/06/05 15:00', 'yyyy/mm/dd hh24:mi'), to_date('2020/06/06 01:10', 'yyyy/mm/dd hh24:mi'),
-1, 456);

--Verification
select * from flights;

--Deleting records
delete from flights where flight_number='456JR';

--Verification
select * from flights;
select * from tickets where flight_number='456JR';

-- -----------------------------------------------------------------------------------------------------------------------------

--TICKETS TABLE

--Inserting correct records
call insert_ticket(
'12AB', '123AC', 'business', 'FFF', 'Dinner');

call insert_ticket(
'23AB', '123AC', 'economy', 'EEE', 'Me and my dog');

call insert_ticket(
'34AB', '123AC', 'first', 'RRR', 'Drinks');

call insert_ticket(
'12CD', '345DG', 'first', 'GGG', 'Lunch');

call insert_ticket(
'12EF', '456JR', 'economy', 'III', 'Drinks');

call insert_ticket(
'23EF', '456JR', 'business', 'CCC', 'Breakfast');

call insert_ticket(
'12GH', '789KM', 'business', 'AAA', 'Lunch');

call insert_ticket(
'23GH', '789KM', 'business', 'BBB', 'Dinner');

call insert_ticket(
'34GH', '789KM', 'economy', 'RRR', 'Me and my dog');

call insert_ticket(
'45GH', '789KM', 'first', 'DDD', 'Drinks');

call insert_ticket(
'56GH', '789KM', 'first', 'GGG', 'Drinks');

call insert_ticket(
'23CD', '345DG', 'first', 'GGG', 'Drinks');

--Verification
select * from tickets;

--Inserting incorrect records
--Wrong ticket number
call insert_ticket(
'56GH', '789KM', 'first', 'GGG', 'Drinks');

--Wrong passenger birth date
insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('XXX', 'John', 'Smith', 
to_date('2021/01/01', 'yyyy/mm/dd'), to_date('2021/10/01', 'yyyy/mm/dd'), to_date('2025/11/01', 'yyyy/mm/dd'), 'US');

call insert_ticket(
'56AB', '123AC', 'first', 'XXX', 'Drinks');

--Wrong passenger passport issue date
update passengers
set
birth_date = to_date('1990/01/01', 'yyyy/mm/dd'),
passport_issue = to_date('2021/10/01', 'yyyy/mm/dd')
where passport_number='XXX';

call insert_ticket(
'56AB', '123AC', 'first', 'XXX', 'Drinks');

--Wrong passenger passport expiration date
update passengers
set
passport_issue = to_date('2000/10/01', 'yyyy/mm/dd'),
passport_expiration = to_date('2010/10/01', 'yyyy/mm/dd')
where passport_number='XXX';

call insert_ticket(
'56AB', '123AC', 'first', 'XXX', 'Drinks');

--Exceed max tickets number
call insert_ticket(
'56AB', '789KM', 'first', 'CCC', 'Drinks');

--Verification
select * from tickets;

--Updating records correctly
call update_ticket(
'12EF', '456JR', 'business', 'DDD', 'Surprise me');

--Updating records incorrectly
--Wrong passenger birth date
insert into passengers
(passport_number, pass_name, surname, birth_date, passport_issue, passport_expiration, country_code)
values
('YYY', 'Jane', 'Smith', 
to_date('2025/01/01', 'yyyy/mm/dd'), to_date('2026/10/01', 'yyyy/mm/dd'), to_date('2027/11/01', 'yyyy/mm/dd'), 'US');

call update_ticket(
'34AB', '123AC', 'first', 'YYY', 'Drinks');

--Wrong passenger passport issue date
update passengers
set
birth_date = to_date('1990/01/01', 'yyyy/mm/dd'),
passport_issue = to_date('2023/10/01', 'yyyy/mm/dd')
where passport_number='YYY';

call update_ticket(
'34AB', '123AC', 'first', 'YYY', 'Drinks');

--Wrong passenger passport expiration date
update passengers
set
passport_issue = to_date('2000/10/01', 'yyyy/mm/dd'),
passport_expiration = to_date('2010/10/01', 'yyyy/mm/dd')
where passport_number='YYY';

call update_ticket(
'34AB', '123AC', 'first', 'YYY', 'Drinks');

--Exceed max tickets number
call update_ticket(
'34AB', '789KM', 'first', 'III', 'Drinks');

--Verification
select * from tickets;

--Deleting records
delete from tickets where ticket_number='34GH';

--Verification
select * from tickets;
select * from luggage where ticket_number='34GH';

-- -----------------------------------------------------------------------------------------------------------------------------

--LUGGAGE TABLE

--Inserting correct records
insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('1ABC', 20, 10, 15, 10, 'small', '23AB');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('2ABC', 10, 5, 15, 5, 'small', '12GH');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('3ABC', 40, 30, 40, 40, 'middle', '12GH');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('4ABC', 5, 10, 5, 2, 'small', '45GH');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('5ABC', 35, 15, 30, 29, 'middle', '45GH');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('6ABC', 60, 50, 50, 50, 'big', '45GH');

--Verification
select * from luggage;

--Inserting incorrect records
--Wrong height
insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('7ABC', 0, 50, 50, 50, 'big', '45GH');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('7ABC', -1, 50, 50, 50, 'big', '45GH');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('7ABC', 68, 50, 50, 50, 'big', '45GH');

--Wrong width
insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('7ABC', 60, 0, 50, 50, 'big', '45GH');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('7ABC', 60, -1, 50, 50, 'big', '45GH');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('7ABC', 60, 55, 50, 50, 'big', '45GH');

--Wrong lg_length
insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('7ABC', 60, 50, 0, 50, 'big', '45GH');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('7ABC', 60, 50, -1, 50, 'big', '45GH');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('7ABC', 60, 50, 65, 50, 'big', '45GH');

--Wrong weight
insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('7ABC', 60, 50, 50, 0, 'big', '45GH');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('7ABC', 60, 50, 50, -1, 'big', '45GH');

insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('7ABC', 60, 50, 50, 70, 'big', '45GH');

--Wrong luggage_id
insert into luggage
(luggage_id, height, width, lg_length, weight, class_name, ticket_number)
values
('6ABC', 60, 50, 50, 20, 'big', '45GH');

--Verification
select * from luggage;

--Updating records correctly
update luggage
set
height = 41,
width = 32,
lg_length = 35,
weight = 32,
class_name = 'middle'
where luggage_id = '2ABC';

--Verification
select * from luggage_class;

--Updating records incorrectly
--Wrong height
update luggage
set
height = 0
where luggage_id = '2ABC';

update luggage
set
height = -1
where luggage_id = '2ABC';

update luggage
set
height = 100
where luggage_id = '2ABC';

--Wrong width
update luggage
set
width = 0
where luggage_id = '2ABC';

update luggage
set
width = -1
where luggage_id = '2ABC';

update luggage
set
width = 100
where luggage_id = '2ABC';

--Wrong lg_length
update luggage
set
lg_length = 0
where luggage_id = '2ABC';

update luggage
set
lg_length = -1
where luggage_id = '2ABC';

update luggage
set
lg_length = 100
where luggage_id = '2ABC';

--Wrong weight
update luggage
set
weight = 0
where luggage_id = '2ABC';

update luggage
set
weight = -1
where luggage_id = '2ABC';

update luggage
set
weight = 100
where luggage_id = '2ABC';

--Wrong luggage_id
update luggage
set
luggage_id = '1ABC'
where luggage_id = '2ABC';

--Verification
select * from luggage;

--Deleting records
delete from luggage where luggage_id='3ABC';

--Verification
select * from luggage;
