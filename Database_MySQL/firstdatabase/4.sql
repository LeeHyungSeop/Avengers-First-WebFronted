select * from building_info;
select * from building_temperature;
select * from building_humidity;

use firstdatabase;
create table building_humidity
(
	rid int auto_increment primary key,
    building_id smallint unique,
    humidity int unsigned,
    reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

insert into building_humidity values(null,3,60,2021-12-05);
insert into building_humidity values(null,1,65,2021-12-05);


-- join

select *
from building_info join building_temperature on building_info.building_id=building_temperature.building_id;

select building_info.building_name, building_temperature.temperature, building_temperature.reg_date
from building_info join building_temperature on building_info.building_id=building_temperature.building_id;

select a.building_name, b.temperature,b.reg_date
from building_info a join building_temperature b on a.building_id=b.building_id;

select a.building_name,b.humidity, b.reg_date
from building_info a join building_humidity b on a.building_id=b.building_id;

select *
from building_info a left join building_temperature b on a.building_id=b.building_id;

select *
from building_temperature a right join building_info b on a.building_id=b.building_id;

-- 왼쪽 것은 짝이 없어도 출력해준다
select a.building_name,b.humidity,b.reg_date
from building_info a left join building_humidity b on a.building_id=b.building_id;
select a.building_name,b.humidity,b.reg_date
from building_info a right join building_humidity b on a.building_id=b.building_id;
select a.building_name,b.humidity,b.reg_date
from building_info a join building_humidity b on a.building_id=b.building_id;


-- 3개 테이블 join
select *
from building_info a
	join building_temperature b on a.building_id=b.building_id
    join building_humidity c on a.building_id=c.building_id ;
    
select a.building_name,b.temperature,c.humidity,c.reg_date
from building_info a
	join building_temperature b on a.building_id=b.building_id
    join building_humidity c on a.building_id=c.building_id and b.reg_date=c.reg_date;
    

insert into building_humidity values(2,1,65,'2021-12-06 13:00:00')
on duplicate key update building_name='연구동';


update building_humidity set reg_date='2021-12-06 13:00:00' where building_id=1;






