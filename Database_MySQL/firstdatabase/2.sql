/*
select
from
where
groupy by
having
order by
*/

select * from building_temperature;
select * from building_temperature where `temperature` >= 15 ;

-- subquery 
select * from building_temperature where `temperature` >= ( select `temperature` from `building_temperature` where `building_id`= 1 );
select * from building_temperature where `temperature` >= any ( select `temperature` from `building_temperature` where `building_id`= 1 );
select * from building_temperature where `temperature` >= some ( select `temperature` from `building_temperature` where `building_id`= 1 );
select * from building_temperature where `temperature` >= all ( select `temperature` from `building_temperature` where `building_id`= 1 );

create table temp_table (select * from building_temperature where `building_id`>1);
select * from temp_table;
delete from temp_table;

select distinct building_id from building_temperature;
-- distinct 중복된 것은 한 번만 찍으시오
select building_id from building_temperature;


-- aggregate function
select avg(`temperature`),max(temperature),min(temperature) from building_temperature;
select stddev(`temperature`) as '온도 표준편차',var_samp(temperature) as '온도 분산'from building_temperature;

select count(*) from building_temperature;
select distinct building_id from building_temperature;
select count(distinct building_id) from building_temperature;


-- 빌딩 1의 평균온도보다 같거나 높았던 빌딩들을 모두 출력하시오
select * from building_temperature where temperature >=(select avg(temperature) from building_temperature where building_id=1)
and building_id!=1;

insert into building_temperature values(6,8,18.0,'2021-12-22 14:00:00');
insert into building_temperature values(7,9,4.0,'2021-12-22 14:00:00');
insert into building_temperature values(8,3,7.0,'2021-12-22 14:00:00');
select * from building_temperature;

-- group by
-- 빌딩별로 평균온도를 출력해 보고 싶다
select building_id, avg(temperature) from building_temperature group by building_id;

-- having
-- aggregate function이 들어간 조건을 지정할 때.
-- where에서는 aggregate function 사용이 어렵기 때문
-- 평균온도가 12도보다 높았던 빌딩 번호를 알고 싶을 때
select building_id, avg(temperature) from building_temperature group by building_id with rollup having avg(temperature)>12;

-- rollup (total의 개념)
select building_id, avg(temperature) from building_temperature group by building_id with rollup;


