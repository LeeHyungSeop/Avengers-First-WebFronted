select * from building_temperature;
/* 원하는 column만 read하기
	select with column names
    pin tab -> apply한 result Grid를 고정
    names with backtick  -> ` `
*/
select `building_id`,`temperature` from `building_temperature`;
select `reg_date`,building_id,`temperature`,rid from building_temperature;
----------------------------------------------------------------------------
/* sorting 하기
	sort by column names
		order by
        asc default
        desc
        
        order by with limit
        order by multiple columns
*/
select * from building_temperature order by `building_id` asc;
select * from building_temperature order by `building_id` desc limit 1;
select * from building_temperature order by `reg_date` limit 1;
select * from building_temperature order by `building_id` asc, `reg_date` desc;
select * from building_temperature order by `reg_date` desc, `building_id` asc;
--------------------------------------------------------------------
/* 조건에 맞는 data만 보여주기
where clause
comparison operators : >, <, >=, <=, =, !=
logical operators : and, or
in operator
*/
select * from building_temperature where `reg_date` > '2021-12-06 13:30:00';
select * from building_temperature where `reg_date` < '2021-12-06 13:30:00' order by `building_id` desc;
/* 이건 문법적으로 맞지 않다. SQL 문법의 특징은 들어가는 곳의 위치가 정해져있다. == Select Query
select * from building_temperature order by `building_id` desc where `reg_date` < '2021-12-06 13:30:00';
*/

select * from building_temperature where `reg_date` != '2021-12-06 13:30:00' and `building_id`=1;
select * from building_temperature where `reg_date` != '2021-12-06 13:30:00' or `building_id`=1;

select * from building_temperature where `building_id`=1 or `building_id`=8 or `building_id`=9;
-- in operator (입력한 값 중에 만족하는 것이 있다면 출력== or 연산을 쭉 쓰는 것과 같음)
select * from building_temperature where `building_id` in(1,8,9);

select * from building_temperature where (`reg_date`<'2021-12-06 13:30:00' and `temperature`>9) or
(`building_id`=1 and `temperature`<20.0);
select * from building_temperature where (`reg_date`<'2021-12-06 13:30:00' and `temperature`>9) and
(`building_id`=1 and `temperature`<20.0);
-------------------------------------------------------------------------
