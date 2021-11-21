---------- MEMBER 테이블 ------------

​
drop table member;


create table member(
    member_idx       number(10) primary key,
    member_id        varchar2(20),
    member_pw        varchar2(20),
    member_name      varchar2(20),
    member_email1     varchar2(100),
    member_email2     varchar2(100),
    member_phone     varchar2(20),
    member_postcode  varchar2(6),
    member_address1   varchar2(100),
    member_address2    varchar2(50),
    member_gender    varchar2(100),
    member_birthdate      date,
    member_joindate      date default sysdate
);
​
drop sequence member_seq;
create sequence member_seq;
​
insert into member(member_idx, member_id, member_pw, member_name, member_email1, member_email2, member_phone, member_postcode, member_address1, member_address2, member_gender, member_birthdate, member_joindate)
values (member_seq.nextval, 'saltriver', '1234', '소금강', 'saltriver', 'gmail.com', '010-1111-2222', '01256', '서울시 노원구', '00동 00호', 'male', '2020/01/01', sysdate);
​

-- ITEM 테이블
drop table items;
create table items(
    item_idx        number(10) primary key,
    item_category   varchar2(100),
    item_name       varchar2(100),
    item_price      varchar2(10),
    item_option     varchar2(100),
    item_MainImg    varchar2(100),
    item_img        varchar2(100),
    item_content    varchar2(2000),
    item_date       date default sysdate
);
drop sequence items_seq;
create sequence items_seq;


