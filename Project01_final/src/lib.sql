create table book
(book_no number(20) NOT NULL,
title varchar2(70) NOT NULL,
author varchar2(60) NOT NULL,
made varchar2(50) NOT NULL,
location varchar2(50) NOT NULL, 
rental_yn varchar2(2) NOT NULL,
     constraint book_book_no_pk primary key(booK_no),
     constraint book_location_ck check
     (location in('NOVEL','POEM/ESSAY','ECONOMY','SELF_IM','HUMANITIES','HISTORY',
     			'RELIGION','SOCIETY','ART','SCIENCE','ENGINEERING','COMPUTER/IT')),
     constraint book_rental_yn_ck check
     (rental_yn in ('Y','N'))
);

CREATE SEQUENCE book_bookno_seq
   START WITH 100000;

   
DROP SEQUENCE mem_no_seq;
   
DROP SEQUENCE member_memno_seq;
DROP SEQUENCE book_bookno_seq;
DROP SEQUENCE rental_rentalno_seq;

DROP TABLE book cascade constraints;
drop table member;
drop table rental;





create table member 
(mem_no number(20) NOT NULL,
mem_name varchar2(20) NOT NULL,      
mem_date varchar2(30) NOT NULL,
mem_phone varchar2(15) NOT NULL,
mem_addr varchar2(70) ,
constraint member_mem_no_pk primary key(mem_no));

CREATE SEQUENCE member_memno_seq
   INCREMENT by 10
   START WITH 100;
   
   
create sequence mem_no_seq
increment by 10
start with 100
nocycle;
delete from book where location = 'ART';
delete from book where location = 'SCIENCE';

CREATE TABLE rental(
rental_no NUMBER(15) NOT NULL,
book_no NUMBER(15) NOT NULL,
mem_no NUMBER(15) NOT NULL,
rental_date DATE DEFAULT sysdate NOT NULL,
retrun_date DATE DEFAULT sysdate+3 NOT NULL,
return_check VARCHAR2(3) DEFAULT 'N' NOT NULL,
CONSTRAINT rental_rental_no_pk PRIMARY KEY(rental_no),
CONSTRAINT rental_book_no_fk FOREIGN KEY(book_no)
   REFERENCES book(book_no),
CONSTRAINT rental_mem_no_fk FOREIGN KEY(mem_no)
   REFERENCES member(mem_no),
CONSTRAINT rental_retcheck_ck CHECK
(return_check IN ('Y', 'N'))
);

CREATE SEQUENCE rental_rentalno_seq
   START WITH 100;

drop sequence num;

CREATE TABLE rental(
rental_no NUMBER(15) NOT NULL,
book_no NUMBER(15) NOT NULL,
mem_no NUMBER(15) NOT NULL,
rental_date DATE DEFAULT sysdate NOT NULL,
retrun_date DATE DEFAULT sysdate+3 NOT NULL,
return_check VARCHAR2(3) NOT NULL,
CONSTRAINT rental_rental_no_pk PRIMARY KEY(rental_no),
CONSTRAINT rental_book_no_fk FOREIGN KEY(book_no)
   REFERENCES book(book_no),
CONSTRAINT rental_mem_no_fk FOREIGN KEY(mem_no)
   REFERENCES member(mem_no),
CONSTRAINT rental_retcheck_ck CHECK
(return_check IN ('Y', 'N'))
);
	        	SELECT mem_no, mem_name, mem_date, mem_phone, mem_addr FROM member  ORDER BY mem_no asc;
select * from rental;
select * from book;
select * from member;

update member set mem_phone '234', mem_addr = '12354' where nem_name = '������' and mem_date = '4545';
update member set mem_phone ='22', mem_addr='22' where mem_name = '������';
drop table member cascade constraint;
drop table book cascade constraint;
drop table rental cascade constraint;

insert into book
values(book_bookno_seq.NEXTVAL,'�ſ� ������ ������� ���� å   ','��ȫ��           ','���׾Ƹ�','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'��ȭ�� ����                           ','���̺�� A. ','��Ű','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�ƺ�����                               ','�������޸�ƾ  ','�ٻ��ʴ�','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'������ȭ�� ���� �а� ���� ����','ä����           ','���Ϻ�','HUMANITIES','N');

insert into book
values(book_bookno_seq.NEXTVAL,'����� ������ ��                 ','������ �����  ','�ѱ��','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���� ���ڱ�                           ','�����            ','��ũ�ν�','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���Ǳ��� ������                    ','������             ','������','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�񸶸�                                ','�� �׽���          ','��ä','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�����                                ','�� ��������        ','RH�ڸ���','NOVEL','N');

