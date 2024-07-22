-- LEVEL 2 --

use programmers_practice;
create table animal_outs
(
	animal_id varchar(50) Not Null comment '동물의 아이디',
	animal_type varchar(50)  Not Null comment '생물 종',
	datetime datetime Not Null comment '입양일',
	name varchar(50) comment '이름',
	sex_upon_outcome varchar(50) Not Null comment '성별 및 중성화 여부'
);

insert animal_outs (animal_id, animal_type,datetime,name,sex_upon_outcome)
values ('A349733','Dog','2017-09-27 19:09:00','Allie','Spayed Female');
insert animal_outs (animal_id, animal_type,datetime,name,sex_upon_outcome)
values ('A352713','Cat','2017-04-25 12:25:00','Gia','Spayed Female');
insert animal_outs (animal_id, animal_type,datetime,name,sex_upon_outcome)
values ('A349990','Cat','2018-02-02 14:18:00','Spice','Spayed Female');

select * from animal_ins order by animal_id;
select * from animal_outs order by animal_id;

/* 고양이와 개는 몇 마리 있을까
동물 보호소에 들어온 동물 중 고양이와 개가 각각 몇 마리인지 조회하는 SQL문을 작성해주세요.
이때 고양이를 개보다 먼저 조회해주세요.
*/
select animal_ins.animal_type, count(animal_type) as 'count' from animal_ins
group by animal_type order by animal_type asc;

/* 루시와 엘라 찾기
동물 보호소에 들어온 동물 중 이름이 Lucy, Ella, Pickle, Rogan, Sabrina, Mitty인 
동물의 아이디와 이름, 성별 및 중성화 여부를 조회하는 SQL 문을 작성해주세요.
*/
select animal_ins.animal_id, animal_ins.name, animal_ins.sex_upon_intake from animal_ins
where name in ('Lucy','Ella','Pickle','Rogan','Sabrina','Mitty')
order by animal_id;

/* 최솟값 구하기
동물 보호소에 가장 먼저 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.
*/
select animal_ins.datetime from animal_ins
order by datetime asc limit 1; -- 1
select min(animal_ins.datetime) from animal_ins; -- 2

/* 동명 동물 수 찾기
동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요.
 이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.
*/
select name, count(name)as 'count' from animal_ins
group by name having count(name)>=2
order by name;

/******* 이름에 el이 들어가는 동물 찾기 ************* ( like '% ??? %' 문법 )
보호소에 돌아가신 할머니가 기르던 개를 찾는 사람이 찾아왔습니다.
 이 사람이 말하길 할머니가 기르던 개는 이름에 'el'이 들어간다고 합니다. 
 동물 보호소에 들어온 동물 이름 중, 이름에 "EL"이 들어가는 개의 아이디와 이름을 조회하는 SQL문을 작성해주세요.
 이때 결과는 이름 순으로 조회해주세요. 단, 이름의 대소문자는 구분하지 않습니다.
*/
select animal_id, name from animal_ins 
where animal_type='Dog' and name like '%el%' order by name;

/* 동물 수 구하기
동물 보호소에 동물이 몇 마리 들어왔는지 조회하는 SQL 문을 작성해주세요.
*/
select count(animal_id) as 'count' from animal_ins;

/* 입양 시각 구하기
보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다.
 09:00부터 19:59까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 
 이때 결과는 시간대 순으로 정렬해야 합니다.
*/
select hour(datetime) as 'HOUR', count(*) as 'COUNT' from animal_outs
group by hour(datetime) having hour>8 and hour<20
order by hour asc;

/* ******* NULL 처리하기 ******** (if문 문법)
입양 게시판에 동물 정보를 게시하려 합니다. 동물의 생물 종, 이름, 성별 및 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요.
 이때 프로그래밍을 모르는 사람들은 NULL이라는 기호를 모르기 때문에, 이름이 없는 동물의 이름은 "No name"으로 표시해 주세요.
*/
select 
	animal_type, 
    if(name is null,'No name',name) as 'name',  -- if name이 null이면 'No name' 출력, 그렇지 않으면 그냥 name 출력
    sex_upon_intake 
from animal_ins;


/* ****** 중성화 여부 파악하기 ****** (case문 문법)
보호소의 동물이 중성화되었는지 아닌지 파악하려 합니다. 
중성화된 동물은 SEX_UPON_INTAKE 컬럼에 'Neutered' 또는 'Spayed'라는 단어가 들어있습니다.
동물의 아이디와 이름, 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 
이때 중성화가 되어있다면 'O', 아니라면 'X'라고 표시해주세요.
*/
select 	 
	animal_id, 
    name, 
    case
		when sex_upon_intake like '%Neutered%' Then 'O'
        when sex_upon_intake like '%Spayed%' Then 'O'
        else 'X'
    end as '중성화'
from animal_ins;

/* 중복 제거하기 
동물 보호소에 들어온 동물의 이름은 몇 개인지 조회하는 SQL 문을 작성해주세요.
 이때 이름이 NULL인 경우는 집계하지 않으며 중복되는 이름은 하나로 칩니다
*/
select count(distinct name) as 'count' from animal_ins where name is not null;

/* ***** DATETIME 에서 DATE로 형 변환 *******
ANIMAL_INS 테이블에 등록된 모든 레코드에 대해, 
각 동물의 아이디와 이름, 들어온 날짜1를 조회하는 SQL문을 작성해주세요. 
이때 결과는 아이디 순으로 조회해야 합니다.
*/
select animal_id, name, date_format(datetime,'%Y-%m-%d') as '날짜'
from animal_ins
order by animal_id;
/*
DATE_FORMAT(DATE, 형식)을 통해 DATE의 형식을 바꿀 수 있습니다.
형식에는 %Y(4자리 연도), %y(2자리 연도), %m(월), %d(일), %H(24시간), %h(12시간), %i, %s가 있습니다.
*/





