#database creation
create database Trip_planner;
use Trip_planner;
#user table
create table user(
user_id int(15) primary key,
user_name varchar(20) not null,
user_email varchar(20),
user_aadharno bigint(23),
user_phno bigint(20) 
);
#data insertion into user table
insert into user values(1,"Harish","hari@gmail.com",345528397,987689789),(2,"ram","ram@gmail.com",38628897,787689789),
(3,"rajesh","rajesh@gmail.com",478283897,798689789),(4,"lokesh","loki@gmail.com",4482833983,898689834),
(5,"rakesh","rakjesh@gmail.com",38494839,937389789),(6,"syed","syed@gmail.com",899984,788689733),
(7,"sadhik","sadhik@gmail.com",03893037,8689789),(8,"rupeesh","rupeesh@gmail.com",032828897,908689789),
(9,"nadeem","nade@gmail.com",78993897,878689789),(10,"dileep","dileep@gmail.com",987083897,698689789),
(11,"ganesh","ganesh@gmail.com",0990478747,899483938),(12,"niklesh","niklesh@gmail.com",90777383897,790484009),
(13,"bheem","bheem@gmail.com",896865743,38407504),(14,"pullarao","puli@gmail.com",788283897,79789789),
(15,"bhanuesh","bha@gmail.com",0807583897,98659789),(16,"sita","sita@gmail.com",397994774,974960979),
(17,"sindhu","sindhu@gmail.com",8970883897,098964187),(18,"bhargavi","bhargavi@gmail.com",9809283897,099689789),
(19,"somesh","som@gmail.com",897283897,709808687),(20,"ramu","ramu@gmail.com",9098283687,908689789),
(21,"lakshmi","lak@gmail.com",977083687,868689789),(22,"harika","harika@gmail.com",233083687,128689789),
(23,"punnamma","pun@gmail.com",977078687,799689789),(24,"pojjitha","poj@gmail.com",9798783687,09868789),
(25,"ramya","ramya@gmail.com",977045777,097986789);
select * from user;
#trips table
create table trips(
trip_id int primary key,
trip_place varchar(25) not null,
trip_location varchar(25) not null,
trip_in_india enum("yes","no"),
trip_cost int not null);
#data insertion into trips table
insert into trips values(101,"tirumala","chittor",1,10000),(102,"kasi","uttar pradesh",1,19000),
(103,"ayodhya","uttar pradesh",1,17000),(104,"puri","odisha",1,30000),
(105,"paradise beach","pondicherry",1,25000),(106,"seaside","pondicherry",1,15000),
(107,"paradise beach","pondicherry",1,17000),(108,"seaside","pondicherry",1,18000),
(109,"rock beach","pondicherry",1,30000),(110,"rock beach","pondicherry",1,30000),
(111,"serenity","pondicherry",1,20000),(112,"boat house","pondicherry",1,16000),
(113,"auro beach","pondicherry",1,10000),(114,"badrikashrama","Himachal pradesh",1,10000),
(115,"badrikashrama","Himachal pradesh",1,40000),(116,"kurukshetra","haryana",1,80000),
(117,"kurukshetra","haryana",1,70000),(118,"Peter's Basilica","vatican city",2,90000),
(119,"mecca","masjid",2,90000),(120,"bali","indonesia",2,95000),(121,"kerry","ireland",2,85000),
(122,"marrakesh","morocco",2,97000),(123,"paris","france",2,78000),
(124,"cape town","south africa",2,60000),(125,"roma","italy",2,90000);
#offer table
create table offer(
offer_id int primary key,
offer_name varchar(30),
offer_description varchar(40),
deduction_amount int not null,
offer_availability enum("India","Foreign") );
#data insertion into offer table
insert into offer values(1,"summer","Max 10% off for min 10000",2000,1),
(2,"Happy trip","Max 15% off for min 30000",4500,1),
(3,"Diwali trip","Max 20% off for min 90000",18000,1),
(4,"Round world","Max 10% off for min 30000",3000,2),
(5,"world trip","Max 20% off for min 70000",14000,2);
#review table
create table reviews(
user_id int(15) not null,
trip_id int,
primary key(user_id,trip_id),
trip_review varchar(100),
user_rating float,
foreign key(trip_id) references trips(trip_id),
foreign key(user_id)references user(user_id) );
#data insertion into review table
insert into reviews values(1,101,"fantastic trip",7.9),(2,102,"incredible",7.8),
(3,103,"very relaxing",7.0),(4,104,"the holiday of lifetime",8.9),(5,105,"the magic of india but need foreign trips like Peter's Basilica",9.9),
(6,106,"A trip of lifetime",9.2),(7,107,"Amazing holiday but need foreign trips like Peter's Basilica",8.8),(8,108,"fantastic holiday india",9.0),
(9,109,"refreshing but need foreign trips like Mecca Masjid",8.9),(10,110,"exploring india",7.9),(11,111," fablous country",9.9),
(12,112,"ok,but need foreign trips like Mecca Masjid",9.8),(13,113,"good",7.9),(14,114,"great experience",8.7),
(15,115,"well planned",8.9),(16,116,"well balanced",8.3),
(17,117,"unforgottable",9.8),(18,118,"the best holiday",9.0),
(19,119,"just fabulous",8.6),(20,120,"memorable worls",9.9),(21,121," memorable holiday",9.9),
(22,122,"family trip",9.8),(23,123,"great vacation",9.0),
(24,124,"out standing",9.9),(25,125,"amazing",9.9);
#booking table
create table booking(
booking_id int primary key,
booking_date date,
booking_cost int,
offer_id int,
trip_id int,
user_id int,
foreign key(trip_id) references trips(trip_id),
foreign key(user_id)references user(user_id),
foreign key(offer_id)references offer(offer_id) );
#data insertion into booking table
insert into booking values(1000,"2022-09-01",8000,1,101,1),(1001,"2022-09-12",17000,1,102,2),
(1002,"2022-08-21",15000,1,103,3),(1003,"2022-07-07",25500,2,104,4),(1004,"2022-06-08",23000,1,105,5),
(1005,"2022-08-11",13000,1,106,6),(1006,"2022-10-22",15000,1,107,7),
(1007,"2022-10-31",16000,1,108,8),(1008,"2022-11-11",25500,2,109,9),(1009,"2022-02-18",25500,2,110,10),
(1010,"2022-05-01",18000,1,111,11),(1011,"2022-07-27",14000,1,112,12),
(1012,"2022-12-25",8000,1,113,13),(1013,"2022-03-17",8000,1,114,14),(1014,"2022-03-08",35500,2,115,15),
(1015,"2022-10-22",75500,2,116,16),(1016,"2022-01-12",65500,2,117,17),
(1017,"2022-12-06",76000,5,118,18),(1018,"2022-07-17",76000,5,119,19),(1019,"2022-11-18",81000,5,120,20),
(1020,"2022-04-24",71000,5,121,21),(1021,"2022-03-02",93000,5,122,22),
(1022,"2022-02-18",64000,5,123,23),(1023,"2022-05-11",57000,4,124,24),(1024,"2022-01-28",76000,5,125,25);

