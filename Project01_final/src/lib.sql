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

update member set mem_phone '234', mem_addr = '12354' where nem_name = '김지은' and mem_date = '4545';
update member set mem_phone ='22', mem_addr='22' where mem_name = '김지은';
drop table member cascade constraint;
drop table book cascade constraint;
drop table rental cascade constraint;

insert into book
values(book_bookno_seq.NEXTVAL,'매우 예민한 사람들을 위한 책   ','정홍진           ','글항아리','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'노화의 종말                           ','데이비드 A. ','부키','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'아비투스                               ','도리스메르틴  ','다산초당','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'지적대화를 위한 넓고 얕은 지식','채사장           ','웨일북','HUMANITIES','N');

insert into book
values(book_bookno_seq.NEXTVAL,'어른들의 거짓된 삶                 ','엘레나 페란테  ','한길사','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'열두 발자국                           ','정재승            ','어크로스','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'보건교사 안은영                    ','정세랑             ','민음사','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'목마름                                ','요 네스뵈          ','비채','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'스토너                                ','존 윌리엄스        ','RH코리아','NOVEL','N');

insert into book
values(book_bookno_seq.NEXTVAL,'팬데믹1918          ','캐서린 아놀드      ','황금시간','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'민족                                 ','아자 가트             ','고유서가','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'사라진 건축, 잊힌 거리      ','최윤식                 ','루아크','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'징비록                               ','조진태                ','주류성','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'덧없는 꽃의 삶                   ','피오나스태퍼드     ','클','HISTORY','N');

insert into book
values(book_bookno_seq.NEXTVAL,'좁은 회랑                           ','대런 애쓰모글루   ','시공사','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'지금 여기, 무탈한가요?  ','오찬호                 ','북트리거','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'코로나 0년 초회복의 시작   ','LAB2050     ','어크로스','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'갈라진 마음들                    ','김성경                ','창비','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'그건 쓰레기가 아니라고요   ','홍수열                 ','슬로비','SOCIETY','N');

insert into book
values(book_bookno_seq.NEXTVAL,'상관없는 거 아닌가?     ','장기하               ','문학동네','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'만남은 지겹고 이별은 지쳤다','색과 체               ','떠오름','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'애쓰지 않고 편안하게          ','김수현               ','놀','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'나는 너를 펭랑해                ','EBS        ','ESB BOOKS','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'살고 싶다는 농담                ','허지웅               ','웅진지식하우스','POEM/ESSAY','N');

insert into book
values(book_bookno_seq.NEXTVAL,'부의 인문학                       ','브라운스톤          ','오픈마인드','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'부의 대이동                       ','오건영                ','페이지2','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'트렌드코리아2021      ','김난도 외 9    ','미래의 창','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'세계미래보고서 2035    ','박영숙, 제롬 글렌','교보문고','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'코로나 이후의 세계             ','제이슨 솅커           ','박성현','ECONOMY','N');


insert into book
values(book_bookno_seq.NEXTVAL,'나는 플랜트 엔지니어입니다','박정호','플루토','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'코로날러지                       ','오범조','토일렛프레스','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'딥메디슨                         ','에릭 토폴','소우주','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'바이오 화장품                  ','김은기','전파과학사','ENGINEERING','N');


insert into book
values(book_bookno_seq.NEXTVAL,'쓰닮쓰닮 로마서                ','햇살콩','규장','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'폭풍 속의 은혜                  ','한홍','규장','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'죽음에 관하여                   ','팀켈러','두란노','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'가회동성당 이야기             ','송차선','일상이상','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'하나님, 듣고 계시죠?   ','구작가','두란노','RELIGION','N');




INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '신화의 미술관                      ', '이주헌', '아트북스', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '퀸 메릴                               ', '에린 칼슨', '현암사', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '당신의 좋은 순간                 ', '필름로그', '동양북스', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '컬러의 힘                           ', '캐런 할러', '윌북', 'ART', 'N');

INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '인간무리                            ', '마크 모펫', '김영사', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, 'VIRUS, 바이러스             ', '과학동아', '동아사이언스', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '주기율표를 읽는 시간           ', '김병민', '동아시아', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '주기율표를 읽는 시간           ', '김병민', '동아시아', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '코스모스(보급판)       ', '칼 세이건', '사이언스북스', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '코스모스(보급판)       ', '칼 세이건', '사이언스북스', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '세포                                  ', '남궁석', '에디토리얼', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '세포                                  ', '남궁석', '에디토리얼', 'SCIENCE', 'N');
 
delete from book where LOCATIONS = 'ART';

insert into member
values (member_memno_seq.NEXTVAL, '홍길동', '920515', '01031836134', '조선');
insert into member
values (member_memno_seq.NEXTVAL, '유재석', '720814', '01011111111', '서울');
insert into member
values (member_memno_seq.NEXTVAL, '박명수', '700827', '01022222222', '군산');
insert into member
values (member_memno_seq.NEXTVAL, '정지훈', '820625', '01043837524', '영암');
insert into member
values (member_memno_seq.NEXTVAL, '강호동', '700611', '01018201054', '용인');
insert into member
values (member_memno_seq.NEXTVAL, '김길동', '801203', '01078428542', '서울');
insert into member
values (member_memno_seq.NEXTVAL, '김상덕', '760301', '01083221852', '알래스카');
insert into member
values (member_memno_seq.NEXTVAL, '정형돈', '780207', '01033333333', '부산');



