create table member (
	name varchar2(110) not null,
	id varchar2(110) primary key,
	pwd varchar2(110) not null,
	pwd2 varchar2(110) not null,
	email varchar2(110) not null,
	gender varchar2(110) not null
);

drop table member;
select pwd from member where id= 'asd';
select * from member;

create table place_board (
	num number(1) primary key,
	title varchar2(110),
	content varchar2(110),
	Date date default sysdate,
	hit number(100),
	groupNum number(100),
);

create table offer_board (
	num number(1) primary key,
	title varchar2(110),
	content varchar2(110),
	Date date default sysdate,
	hit number(100),
	groupNum number(100),
);