insert into booking values(1025,"2022-09-09",25500,2,109,17),(1026,"2022-09-19",25500,2,110,18),
(1027,'2022-03-01',8000,1,114,2),(1028,'2022-04-01',35500,2,115,10),
(1029,"2022-12-12",75500,2,116,10),(1030,"2023-01-10",75500,2,116,7),(1031,"2022-11-01",65500,2,117,8),
(1032,"2023-01-09",25500,2,104,24),(1033,"2022-12-13",25500,2,104,20),(1034,"2022-10-10",15000,1,103,17),
(1035,"2022-11-11",15000,1,103,15),(1036,"2022-12-19",17000,1,102,10),(1037,"2023-02-11",8000,1,101,20),
(1038,"2022-10-25",25500,2,104,19),(1039,"2022-11-10",25500,2,104,2),(1040,"2022-09-11",8000,1,101,24),
(1041,"2023-01-02",17000,1,102,14),(1042,"2022-12-24",76000,5,118,21),(1043,"2023-02-11",76000,5,118,22),
(1044,"2023-01-12",76000,5,119,10),(1045,"2022-12-12",76000,5,119,4);
#most opted place in pondicherry
select trips.trip_place,count(trips.trip_place) as max_Opt from booking as b
inner join trips 
on b.trip_id=trips.trip_id
where trips.trip_location="pondicherry"
group by trips.trip_place
order by max_opt desc limit 1;

#no of users who registered for "Badarika Ashram" in month of march 2022"
select b.booking_id,t.trip_place from booking as b
inner join trips as t
on b.trip_id=t.trip_id
where t.trip_place="badrikashrama" and year(b.booking_date)=2022 and month(b.booking_date)="03";

#display booking count is >1000 for the place kurukshetra
with t1 as (select count(*) as count
from booking a
join trips b
on a.trip_id=b.trip_id
where trip_place='Kurukshetra')
select * from t1
where count>1000;

#display the most opted destinations in india
select s.trip_place,count(s.trip_place) as max_Opt_india from booking as b
inner join trips as s
on b.trip_id=s.trip_id
where s.trip_in_india="yes"
group by s.trip_place
order by max_opt_india desc limit 7;

#list out the total registrations recieved to provide service outside india
select count(b.booking_id) as reg_Outside_india from booking as b
inner join trips as s
on b.trip_id=s.trip_id
where s.trip_in_india="no"
