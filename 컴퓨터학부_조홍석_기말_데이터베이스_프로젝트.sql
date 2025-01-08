show databases;

use employees;



select * from employees;

# 한 줄 주석

-- 한 줄 주석

/* 두줄
 * 주석
 * 달기
 */

select * from departments;

select * from salaries;

select first_name, last_name 
from employees;

select dept_no as 부서번호, dept_name as 부서명 
from departments;	


select  emp_no as 사번, first_name as 이름
from employees;

select distinct birth_date # 중복된 값 제거, 생일 같은 사람 중복 제거
from employees;
#########################################
select * from titles;

select * from salaries;

select emp_no, title 
from titles;

select emp_no, salary 
from salaries;

select  emp_no as 사번, title as 직위
from titles;

select  emp_no as 사번, salary as 연봉
from salaries;

select distinct title 
from titles;

select distinct gender 
from employees;


set @var1 = 2;
set @var2 = 4;
set @var3 = 2.4;
set @var4 = 'Suan';

select @var1, @var2, @var3, @var4;
select @var4, last_name
from employees;

set @last_name = 'Genin';

prepare name_query
from 'select * from employees where last_name = ?';

execute name_query using @last_name;

set @topk = 20;

prepare limit_query
from 'select * from employees limit ?';

execute limit_query using @topk;


select cast(2.34 as int);
select cast(2.34 as float);
select cast(2.34 as decimal(5, 3));
select cast('2022/12/12' as date);
select cast('2022.12.12' as date);

select convert(2.34, int);
select convert(2.34, float);
select convert(2.34, decimal(5, 3));
select convert('2022/12/12', date);
select convert('2022.12.12', date);

select ceil(1.2), ceil(1.4), ceil(1.5), ceil(1.0);
select floor(1.2), floor(1.4), floor(1.5), floor(1.0);

select round(1.2), round(1.4), round(1.5), round(1.0);
select round(1.23456789, 1), round(1.23456789, 4), round(1.23456789, 7);

select truncate(1.23456789, 1), truncate(1.23456789, 4), truncate(1.23456789, 7);

select abs(123), abs(-123);
select pow(10, 3), power(2, 3), sqrt(4);
select mod(10, 3);

select greatest(12, 4, 18, 2, 8);
select least(12, 4, 18, 2, 8);

select first_name, lower(first_name), lcase(first_name) from employees;
select first_name, upper(first_name), ucase(first_name) from employees;
select first_name, length(first_name) from employees;
select left(first_name, 4) from employees;
select right(first_name,4) from employees;
select mid(first_name,4) from employees;
select lpad(first_name,10,'*') from employees;
select rpad(first_name,10,'*') from employees;
select repeat(first_name,2) from employees;

select ltrim(' suan ');
select rtrim(' suan ');
select trim(' suan ');

select concat(first_name,' ',last_name) from employees;
select insert(first_name, 3,4,'MMMM') from employees;

select replace(first_name,'Chri','MMMM') from employees where first_name like 'Chri%';
select instr(first_name,'st') from employees where first_name like '%st%'

select substring(first_name,1,4) from employees;

select reverse(first_name) from employees;

select lower(title),upper(title) from titles;

select length (first_name) + length(last_name) from employees;

select first_name,last_name from employees;

select lpad(title,20,'_') from titles;

select concat(first_name,' ',rpad(last_name,1,'.')) from employees;

select replace(title,'Staff','사원') from titles;

select replace(gender,'F','Female') from employees;

select now(),sysdate(),current_timestamp();
select curdate(),current_date();
select curtime(), current_time();

select date_add(now(),interval 10 minute);
select date_add(now(),interval 1 month);
select date_sub(now(),interval 10 minute);
select date_sub(now(),interval 1 day);

select addtime('2024-01-01 12:00:00','01:30:30');
select addtime(now(),'02:20:30');
select subtime('202-01-01 12:00:00','01:30:30');
select subtime(now(),'20:20:30');

select year(now()),month(now());
select year('2024/01/01'),month('2024/09/01');

select monthname(now()),dayname(now());
select monthname('2024/01/01'),dayname('2024/09/01');

select dayofmonth(now()),dayofweek(now()),weekday(now());
select dayofmonth('2024/09/01'),dayofweek('2024/09/01'),weekday('2024/09/01');
select dayofmonth('2024/09/05'),dayofweek('2024/09/05'),weekday('2024/09/05');
select dayofmonth('2024/10/30'),dayofweek('2004/09/10'),weekday('2024/09/10');

select date_format(now(),'%Y-%m-%d');
select date_format(now(), '%y %M %D');
select date_format(now(), '%Y %b. %e');

select date_format(now(),'%H:%i');
select date_format(now(),'%k:%i:%S');
select date_format(now(),'%l:%i:%s');

select date_format(now(),'%r');
select date_format(now(),'%T');
select date_format(now(),'%T %H:%i');

select date_add(now(),interval 1 week), date_sub(now(),interval 1 week);
select monthname(date_sub(now(), interval 1 month));
select dayname(date_add(now(), interval 5 day));


