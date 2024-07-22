select * from animal_ins;
select * from animal_outs;

create table if not exists animal_outs
(
	animal_id varchar(50) NOT NULL comment 'nullable false',
    animal_type varchar(50) NOT NULL comment 'nullable false',
    datetime datetime NOT NULL comment 'nullable false',
    name varchar(50) ,
    sex_upon_outcome varchar(50) NOT NULL comment 'nullable false'
);

insert into animal_outs (animal_id,animal_type,datetime,name,sex_upon_outcome)
values('A349733','Dog','2017-09-27 19:09:00','Allie','Spayed Female');
insert into animal_outs (animal_id,animal_type,datetime,name,sex_upon_outcome)
values('A352713','Cat','2017-04-25 12:25:00','Gia','Spayed Female');
insert into animal_outs (animal_id,animal_type,datetime,name,sex_upon_outcome)
values('A349990','Cat','2018-02-02 14:18:00','Spice','Spayed Female');

insert into animal_ins (animal_id,animal_type,datetime,intake_condition,name,sex_upon_intake)
values('A352713','Cat','2017-04-13 16:29:00','Normal','Gia','Spayed Female');
insert into animal_ins (animal_id,animal_type,datetime,intake_condition,name,sex_upon_intake)
values('A350375','Cat','2017-03-06 15:01:00','Normal','Meo','Neutered Male');

-- 천재지변으로 인해 일부 데이터가 유실되었습니다. 
-- 입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.
select ao.animal_id, ao.name from animal_outs ao
left join animal_ins ai on ai.ANIMAL_ID=ao.animal_id
where ai.DATETIME is null order by ao.animal_id asc;

-- 관리자의 실수로 일부 동물의 입양일이 잘못 입력되었습니다. 
-- 보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 보호 시작일이 빠른 순으로 조회해야합니다.
select ai.animal_id, ai.name from animal_ins ai 
left join animal_outs ao on ai.animal_id=ao.animal_id
where ao.datetime < ai.datetime order by ai.datetime asc;

-- 아직 입양을 못 간 동물 중, 
-- 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 보호 시작일 순으로 조회해야 합니다.
select ai.name, ai.datetime from animal_ins ai
left join animal_outs ao on ai.ANIMAL_ID=ao.ANIMAL_ID
where ao.datetime is null
order by ai.DATETIME asc limit 3;

