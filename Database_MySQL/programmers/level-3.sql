-- LEVEL 3 --

select * from animal_ins order by animal_id;
select * from animal_outs order by animal_id;

/* 없어진 기록 찾기
천재지변으로 인해 일부 데이터가 유실되었습니다.
입양을 간 기록은 있는데, 보호소에 들어온 기록이 없는 동물의 ID와 이름을 ID 순으로 조회하는 SQL문을 작성해주세요.
*/
select o.animal_id, o.name from animal_outs o
	 left join animal_ins i on o.animal_id=i.animal_id
where i.datetime is null
order by animal_id;

/* 있었는데요 없었습니다
관리자의 실수로 일부 동물의 입양일이 잘못 입력되었습니다.
보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회하는 SQL문을 작성해주세요.
 이때 결과는 보호 시작일이 빠른 순으로 조회해야합니다.
*/
select i.animal_id, i.name from animal_ins i
	left join animal_outs o on i.animal_id=o.animal_id
where i.datetime>o.datetime
order by i.datetime asc;

/* 오랜 기간 보호한 동물(1)
 아직 입양을 못 간 동물 중, 가장 오래 보호소에 있었던 동물 3마리의 이름과 보호 시작일을 조회하는 SQL문을 작성해주세요.
 이때 결과는 보호 시작일 순으로 조회해야 합니다.
*/
select i.name, i.datetime from animal_ins i
	left join animal_outs o on i.animal_id=o.animal_id
where o.datetime is null
order by i.datetime asc limit 3;

/* 오랜 기간 보호한 동물(2)
입양을 간 동물 중, 
보호 기간이 가장 길었던 동물 두 마리의 아이디와 이름을 조회하는 SQL문을 작성해주세요.
이때 결과는 보호 기간이 긴 순으로 조회해야 합니다.
*/
select o.animal_id, o.name from animal_outs o
	left join animal_ins i on i.animal_id=o.animal_id
order by (o.datetime-i.datetime) desc limit 2;

use programmers_practice;
create table places
(
	id int not null primary key comment '공간의 아이디',
    name varchar(50) not null comment '이름',
    host_id int not null comment '공간을 소유한 유저의 아이디'
);

insert into places (id,name,host_id) 
values (4431977,'BOUTIQUE STAYS - Somerset Terrace, Pet Friendly',760849);
insert into places (id,name,host_id) 
values (5194998,'BOUTIQUE STAYS - Somerset Terrace, Pet Friendly',760849);
insert into places (id,name,host_id) 
values (16045624,'Urban Jungle in the Heart of Melbourne',30900122);
insert into places (id,name,host_id) 
values (17810814,'Stylish Bayside Retreat with a Luscious Garden',760849);
insert into places (id,name,host_id) 
values (22740286,'FREE PARKING - The Velvet Lux in Melbourne CBD',30900122);
insert into places (id,name,host_id) 
values (22868779,'★ Fresh Fitzroy Pad with City Views! ★',21058208);

select * from places;
/* 헤비 유저가 소유한 장소
이 서비스에서는 공간을 둘 이상 등록한 사람을 "헤비 유저"라고 부릅니다. 
헤비 유저가 등록한 공간의 정보를 아이디 순으로 조회하는 SQL문을 작성해주세요.
*/
select id, name, host_id from places
where host_id in(select host_id from places group by host_id having count(host_id)>=2);




