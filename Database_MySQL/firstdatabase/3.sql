select * from building_temperature;

-- Building Info table creation--
use firstdatabase; -- (schema)
create table building_info
(
-- (column name), (column datatype)
	rid int auto_increment primary key,
    building_id smallint unique,
    building_name varchar(100)
);

-- insert data--
insert into building_info values(null,1,'연구동');
insert into building_info values(null,3,'기숙사');
insert into building_info values(null,8,'식당');
insert into building_info values(null,9,'체육관');

select * from building_info;

insert ignore into building_info values (null,4,'기초연구동');
update `building_info` set `building_name`='첨단연구동' where `building_id`=1;

alter table `building_info`
add max_capacity smallint unsigned;
update `building_info` set `max_capacity`=200;

update building_info set max_capacity=max_capacity*2 where building_name='식당';

update building_info set building_name='자연연구동' where building_name='happy';

insert into building_info values(null,1,'자연연구동',200)
on duplicate key update building_name='자연연구동';

select * from building_info;
delete from building_info where max_capacity>200;

--    delete from building_info;

alter table building_info auto_increment=12;
insert into building_info values(null,11,'연구동',100);
insert into building_info values(null,13,'기숙사',300);
insert into building_info values(null,18,'식당',100);
insert into building_info values(null,19,'체육관',50);
insert into building_info values(null,15,'창고',500);

select * from building_temperature;
