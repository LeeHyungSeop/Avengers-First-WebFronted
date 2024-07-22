-- LEVEL 1 -- 

use programmers_practice;
create table animal_ins
(
	animal_id varchar(50) Not Null comment '동물의 아이디',
	animal_type varchar(50)  Not Null comment '생물 종',
	datetime datetime Not Null comment '보호 시작일',
	intake_condition varchar(50) Not Null comment '보호 시작 시 상태',
	name varchar(50) comment '이름',
	sex_upon_intake varchar(50) Not Null comment '성별 및 중성화 여부'
);

insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A349996','Cat','2018-01-22 14:32:00','Normal','Sugar','Neutered Male');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A350276','Cat','2017-08-13 13:50:00','Normal','Jewel','Spayed Female');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A350375','Cat','2017-03-06 15:01:00','Normal','Meo','Neutered Male');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A352555','Dog','2014-08-08 04:20:00','Normal','Harley','Spayed Female');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A368930','Dog','2014-06-08 13:20:00','Normal',NULL,'Spayed Female');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A434523','Cat','2015-11-20 14:18:00','Normal',NULL,'Spayed Female');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A562649','Dog','2014-03-20 18:06:00','Sick',NULL,'Spayed Female');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A367012','Dog','2015-09-16 09:06:00','Sick','Miller','Neutered Male');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A381217','Dog','2017-07-08 09:41:00','Sick','Cherokee','Neutered Male');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A365302','Dog','2017-01-08 16:34:00','Aged','Minnie','Spayed Female');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A396810','Dog','2016-08-22 16:13:00','Injured','Raven','Spayed Female');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A410668','Cat','2015-11-19 13:41:00','Normal','Raven','Spayed Female');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A373219','Cat','2014-07-29 11:43:00','Normal','Ella','Spayed Female');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A377750','Dog','2017-10-25 17:17:00','Normal','Lucy','Spayed Female');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A355753','Dog','2015-09-10 13:14:00','Normal','Elijah','Neutered Male');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A373219','Cat','2014-07-29 11:43:00','Normal','Ella','Spayed Female');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A382192','Dog','2015-03-13 13:14:00','Normal','Maxwell2','	Intact Male');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A352713','Cat','2017-04-13 16:29:00','Normal','Gia','Spayed Female');
insert animal_ins (animal_id, animal_type,datetime,intake_condition,name,sex_upon_intake)
values ('A350375','Cat','2017-03-06 15:01:00','Normal','Meo','Neutered Male');

/*  모든 레코드 조회하기 
동물 보호소에 들어온 모든 동물의 정보를 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요.
 SQL을 실행하면 다음과 같이 출력되어야 합니다.
*/
select * from animal_ins order by animal_id;

/* 최댓값
가장 최근에 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.
*/
select datetime as '시간' from animal_ins order by datetime desc limit 1; -- 내가 푼 코드
select max(datetime) as '시간' from animal_ins;  -- 다른 사람이 푼 코드

/* 이름이 없는 동물의 아이디
동물 보호소에 들어온 동물 중, 이름이 없는 채로 들어온 동물의 ID를 조회하는 SQL 문을 작성해주세요. 
단, ID는 오름차순 정렬되어야 합니다.
*/
select animal_id from animal_ins where name is NULL order by animal_id asc;

/* 역순 정렬하기
동물 보호소에 들어온 모든 동물의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요.
이때 결과는 ANIMAL_ID 역순으로 보여주세요. SQL을 실행하면 다음과 같이 출력되어야 합니다.
*/
select name, datetime from animal_ins order by animal_id desc;

/* 이름이 있는 동물의 아이디
동물 보호소에 들어온 동물 중, 이름이 있는 동물의 ID를 조회하는 SQL 문을 작성해주세요. 
단, ID는 오름차순 정렬되어야 합니다.
*/
select animal_ins.animal_id from animal_ins where name is not null order by animal_id;

/* 아픈 동물 찾기
동물 보호소에 들어온 동물 중 아픈 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요.
 이때 결과는 아이디 순으로 조회해주세요.
*/
select animal_ins.animal_id, animal_ins.name from animal_ins
where intake_condition ='Sick' order by animal_id;

/* 어린 동물 찾기
동물 보호소에 들어온 동물 중 젊은 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 
이때 결과는 아이디 순으로 조회해주세요.
*/
select animal_id, name from animal_ins where intake_condition != 'Aged' order by animal_id;

/* 동물의 아이디와 이름
동물 보호소에 들어온 모든 동물의 아이디와 이름을 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요. 
SQL을 실행하면 다음과 같이 출력되어야 합니다.
*/
select animal_id,name from animal_ins order by animal_id asc; 

/*****   여러 기준으로 정렬하기  ***** (문법)
동물 보호소에 들어온 모든 동물의 아이디와 이름, 보호 시작일을 이름 순으로 조회하는 SQL문을 작성해주세요.
 단, 이름이 같은 동물 중에서는 보호를 나중에 시작한 동물을 먼저 보여줘야 합니다.
*/
select animal_id, name, datetime from animal_ins
order by name asc, datetime desc;

/* 상위 n개 레코드
동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하는 SQL 문을 작성해주세요.
*/
select name from animal_ins order by datetime asc limit 1;