insert into book
values(book_bookno_seq.NEXTVAL,'�ҵ���1918          ','ĳ���� �Ƴ��      ','Ȳ�ݽð�','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'����                                 ','���� ��Ʈ             ','��������','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'����� ����, ���� �Ÿ�      ','������                 ','���ũ','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'¡���                               ','������                ','�ַ���','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'������ ���� ��                   ','�ǿ��������۵�     ','Ŭ','HISTORY','N');

insert into book
values(book_bookno_seq.NEXTVAL,'���� ȸ��                           ','�뷱 �־���۷�   ','�ð���','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���� ����, ��Ż�Ѱ���?  ','����ȣ                 ','��Ʈ����','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�ڷγ� 0�� ��ȸ���� ����   ','LAB2050     ','��ũ�ν�','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'������ ������                    ','�輺��                ','â��','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�װ� �����Ⱑ �ƴ϶���   ','ȫ����                 ','���κ�','SOCIETY','N');

insert into book
values(book_bookno_seq.NEXTVAL,'������� �� �ƴѰ�?     ','�����               ','���е���','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'������ ����� �̺��� ���ƴ�','���� ü               ','������','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�־��� �ʰ� ����ϰ�          ','�����               ','��','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���� �ʸ� �����                ','EBS        ','ESB BOOKS','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'��� �ʹٴ� ���                ','������               ','���������Ͽ콺','POEM/ESSAY','N');

insert into book
values(book_bookno_seq.NEXTVAL,'���� �ι���                       ','�����          ','���¸��ε�','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���� ���̵�                       ','���ǿ�                ','������2','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'Ʈ�����ڸ���2021      ','�賭�� �� 9    ','�̷��� â','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'����̷����� 2035    ','�ڿ���, ���� �۷�','��������','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�ڷγ� ������ ����             ','���̽� ��Ŀ           ','�ڼ���','ECONOMY','N');


insert into book
values(book_bookno_seq.NEXTVAL,'���� �÷�Ʈ �����Ͼ��Դϴ�','����ȣ','�÷���','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�ڷγ�����                       ','������','���Ϸ�������','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���޵�                         ','���� ����','�ҿ���','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���̿� ȭ��ǰ                  ','������','���İ��л�','ENGINEERING','N');


insert into book
values(book_bookno_seq.NEXTVAL,'���ྲ�� �θ���                ','�޻���','����','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'��ǳ ���� ����                  ','��ȫ','����','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'������ ���Ͽ�                   ','���̷�','�ζ���','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'��ȸ������ �̾߱�             ','������','�ϻ��̻�','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�ϳ���, ��� �����?   ','���۰�','�ζ���','RELIGION','N');




INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '��ȭ�� �̼���                      ', '������', '��Ʈ�Ͻ�', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�� �޸�                               ', '���� Į��', '���ϻ�', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '����� ���� ����                 ', '�ʸ��α�', '����Ͻ�', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�÷��� ��                           ', 'ĳ�� �ҷ�', '����', 'ART', 'N');

INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�ΰ�����                            ', '��ũ ����', '�迵��', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, 'VIRUS, ���̷���             ', '���е���', '���ƻ��̾�', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�ֱ���ǥ�� �д� �ð�           ', '�躴��', '���ƽþ�', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�ֱ���ǥ�� �д� �ð�           ', '�躴��', '���ƽþ�', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�ڽ���(������)       ', 'Į ���̰�', '���̾𽺺Ͻ�', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�ڽ���(������)       ', 'Į ���̰�', '���̾𽺺Ͻ�', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '����                                  ', '���ü�', '�����丮��', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '����                                  ', '���ü�', '�����丮��', 'SCIENCE', 'N');
 
delete from book where LOCATIONS = 'ART';

insert into member
values (member_memno_seq.NEXTVAL, 'ȫ�浿', '920515', '01031836134', '����');
insert into member
values (member_memno_seq.NEXTVAL, '���缮', '720814', '01011111111', '����');
insert into member
values (member_memno_seq.NEXTVAL, '�ڸ��', '700827', '01022222222', '����');
insert into member
values (member_memno_seq.NEXTVAL, '������', '820625', '01043837524', '����');
insert into member
values (member_memno_seq.NEXTVAL, '��ȣ��', '700611', '01018201054', '����');
insert into member
values (member_memno_seq.NEXTVAL, '��浿', '801203', '01078428542', '����');
insert into member
values (member_memno_seq.NEXTVAL, '����', '760301', '01083221852', '�˷���ī');
insert into member
values (member_memno_seq.NEXTVAL, '������', '780207', '01033333333', '�λ�');



insert into book
values(book_bookno_seq.NEXTVAL,'�ſ� ������ ������� ���� å','��ȫ��','���׾Ƹ�','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'��ȭ�� ����','���̺�� A. ��Ŭ����','��Ű','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�ƺ�����','�������޸�ƾ','�ٻ��ʴ�','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'������ȭ�� ���� �а� ���� ����','ä����','���Ϻ�','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�Ϸ� 10�� �ι���','������','������ ö��','HUMANITIES','N');

insert into book
values(book_bookno_seq.NEXTVAL,'����� ������ ��','������ �����','�ѱ��','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���� ���ڱ�','�����','��ũ�ν�','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���Ǳ��� ������','������','������','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�񸶸�','�� �׽���','��ä','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�����','�� ��������','RH�ڸ���','NOVEL','N');

insert into book
values(book_bookno_seq.NEXTVAL,'�ҵ���1918','ĳ���� �Ƴ��','Ȳ�ݽð�','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'����','���� ��Ʈ','��������','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'����� ����, ���� �Ÿ�','������','���ũ','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'¡���','������','�ַ���','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'������ ���� ��','�ǿ��������۵�','Ŭ','HISTORY','N');

insert into book
values(book_bookno_seq.NEXTVAL,'���� ȸ��','�뷱 �־���۷�','�ð���','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���� ����, ��Ż�Ѱ���?','����ȣ','��Ʈ����','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�ڷγ� 0�� ��ȸ���� ����','LAB2050','��ũ�ν�','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'������ ������','�輺��','â��','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�װ� �����Ⱑ �ƴ϶���','ȫ����','���κ�','SOCIETY','N');


insert into book
values(book_bookno_seq.NEXTVAL,'������� �� �ƴѰ�?','�����','���е���','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'������ ����� �̺��� ���ƴ�','���� ü','������','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�־��� �ʰ� ����ϰ�','�����','��','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���� �ʸ� �����','EBS','ESB BOOKS','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'��� �ʹٴ� ���','������','���������Ͽ콺','POEM/ESSAY','N');

insert into book
values(book_bookno_seq.NEXTVAL,'���� �ι���','�����','���¸��ε�','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���� ���̵�','���ǿ�','������2','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'Ʈ�����ڸ���2021','�賭�� �� 9','�̷��� â','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'����̷����� 2035~2055','�ڿ���, ���� �۷�','��������','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�ڷγ� ������ ����','���̽� ��Ŀ','�ڼ���','ECONOMY','N');




insert into book
values(book_bookno_seq.NEXTVAL,'���ྲ�� �θ���','�޻���','����','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'��ǳ ���� ����','��ȫ','����','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'������ ���Ͽ�','���̷�','�ζ���','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'��ȸ������ �̾߱�','������','�ϻ��̻�','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�ϳ���, ��� �����?','���۰�','�ζ���','RELIGION','N');





insert into book
values(book_bookno_seq.NEXTVAL,'���� �÷�Ʈ �����Ͼ��Դϴ�','����ȣ','�÷���','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'�ڷγ�����','������','���Ϸ�������','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'ħ���� ��','����ÿ ī��','���ڸ��긣','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���޵�','���� ����','�ҿ���','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'���̿� ȭ��ǰ','������','���İ��л�','ENGINEERING','N');





INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '��ȭ�� �̼���: �ø����� �Ű� �� ��¡ ��', '������', '��Ʈ�Ͻ�', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�� �޸�', '���� Į��', '���ϻ�', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '����� ���� ����, �ʸ� ����', '�ʸ��α�', '����Ͻ�', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�� ����, ���� ������ ��', '��ƾ ���ϸ�', '��Ʈ�Ͻ�', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�÷��� ��', 'ĳ�� �ҷ�', '����', 'ART', 'N');

INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�ΰ�����', '��ũ ����', '�迵��', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, 'VIRUS, ���̷���', '���е���', '���ƻ��̾�', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�ֱ���ǥ�� �д� �ð�', '�躴��', '���ƽþ�', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�ֱ���ǥ�� �д� �ð�', '�躴��', '���ƽþ�', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�ڽ���(������)', 'Į ���̰�', '���̾𽺺Ͻ�', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '�ڽ���(������)', 'Į ���̰�', '���̾𽺺Ͻ�', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '����', '���ü�', '�����丮��', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '����', '���ü�', '�����丮��', 'SCIENCE', 'N');