insert into items(item_idx, item_category, item_name,  item_price, item_option, item_MainImg, item_img, item_content, item_date)
values (items_seq.nextval, 'Bracelet',  'Layer Ribbon Beads Ring (Sky Blue)',  '20000', 'option', '2394832.png', '2394832.png', 
'Description
사랑스러운 더블 리본으로 포인트를 준 팔찌입니다.
화이트 컬러의 진주 위에 파스텔톤 컬러의 진주로 포인트를 준 유니크한 디자인입니다.
리본 밑으로 ♡ 모양과 드롭 모양의 핵진주 소재 꼬리를 달아 움직임에 따라 춤을 추듯 흩날립니다.
*연장 체인은 신주 + OR도금, 로고 참은 로듐 소재로, 기본적인 알러지 방지 처리는 되어있지만, 개인차에 따른 알러지 반응은 확답드릴 수 없습니다. 심한 알러지가 있으신 분들은 신중하게 고민 후 구매하시길 권장합니다.
Size
줄 21.5cm (about) *연장 체인 6cm가 포함된 길이입니다.
Color
Mint
Materials
Imitation Acrylic Pearl, Nucleus Pearl, Brass, Rhodium
Made in Korea', sysdate);
​
​
-- 공지사항
drop table notice;
create table notice(
notice_idx number(4) primary key,
notice_name varchar2(100),
notice_title varchar2(100),
notice_content varchar2(2000),
notice_img varchar2(100),
notice_date date default sysdate,
notice_hit number(4) default 0
);
drop sequence notice_seq;
create sequence notice_seq;
​
insert into notice(notice_idx, notice_name, notice_title, notice_content, notice_img, notice_date)
values (notice_seq.nextval, '관리자', '주문 전 필독사항', '주문/결제', 'bijou_logo.png', sysdate);
​
-- 주문내역
create table order_list(
order_list_idx number(4) primary key,
order_number number(10),
order_user varchar2(10),
order_user_id varchar2(20),
order_user_phone varchar2(20),
order_user_address varchar2(100),
order_item_img varchar2(100) ,
order_item_info varchar2(50),
order_amount number(3),
order_date date default sysdate,
order_request    varchar2(200),
order_payment   varchar2(20),
order_status varchar2(20),
order_total_payment varchar2(50)
);
​
drop sequence order_list_seq;
create sequence order_list_seq;
​
insert into order_list(order_list_idx, 
                        order_number, 
                        order_user, 
                        order_user_id, 
                        order_user_phone,
                        order_user_address,
                        order_item_img, 
                        order_item_info, 
                        order_amount, 
                        order_date,
                        order_request,
                        order_payment, 
                        order_status,
                        order_total_payment)
values (order_list_seq.nextval, 
        '20210907', 
        '소금강',
        'saltriver',
        '010-1111-2222',
        '서울시 노원구 00동 00호',
        'load_img', 
        '비쥬 반지', 
        '1', 
        sysdate,
        '빠른 배송 부탁드립니다!',
        '무통장입금', 
        '결제완료',
        '30000원');



-- 장바구니
create table cart(
    cart_item_idx        number(10) primary key,
    cart_member_id       varchar2(100),
    cart_item_category   varchar2(100),
    cart_item_name       varchar2(100),
    cart_item_price      varchar2(10),
    cart_item_amount     varchar2(10),
    cart_item_img        varchar2(100),
    cart_item_content    varchar2(2000)
);

drop table cart;

create sequence cart_seq
INCREMENT BY 1 --증감숫자 1
START WITH 1 --시작숫자 1
MINVALUE 1 --최소값 1
NOCYCLE; --순환하지않음

drop sequence cart_seq;



​
-- 리뷰(후기)
drop table review;
create table review(
    review_idx      number(4) primary key,
    item_idx_fk     number(4),
    review_image    varchar2(255),
    review_date     date default sysdate,
    review_name     varchar2(20),
    review_content  varchar2(2000),
    review_score    varchar2(20)
);
drop sequence review_seq;
create sequence review_seq;
insert into review(review_idx, item_idx_fk, review_image, review_date, review_name, review_content, review_score)
values (review_seq.nextval, 1,'2394832.png',sysdate,'홍길동','리뷰내용','★★★★');

-- 아이템 QnA
drop table items_qna;
create table items_qna(
    items_qna_idx      number(4) primary key,
    items_qna_idx_fk   number(4),
    items_qna_title    varchar2(100),
    items_qna_name     varchar2(20),
    items_qna_password varchar2(20),
    items_qna_secret   varchar2(20),
    items_qna_content  varchar2(2000),
    items_qna_date     date default sysdate,
    items_qna_hit      number(4)
);

drop sequence items_qna_seq;
create sequence items_qna_seq;

insert into items_qna(items_qna_idx, items_qna_idx_fk, items_qna_title, items_qna_name, items_qna_password, items_qna_secret, items_qna_content, items_qna_date, items_qna_hit)
values(items_qna_seq.nextval, 1, '상품 문의','홍길동','1234', '1', 'qna 내용', sysdate, 2);


​----1대1문의------

create table one2one(
    one2one_idx      		number(10) primary key,
    one2one_category		varchar2(20),
    one2one_img		 	    varchar2(200),
    one2one_name            varchar2(20),
    one2one_pw              varchar2(20),
    one2one_title     		varchar2(100),
    one2one_content  		varchar2(500),
    one2one_date     		date default sysdate
);

create sequence one2one_seq;

insert into one2one (one2one_idx, one2one_category, one2one_img, one2one_name, one2one_pw, one2one_title, one2one_content, one2one_date)
values (one2one_seq.nextval, '배송지연/불만', '/img/items/bracelet/bracelet05_1.jpg', '홍길동', '1234', '배송이 너무 늦습니다.', '배송이 너무 늦는것 같습니다.', sysdate);


drop sequence one2one_seq;
drop table one2one;
​


--1대1문의 관리자 답변--

create table one2one_reply (
	one2one_reply_idx			 number(4) primary key,
	one2one_reply_name			 varchar2(20),
	one2one_reply_title			 varchar2(50),
	one2one_reply_content		 varchar2(500),
	one2one_reply_one2one_idx	 number(4),
	one2one_reply_date			 date default sysdate
);
	

create sequence one2one_reply_seq;
	
insert into one2one_reply (one2one_reply_idx, one2one_reply_name, one2one_reply_title, one2one_reply_content, one2one_reply_one2one_idx, one2one_reply_date)
values (one2one_reply_seq.nextval, '비쥬', '문의하신 내용의 답변입니다.', '문의한 내용의 답변', 1, sysdate);

drop sequence one2one_reply_seq;
drop table one2one_reply;
​


-- 주문 페이지
drop table payment;
create table payment (
	payment_idx			  number(4) primary key,
	payment_name		  varchar2(20),
	payment_address		  varchar2(20),
	payment_phone		  varchar2(20),
	payment_request		  varchar2(200),
	payment_total_payment varchar2(20),
	payment_payment		  varchar2(20),
	payment_date	      date default sysdate
);
	
drop sequence payment_seq;
create sequence payment_seq;
	
insert into payment (payment_idx, payment_name, payment_address, payment_phone, payment_request, payment_total_payment, payment_payment, payment_date)
values (payment_seq.nextval, '홍길동', '서울 노원구', '010-1111-2222', '빠른 배송부탁드립니다.', '30000', '무통장 입금',sysdate);

--qna answer
drop table qna_answer;
create table qna_answer (
	qna_answer_idx	    number(4) primary key,
    qna_answer_idx_fk   number(4),
	qna_answer_name		varchar2(20),
	qna_answer_content	varchar2(1000),
	qna_answer_state	varchar2(20),
	qna_answer_date	    date default sysdate
);
	
drop sequence qna_answer_seq;
create sequence qna_answer_seq;
	
insert into qna_answer (qna_answer_idx, qna_answer_idx_fk, qna_answer_name, qna_answer_content, qna_answer_state, qna_answer_date)
values (qna_answer_seq.nextval, 2, '비쥬', '답변입니다.', '1', sysdate);