# 집계함수
select count(emp_no) from employees; 

select count(*) from employees;

select sum(salary) from salaries;

select sum(salary) / count(salary) from salaries;

select count(salary), sum(salary), avg(salary),
min(salary), max(salary), stddev(salary), variance(salary)
from salaries;

select ceil(avg(salary)), ceil(avg(salary) * 1.1),
ceil(avg(salary) * 1.2)
from salaries;

select from_date, avg(salary)
from salaries
group by from_date;

select to_date, min(salary), max(salary)
from salaries
group by to_date;

select gender, avg(length(first_name)) from employees group by gender;

select gender, min(birth_date), max(birth_date)
from employees
group by gender;

select title, count(*)
from titles
where from_date < '1986-01-01'

# where로 필터링 -> 거기에 대해서 그룹바이를 통해서 집계 수행
# 집계 결과에 대해서 또 조건식을 주겠다 -> having
# group by 기준으로 전처리 = where
# 후처리 = having

select first_name, count(*)
from employees
where birth_date between '1960-01-01' and '1960-12-31';

select from_date, min(salary)
from salaries
where from_date between '2002-01-01' and '2002-12-31';

select from_date, count(*), avg(salary)
from salaries
group by from_date
having avg(salary) >= 50000
order by avg(salary) desc;

select to_date, count(*), avg(salary)
from salaries
where to_date <> '9999-01-01'
group by to_date 
having avg(salary) >= 60000
order by to_date desc;

# 집합 연산자
select emp_no, first_name, last_name
from employees
where hire_date between '1999-12-15' and '2000-01-15' 
intersect
select emp_no, first_name, last_name
from employees
where hire_date between '2000-01-01' and '2000-01-28'

select gender, first_name, last_name
from employees
where birth_date ='1965-02-01'
except
select gender, first_name, last_name 
from employees
where gender = 'M';

# 조인 연산
select first_name, last_name, gender, dept_name
from employees e join dept_emp de join departments d
on e.emp_no = de.emp_no and d.dept_no = de.dept_no;

select e.emp_no, e.first_name, e.last_name, t.title, s.salary
from employees e join salaries s join titles t
on e.emp_no = s.emp_no and e.emp_no = t.emp_no
where s.to_date = '9999-01-01' and t.to_date = '9999-01-01';

select e.emp_no, e.first_name, e.last_name, s.salary
from employees e join salaries s join dept_manager dm
on e.emp_no = s.emp_no and e.emp_no = dm.emp_no 
where s.to_date = '9999-01-01' and dm.to_date = '999-01-01';

select d.dept_name, t.title, e.first_name, e.last_name, s.salary
from employees e join titles t join salaries s join dept_manager dm join departments d
on e.emp_no = t.emp_no and e.emp_no = s.emp_no
and e.emp_no = dm.emp_no and dm.dept_no = d.dept_no
where t.to_date = '9999-01-01' and s.to_date = '9999-01-01'
and dm.to_date = '9999-01-01'
order by e.emp_no, t.from_date desc;

# 서브쿼리
select *
from employees
where birth_date <> ( select birth_date from employees where emp_no = 100000)


select *
from employees
where hire_date between ( select hire_date from employees where emp_no = 10010 ) and ( select hire_date from employees
where emp_no = 10040 );

select *
from employees
where emp_no in (select emp_no from dept_emp where dept_no = 'd007');

select *
from employees
where emp_no not in (select emp_no from salaries where salary <= '80000');

select *
from employees
where emp_no = any ( select emp_no from dept_manager where to_date = '9999-01-0');

select *
from dept_manager
where emp_no = any ( select emp_no from employees where gender = 'M' );

select *
from salaries
where emp_no > all ( select emp_no from employees where birth_date >= '1960-01-01' );

select *
from salaries
where emp_no > all ( select emp_no from dept_manager where to_date = '9999-01-01' )

# DML : INSERT

insert into departments (dept_no, dept_name)
values('d010', 'Software Development');

insert into departments 
values('d011', 'Software Testing');

select *
from departments;

insert into employees 
values(500000, '2000-01-01', 'Suan', 'Lee', 'M', '2022-01-01');

insert into employees 
values(500001, '2000-01-02', 'Susan', 'Lee', 'F', '2022-01-02');

select *
from employees
where emp_no in (500000, 500001);

insert into titles 
values(500000, 'Software Engineer', '2022-01-01', '9999-01-01');

insert into titles 
values(500000, 'Software Engineer', '2022-01-02', '9999-01-01');

select *
from titles t where emp_no in (500000, 500001);

insert into dept_emp 
values(500000, 'd010', '2022-01-01', '9999-01-01');

insert into dept_emp 
values(500001, 'd011', '2022-01-02', '9999-01-01');

select *
from dept_emp 
where emp_no in (500000, 500001);

insert into departments(dept_no, dept_name)
values('d012', 'Electronic Business');
insert into departments(dept_no, dept_name)
values('d013', 'Electronic Commerce');

select *
from departments;

insert into employees
values(1, '1999-06-22', 'Hongseok', 'Cho', 'M', '2022-10-10')

