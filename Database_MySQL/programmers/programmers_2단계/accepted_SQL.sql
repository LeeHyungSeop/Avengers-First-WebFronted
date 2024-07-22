select * from animal_ins;

insert into animal_ins (animal_id, animal_type, datetime,intake_condition,name,sex_upon_intake)
values ('A373219','cat','2014-07-29 11:43:00','Normal','Ella','Spayed Female');
insert into animal_ins (animal_id, animal_type, datetime,intake_condition,name,sex_upon_intake)
values ('A373220','cat','2014-07-29 11:43:00','Normal','Lucy','Spayed Female');
insert into animal_ins (animal_id, animal_type, datetime,intake_condition,name,sex_upon_intake)
values ('A373221','cat','2014-07-29 11:43:00','Normal','Bj','Spayed Female');
insert into animal_ins (animal_id, animal_type, datetime,intake_condition,name,sex_upon_intake)
values ('A373222','cat','2014-07-29 11:43:00','Normal','Tux','Spayed Female');
insert into animal_ins (animal_id, animal_type, datetime,intake_condition,name,sex_upon_intake)
values ('A373223','cat','2014-07-29 11:43:00','Normal','Mitty','Spayed Female');
insert into animal_ins (animal_id, animal_type, datetime,intake_condition,name,sex_upon_intake)
values ('A373224','cat','2014-07-29 11:43:00','Normal','Rogan','Spayed Female');
insert into animal_ins (animal_id, animal_type, datetime,intake_condition,name,sex_upon_intake)
values ('A373222','cat','2014-07-29 11:43:00','Normal','Tux','Spayed Female');
insert into animal_ins (animal_id, animal_type, datetime,intake_condition,name,sex_upon_intake)
values ('A373224','cat','2014-07-29 11:43:00','Normal','Rogan','Spayed Female');
insert into animal_ins (animal_id, animal_type, datetime,intake_condition,name,sex_upon_intake)
values ('A373224','cat','2014-07-29 11:43:00','Normal','Elijah','Spayed Female');
insert into animal_ins (animal_id, animal_type, datetime,intake_condition,name,sex_upon_intake)
values ('A373224','cat','2014-07-29 11:43:00','Normal','Ella','Spayed Female');
insert into animal_ins (animal_id, animal_type, datetime,intake_condition,name,sex_upon_intake)
values ('A373224','cat','2014-07-29 11:43:00','Normal','Maxwell 2','Spayed Female');

-- 동물 보호소에 들어온 동물 중 고양이와 개가 각각 몇 마리인지 조회하는 SQL문을 작성해주세요. 
-- 이때 고양이를 개보다 먼저 조회해주세요.
SELECT ANIMAL_TYPE, COUNT(ANIMAL_TYPE) COUNT 
FROM ANIMAL_INS
GROUP BY ANIMAL_TYPE
order by ANIMAL_TYPE;

-- 동물 보호소에 들어온 동물 중 이름이 Lucy, Ella, Pickle, Rogan, Sabrina, Mitty인 
-- 동물의 아이디와 이름, 성별 및 중성화 여부를 조회하는 SQL 문을 작성해주세요. 이때 결과는 아이디 순으로 조회해주세요.
select animal_id, name, sex_upon_intake from animal_ins 
where name in ('Lucy','Ella','Pickle', 'Rogan', 'Sabrina', 'Mitty') order by animal_id;

-- 동물 보호소에 가장 먼저 들어온 동물은 언제 들어왔는지 조회하는 SQL 문을 작성해주세요.
select datetime from animal_ins order by datetime asc limit 1;

-- 동물 보호소에 들어온 동물 이름 중 두 번 이상 쓰인 이름과 해당 이름이 쓰인 횟수를 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 이름이 없는 동물은 집계에서 제외하며, 결과는 이름 순으로 조회해주세요.
select name, count(name) as COUNT from animal_ins group by name having count>=2 order by name asc;

-- 보호소에 돌아가신 할머니가 기르던 개를 찾는 사람이 찾아왔습니다. 
-- 이 사람이 말하길 할머니가 기르던 개는 이름에 'el'이 들어간다고 합니다. 
-- 동물 보호소에 들어온 동물 이름 중, 이름에 "EL"이 들어가는 개의 아이디와 이름을 조회하는 SQL문을 작성해주세요.
-- 이때 결과는 이름 순으로 조회해주세요. 단, 이름의 대소문자는 구분하지 않습니다.
select animal_id, name from animal_ins where name like '%el%' and animal_type like 'dog' order by name;

-- 동물 보호소에 동물이 몇 마리 들어왔는지 조회하는 SQL 문을 작성해주세요.
select count(*) as count from animal_ins;

-- 보호소에서는 몇 시에 입양이 가장 활발하게 일어나는지 알아보려 합니다. 
-- 09:00부터 19:59까지, 각 시간대별로 입양이 몇 건이나 발생했는지 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 시간대 순으로 정렬해야 합니다.
SELECT HOUR(DATETIME) AS HOUR, COUNT(*) AS COUNT FROM animal_outs
WHERE HOUR(DATETIME)>=9 AND HOUR(DATETIME)<=19
GROUP BY HOUR(DATETIME) ORDER BY HOUR(DATETIME);

-- 입양 게시판에 동물 정보를 게시하려 합니다. 
-- 동물의 생물 종, 이름, 성별 및 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 
-- 이때 프로그래밍을 모르는 사람들은 NULL이라는 기호를 모르기 때문에, 이름이 없는 동물의 이름은 "No name"으로 표시해 주세요.
SELECT animal_type, IFNULL(NAME,'No name') AS NAME, sex_upon_intake
FROM animal_ins
ORDER BY ANIMAL_ID ASC;
-- SELECT IFNULL(Column명, "Null일 경우 대체 값") FROM 테이블명;  이용함

-- 보호소의 동물이 중성화되었는지 아닌지 파악하려 합니다. 중성화된 동물은 SEX_UPON_INTAKE 컬럼에 'Neutered' 또는 'Spayed'라는 단어가 들어있습니다. 
-- 동물의 아이디와 이름, 중성화 여부를 아이디 순으로 조회하는 SQL문을 작성해주세요. 
-- 이때 중성화가 되어있다면 'O', 아니라면 'X'라고 표시해주세요.
select animal_id, name, 
	case
		when sex_upon_intake like '%neutered%' then 'O'
        when sex_upon_intake like '%Spayed%' then 'O'
        ELSE 'X'
	END as '중성화'
from animal_ins order by ANIMAL_ID;

-- 동물 보호소에 들어온 동물의 이름은 몇 개인지 조회하는 SQL 문을 작성해주세요. 
-- 이때 이름이 NULL인 경우는 집계하지 않으며 중복되는 이름은 하나로 칩니다.
select count(distinct name) as 'count' from animal_ins where name is not null;

-- ANIMAL_INS 테이블에 등록된 모든 레코드에 대해, 각 동물의 아이디와 이름, 들어온 날짜1를 조회하는 SQL문을 작성해주세요.
-- 이때 결과는 아이디 순으로 조회해야 합니다.
SELECT ANIMAL_ID, NAME, DATE_FORMAT(DATETIME, '%Y-%m-%d') AS '날짜' FROM ANIMAL_INS order by animal_id;

