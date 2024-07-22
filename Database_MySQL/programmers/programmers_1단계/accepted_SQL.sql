use programmers_test1;
create table if not exists ANIMAL_INS
(
	ANIMAL_ID VARCHAR(10) NOT NULL COMMENT '동물의 아이디',
	ANIMAL_TYPE VARCHAR(10) NOT NULL COMMENT '생물 종',
    DATETIME DATETIME NOT NULL COMMENT '보호 시작일',
    INTAKE_CONDITION VARCHAR(10) COMMENT '보호 시작 시 상태',
    NAME VARCHAR(10) NULL COMMENT '이름',
    SEX_UPON_INTAKE VARCHAR(20) NOT NULL COMMENT '중성화 여부'
);

insert into animal_ins (ANIMAL_ID, ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE) 
VALUES('A368930','Dog','2014-08-08 04:20:00','Normal',NULL,'Spayed Female');
insert into animal_ins (ANIMAL_ID, ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE) 
VALUES('A524634','Dog','2014-08-08 04:20:00','Normal','*Belle','Spayed Female');
insert into animal_ins (ANIMAL_ID, ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE) 
VALUES('A465637','Dog','2014-08-08 04:20:00','Injured',NULL,'Neutered Male');
insert into animal_ins (ANIMAL_ID, ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE) 
VALUES('A465638','Dog','2014-08-08 04:20:00','Sick',NULL,'Neutered Male');
insert into animal_ins (ANIMAL_ID, ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE) 
VALUES('A465639','Dog','2014-08-08 04:20:00','Aged',NULL,'Neutered Male');

update animal_ins set animal_id='A349996' where animal_id='A34996';

insert into animal_ins (ANIMAL_ID, ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE) 
VALUES('A349996','Cat','2018-01-22 14:32:00','Normal','Sugar','Neutered Male');
insert into animal_ins (ANIMAL_ID, ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE) 
VALUES('A350276','Cat','2017-08-13 13:50:00','Normal','Jewel','Spayed Female');
insert into animal_ins (ANIMAL_ID, ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE) 
VALUES('A350375','Cat','2017-03-06 15:01:00','Normal','Meo','Neutered Male');
insert into animal_ins (ANIMAL_ID, ANIMAL_TYPE,DATETIME,INTAKE_CONDITION,NAME,SEX_UPON_INTAKE) 
VALUES('A352555','Dog','2014-08-08 04:20:00','Normal','Harley','Spayed Female');

select * from programmers_test1.animal_ins order by ANIMAL_ID asc;
-- delete from animal_ins;

-- 가장 최근에 들어온 동물이 언제 들어왔는지?
select max(DATETIME) from animal_ins;

-- 동물 보호소에 들어온 동물 중, 이름이 없는 채로 들어온 동물의 ID를 조회하는 SQL 문을 작성해주세요. 단, ID는 오름차순 정렬되어야 합니다.
select `ANIMAL_ID` from `ANIMAL_INS` where `NAME` is NULL order by `animal_id` asc;

-- SELECT ANIMALID FROM ANIMALINS where NAME is null ORDER BY ANIMAL_ID ASC;
-- -----------------------------------------------------------------------------------------------------
-- 동물 보호소에 들어온 모든 동물의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 이때 결과는 ANIMAL_ID 역순으로 보여주세요.
--  SQL을 실행하면 다음과 같이 출력되어야 합니다.
select NAME, DATETIME from animal_ins order by animal_id desc;

-- 동물 보호소에 들어온 동물 중, 이름이 있는 동물의 ID를 조회하는 SQL 문을 작성해주세요. 
-- 단, ID는 오름차순 정렬되어야 합니다.
select animal_id from animal_ins where name is not null;

-- 동물 보호소에 들어온 동물 중 아픈 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 
-- 이때 결과는 아이디 순으로 조회해주세요.
select animal_id, NAME from animal_ins where `INTAKE_CONDITION` LIKE 'Sick'; 

-- 동물 보호소에 들어온 동물 중 젊은 동물1의 아이디와 이름을 조회하는 SQL 문을 작성해주세요. 
-- 이때 결과는 아이디 순으로 조회해주세요.  INTAKE_CONDITION이 Aged가 아닌 경우를 뜻함
select animal_id, name from animal_ins where `INTAKE_CONDITION` NOT LIKE 'Aged';

-- 동물 보호소에 들어온 모든 동물의 아이디와 이름을 ANIMAL_ID순으로 조회하는 SQL문을 작성해주세요. 
select animal_id, name from animal_ins order by animal_id asc;

-- 동물 보호소에 들어온 모든 동물의 아이디와 이름, 보호 시작일을 이름 순으로 조회하는 SQL문을 작성해주세요. 
-- 단, 이름이 같은 동물 중에서는 보호를 나중에 시작한 동물을 먼저 보여줘야 합니다.
/*
이름을 사전 순으로 정렬하면 다음과 같으며, 'Jewel', 'Raven', 'Sugar'
'Raven'이라는 이름을 가진 개와 고양이가 있으므로, 이 중에서는 보호를 나중에 시작한 개를 먼저 조회합니다.
*/
select animal_id,name,datetime from animal_ins order by name asc,  datetime desc;

-- 동물 보호소에 가장 먼저 들어온 동물의 이름을 조회하는 SQL 문을 작성해주세요.
select name from animal_ins order by datetime asc limit 1;