insert into employees
values(2, '1999-11-13', 'Junghoon', 'Lee', 'M', '2022-10-10')

insert into employees
values(3, '03-01-08', 'Chaelim', 'Lee', 'F', '2022-10-10')

select *
from employees 
where emp_no in (1, 2, 3)

insert into titles 
values(1, 'Advisor', '2022-01-01', '9999-01-01')

insert into titles 
values(2, 'Researcher', '2022-01-02', '9999-01-01')

insert into titles 
values(3, 'Researcher', '2022-01-03', '9999-01-01')

select *
from titles 
where emp_no in (1, 2, 3)

insert dept_emp
values (1, 'd012', '2022-01-01', '9999-01-01');

insert dept_emp
values (2, 'd013', '2022-01-02', '9999-01-01');

insert dept_emp
values (3, 'd013', '2022-01-03', '9999-01-01');

# DELETE : select where를 먼저, 그 후 select를
 
update departments 
set dept_name='E-Business'
where dept_no='d012'

update departments 
set dept_name='E-commerce'
where dept_no='d013'

select *
from departments;

update titles
set title = 'Senior Research Engineer', from_date = '2022-01-10'
where emp_no = 1;
update titles
set title = 'Research Engineer', from_date = '2022-01-20'
where emp_no in (2, 3);

select title, from_date
from titles;

select d.dept_name, t.title, e.first_name, e.last_name, e.gender
from employees e join titles t join dept_emp de join departments d
on e.emp_no = t.emp_no and e.emp_no = de.emp_no and de.dept_no = d.dept_nowhere e.emp_no in (1, 2, 3);

# DDL : CREATE

create table products
( product_id int not null auto_increment,
product_name varchar(10) not null,
reg_date date default current_date(),
primary key(product_id))

insert into products(product_name)
values ('Computer');

insert into products(product_name)
values ('Smartphone');

insert into products(product_name, reg_date)
values ('Television', '2000/03/01');

# DDL : ALTER

alter table products
change column product_name name varchar(30) unique;

alter table products add column ( weight int not null );

alter table products add column ( price int not null );

update products set weight = 10, price = 1600000
where product_id = 1;

update products set weight = 0.2, price = 1000000
where product_id = 2;

update products set weight = 20, price = 2000000
where product_id = 3;

alter table products drop column reg_date;

alter table products drop column weight;

# DDL : TRUNCATE

truncate table products;
drop table products;

# 뷰
# [실습] 뷰 생성
create or replace view female_emp_view as
select first_name, last_name, birth_date, hire_date
from employees
where gender = 'F';

select *
from female_emp_view
where hire_date > '2000-01-01';

create or replace view full_emp_view as
select d.dept_name, t.title, e.first_name, e.last_name, s.salary
from departments d join dept_emp de join employees e join salaries s join titles ton d.dept_no = de.dept_no and de.emp_no = e.emp_no and e.emp_no = s.emp_no and e.emp_no

select dept_name, title, avg(salary)
from full_emp_view
group by dept_name, title;

# [실습] 뷰 수정
create or replace view female_emp_view as
select emp_no, first_name, last_name, birth_date, hire_date
from employees
where gender = 'F';

insert into female_emp_view
values (3, 'Seri', 'Lee', '1990-01-01-', '2010-01-01');
select * from female_emp_vi

create or replace view full_emp_view as
select d.dept_name, t.title, e.first_name, e.last_name, s.salary
from departments d join dept_emp de join employees e join salaries s join titles t
on d.dept_no = de.dept_no and de.emp_no = e.emp_no and e.emp_no = s.emp_noand e.emp_no = t.emp_no
where s.to_date = '9999-01-01' and t.to_date = '9999-01-01';

select dept_name, title, first_name, last_name
from full_emp_view fev join dept_manager dm
on fev.emp_no = dm.emp_no
where dm.to_date = '9999-01-01';

# [실습] 뷰 삭제
drop view female_emp_view;
drop view full_emp_vie

# 인덱스
# [실습] 인덱스 생성

# products 테이블에 product_name에 대해서 unique 인덱스인 idx_pname 생성
create unique index idx_pname on products(product_name);
# product 테이블에 reg_date에 대해서 인덱스를 내림차순으로 idx_reg_date 생성
create index idx_reg_date on products(reg_date desc); 
# product 테이블에 생성된 인덱스 조회하기
show index from products; 

# orders 테이블 생성
create table orders
( order_id int auto_increment,
customer_id int not null,
product_id int not null,
qty int not null,
primary key(order_id)
);

# orders 테이블에customer_id를 customers 테이블에customer_id의 외래키로생성
alter table orders
add foreign key(customer_id) references customers(customer_id);
# orders 테이블에product_id를 products 테이블에product_id의 외래키로생성
alter table orders
add foreign key(product_id) references products(product_id);
# orders 테이블에생성된 인덱스조회하기
show index from order

# [실습] 인덱스 삭제
# products 테이블의 인덱스 삭제
drop index idx_pname on products;
drop index idx_reg_date on products;