insert into book
values(book_bookno_seq.NEXTVAL,'매우 예민한 사람들을 위한 책','정홍진','글항아리','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'노화의 종말','데이비드 A. 싱클레어','부키','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'아비투스','도리스메르틴','다산초당','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'지적대화를 위한 넓고 얕은 지식','채사장','웨일북','HUMANITIES','N');
insert into book
values(book_bookno_seq.NEXTVAL,'하루 10분 인문학','이준형','나무의 철학','HUMANITIES','N');

insert into book
values(book_bookno_seq.NEXTVAL,'어른들의 거짓된 삶','엘레나 페란테','한길사','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'열두 발자국','정재승','어크로스','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'보건교사 안은영','정세랑','민음사','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'목마름','요 네스뵈','비채','NOVEL','N');
insert into book
values(book_bookno_seq.NEXTVAL,'스토너','존 윌리엄스','RH코리아','NOVEL','N');

insert into book
values(book_bookno_seq.NEXTVAL,'팬데믹1918','캐서린 아놀드','황금시간','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'민족','아자 가트','고유서가','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'사라진 건축, 잊힌 거리','최윤식','루아크','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'징비록','조진태','주류성','HISTORY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'덧없는 꽃의 삶','피오나스태퍼드','클','HISTORY','N');

insert into book
values(book_bookno_seq.NEXTVAL,'좁은 회랑','대런 애쓰모글루','시공사','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'지금 여기, 무탈한가요?','오찬호','북트리거','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'코로나 0년 초회복의 시작','LAB2050','어크로스','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'갈라진 마음들','김성경','창비','SOCIETY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'그건 쓰레기가 아니라고요','홍수열','슬로비','SOCIETY','N');


insert into book
values(book_bookno_seq.NEXTVAL,'상관없는 거 아닌가?','장기하','문학동네','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'만남은 지겹고 이별은 지쳤다','색과 체','떠오름','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'애쓰지 않고 편안하게','김수현','놀','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'나는 너를 펭랑해','EBS','ESB BOOKS','POEM/ESSAY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'살고 싶다는 농담','허지웅','웅진지식하우스','POEM/ESSAY','N');

insert into book
values(book_bookno_seq.NEXTVAL,'부의 인문학','브라운스톤','오픈마인드','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'부의 대이동','오건영','페이지2','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'트렌드코리아2021','김난도 외 9','미래의 창','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'세계미래보고서 2035~2055','박영숙, 제롬 글렌','교보문고','ECONOMY','N');
insert into book
values(book_bookno_seq.NEXTVAL,'코로나 이후의 세계','제이슨 솅커','박성현','ECONOMY','N');




insert into book
values(book_bookno_seq.NEXTVAL,'쓰닮쓰닮 로마서','햇살콩','규장','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'폭풍 속의 은혜','한홍','규장','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'죽음에 관하여','팀켈러','두란노','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'가회동성당 이야기','송차선','일상이상','RELIGION','N');
insert into book
values(book_bookno_seq.NEXTVAL,'하나님, 듣고 계시죠?','구작가','두란노','RELIGION','N');





insert into book
values(book_bookno_seq.NEXTVAL,'나는 플랜트 엔지니어입니다','박정호','플루토','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'코로날러지','오범조','토일렛프레스','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'침묵의 봄','레이첼 카슨','에코리브르','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'딥메디슨','에릭 토폴','소우주','ENGINEERING','N');
insert into book
values(book_bookno_seq.NEXTVAL,'바이오 화장품','김은기','전파과학사','ENGINEERING','N');





INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '신화의 미술관: 올림포스 신과 그 상징 편', '이주헌', '아트북스', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '퀸 메릴', '에린 칼슨', '현암사', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '당신의 좋은 순간, 필름 사진', '필름로그', '동양북스', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '반 고흐, 별이 빛나는 밤', '마틴 베일리', '아트북스', 'ART', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '컬러의 힘', '캐런 할러', '윌북', 'ART', 'N');

INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '인간무리', '마크 모펫', '김영사', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, 'VIRUS, 바이러스', '과학동아', '동아사이언스', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '주기율표를 읽는 시간', '김병민', '동아시아', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '주기율표를 읽는 시간', '김병민', '동아시아', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '코스모스(보급판)', '칼 세이건', '사이언스북스', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '코스모스(보급판)', '칼 세이건', '사이언스북스', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '세포', '남궁석', '에디토리얼', 'SCIENCE', 'N');
INSERT INTO book
VALUES (book_bookno_seq.NEXTVAL, '세포', '남궁석', '에디토리얼', 'SCIENCE', 'N');





