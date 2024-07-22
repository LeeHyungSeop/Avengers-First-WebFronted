select * from places;

create table if not exists places
(
	id int primary key comment '공간의 아이디',
    name varchar(100) comment '이름',
    host_id int comment '공간을 소유한 유저의 아이디'
);

insert into places (id,name,host_id)
values('4431977','BOUTIQUE STAYS - Somerset Terrace, Pet Friendly','760849');
insert into places (id,name,host_id)
values('5194998','BOUTIQUE STAYS - Somerset Terrace, Pet Friendly','760849');
insert into places (id,name,host_id)
values('16045624','Urban Jungle in the Heart of Melbourne','30900122');
insert into places (id,name,host_id)
values('17810814','Stylish Bayside Retreat with a Luscious Garden','760849');
insert into places (id,name,host_id)
values('22740286','FREE PARKING - The Velvet Lux in Melbourne CBD','30900122');
insert into places (id,name,host_id)
values('22868779','★ Fresh Fitzroy Pad with City Views! ★','21058208');

-- 이 서비스에서는 공간을 둘 이상 등록한 사람을 "헤비 유저"라고 부릅니다. 
-- 헤비 유저가 등록한 공간의 정보를 아이디 순으로 조회하는 SQL문을 작성해주세요.
select * from places
where host_id in (select host_id from places group by host_id having count(host_id)>=2)
order by id asc;

select host_id from places group by host_id having count(host_id)>=2;

-- INNER JOIN (다른 사람 답)
SELECT * FROM PLACES A
JOIN (SELECT * FROM PLACES
    GROUP BY HOST_ID
    HAVING COUNT(HOST_ID) >= 2) B
ON A.HOST_ID = B.HOST_ID
ORDER BY A.ID;


-- 입양을 간 동물 중, 보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문을 작성해주세요. 
-- 이때 결과는 보호 기간이 긴 순으로 조회해야 합니다.
select * from animal_ins;
select * from animal_outs;

select i.ANIMAL_ID, i.name from animal_ins i join animal_outs o on i.animal_id=o.animal_id
order by o.datetime-i.DATETIME desc limit 2;
