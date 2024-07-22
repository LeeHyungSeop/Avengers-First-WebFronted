create table cart_products
(
	id int primary key comment '아이디',
    cart_id int comment '장바구니의 아이디',
    name varchar(50) comment '상품 종류',
    price int comment '가격'
);

select * from cart_products;

insert into cart_products (id,cart_id,name,price) values (1630,83,'Cereal',3980);
insert into cart_products (id,cart_id,name,price) values (1631,83,'Multipurpose Supply',3900);
insert into cart_products (id,cart_id,name,price) values (5491,286,'Yogurt',2980);
insert into cart_products (id,cart_id,name,price) values (5504,286,'Milk',1880);
insert into cart_products (id,cart_id,name,price) values (8435,448,'Milk',1880);
insert into cart_products (id,cart_id,name,price) values (8437,448,'Yogurt',2980);
insert into cart_products (id,cart_id,name,price) values (8438,448,'Tea',11000);
insert into cart_products (id,cart_id,name,price) values (20236,1034,'Yogurt',2980);
insert into cart_products (id,cart_id,name,price) values (20237,1034,'Butter',4890);

-- 데이터 분석 팀에서는 우유(Milk)와 요거트(Yogurt)를 동시에 구입한 장바구니가 있는지 알아보려 합니다. 
-- 우유와 요거트를 동시에 구입한 장바구니의 아이디를 조회하는 SQL 문을 작성해주세요.
-- 이때 결과는 장바구니의 아이디 순으로 나와야 합니다.
select distinct cart_id
from cart_products
where cart_id in 
(SELECT cart_id
from cart_products
where name ='Milk')
and cart_id in
(SELECT cart_id
from cart_products
where name ='Yogurt')
order by cart_id asc;
