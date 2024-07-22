/*
use [database명];
drop table if exits [만들 테이블명];      --  만약 같은 테이블명이 있으면 drop table하라(옵션)
create table if not eixts [만들 테이블명] alter
(
	col_name data_type [not null | null] [default value] [auto_increment] [unique key|primary key] [comment 'string'],
    col_name2 data_type [not null | null] [default value] [auto_increment] [unique key|primary key] [comment 'string'],
    ...
);
*/

use firstdatabase;
create table if not exists building_inout 
(
	rid int auto_increment primary key comment '데이터 일련번호',
    building_id smallint unsigned comment '건물 고유번호, building_info table에서 사용되는 값',
    reg_date timestamp default current_timestamp comment '측정시간',
    num_in smallint unsigned default 0 comment '건물 입장 인원',
    num_out smallint unsigned default 0 comment '건물 퇴장 인원',
    sensor_id varchar(20) null comment '센서 이름',
    sensor_hash varchar(40) unique comment '센서 해쉬값, 데이터 정확성, 변조불가성 (보안강화)'
);

select * from building_inout;

insert into building_inout (building_id,num_in,num_out,sensor_hash) values(1,10,3,'sabfd9393');
insert into building_inout (building_id,num_in,num_out,sensor_hash) values(3,10,3,'sabfd9393');
insert into building_inout (building_id,num_in,sensor_hash) values(1,10,'asabfd9393');