--------------------------------------------------------
--  파일이 생성됨 - 일요일-6월-02-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_COMMENTS_COMMENT_NO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_COMMENTS_COMMENT_NO"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 10080 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PRODUCT_PROD_NO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PRODUCT_PROD_NO"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 10060 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_TRANSACTION_TRAN_NO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_TRANSACTION_TRAN_NO"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 10080 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE "COMMENTS" 
   (	"COMMENT_NO" NUMBER, 
	"PROD_NO" NUMBER(16,0), 
	"REPLY" VARCHAR2(200 BYTE), 
	"INPUT_DATE" VARCHAR2(20 BYTE), 
	"USER_ID" VARCHAR2(20 BYTE), 
	"LIKE_CNT" NUMBER(5,0) DEFAULT 0
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "PRODUCT" 
   (	"PROD_NO" NUMBER, 
	"PROD_NAME" VARCHAR2(100 BYTE), 
	"PROD_DETAIL" VARCHAR2(200 BYTE), 
	"MANUFACTURE_DAY" VARCHAR2(10 BYTE), 
	"PRICE" NUMBER(10,0), 
	"IMAGE_FILE" VARCHAR2(100 BYTE), 
	"REG_DATE" DATE, 
	"PROD_AMOUNT" NUMBER(3,0)
   ) ;
--------------------------------------------------------
--  DDL for Table TRANSACTION
--------------------------------------------------------

  CREATE TABLE "TRANSACTION" 
   (	"TRAN_NO" NUMBER, 
	"PROD_NO" NUMBER(16,0), 
	"BUYER_ID" VARCHAR2(20 BYTE), 
	"PAYMENT_OPTION" CHAR(3 BYTE), 
	"RECEIVER_NAME" VARCHAR2(20 BYTE), 
	"RECEIVER_PHONE" VARCHAR2(14 BYTE), 
	"DEMAILADDR" VARCHAR2(100 BYTE), 
	"DLVY_REQUEST" VARCHAR2(100 BYTE), 
	"TRAN_STATUS_CODE" CHAR(3 BYTE), 
	"ORDER_DATA" DATE, 
	"DLVY_DATE" DATE, 
	"AMOUNT" NUMBER(3,0)
   ) ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "USERS" 
   (	"USER_ID" VARCHAR2(20 BYTE), 
	"USER_NAME" VARCHAR2(50 BYTE), 
	"PASSWORD" VARCHAR2(10 BYTE), 
	"ROLE" VARCHAR2(5 BYTE) DEFAULT 'user', 
	"SSN" VARCHAR2(13 BYTE), 
	"CELL_PHONE" VARCHAR2(14 BYTE), 
	"ADDR" VARCHAR2(100 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"REG_DATE" DATE
   ) ;
REM INSERTING into COMMENTS
SET DEFINE OFF;
Insert into COMMENTS (COMMENT_NO,PROD_NO,REPLY,INPUT_DATE,USER_ID,LIKE_CNT) values (10024,10001,'오 이사이트 괜찮아요','2019/05/24 01:10:39','user15',10);
Insert into COMMENTS (COMMENT_NO,PROD_NO,REPLY,INPUT_DATE,USER_ID,LIKE_CNT) values (10022,10000,'ㅇㅇㅇ','2019/05/23 10:43:08','user15',10);
Insert into COMMENTS (COMMENT_NO,PROD_NO,REPLY,INPUT_DATE,USER_ID,LIKE_CNT) values (10023,10002,'도대체 왜 안되냐고 씨불','2019/05/23 11:23:12','user15',0);
Insert into COMMENTS (COMMENT_NO,PROD_NO,REPLY,INPUT_DATE,USER_ID,LIKE_CNT) values (10025,10000,'ㅇㅇㅇ','2019/05/24 01:11:26','user15',5);
Insert into COMMENTS (COMMENT_NO,PROD_NO,REPLY,INPUT_DATE,USER_ID,LIKE_CNT) values (10026,10003,'오 이사이트 괜찮아요','2019/05/24 01:13:37','user15',0);
Insert into COMMENTS (COMMENT_NO,PROD_NO,REPLY,INPUT_DATE,USER_ID,LIKE_CNT) values (10040,10000,'오 이사이트 괜찮아요','2019/06/01 06:58:59','user15',7);
Insert into COMMENTS (COMMENT_NO,PROD_NO,REPLY,INPUT_DATE,USER_ID,LIKE_CNT) values (10041,10000,'ㅇㅇㅇ','2019/06/01 07:49:44','user15',0);
Insert into COMMENTS (COMMENT_NO,PROD_NO,REPLY,INPUT_DATE,USER_ID,LIKE_CNT) values (10042,10000,'오 이사이트 괜찮아요','2019/06/01 07:50:26','user15',0);
Insert into COMMENTS (COMMENT_NO,PROD_NO,REPLY,INPUT_DATE,USER_ID,LIKE_CNT) values (10043,10000,'테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트','2019/06/01 07:50:37','user15',2);
Insert into COMMENTS (COMMENT_NO,PROD_NO,REPLY,INPUT_DATE,USER_ID,LIKE_CNT) values (10045,10000,'글자개수테스트글자개수테스트글자개수테스트글자개수테스트글자개수테스트글자개수테스트글자개수테스트글자개수테스트글자개수테스트','2019/06/01 07:50:51','user15',0);
Insert into COMMENTS (COMMENT_NO,PROD_NO,REPLY,INPUT_DATE,USER_ID,LIKE_CNT) values (10060,10042,'개비싸','2019/06/02 12:04:25','admin',0);
REM INSERTING into PRODUCT
SET DEFINE OFF;
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10000,'마이스터스 노트북 케이스','몽블랑에서 선보이는 혁신적인 노트북 케이스','2019-05-30',1070000,'001.png',to_date('12/12/14','RR/MM/DD'),10);
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10001,'마이스터튁 울트라 슬림','마이스터스튁 울트라 슬림 도큐먼트 케이스','20120514',1300000,'003.png',to_date('12/11/14','RR/MM/DD'),50);
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10002,'보르도','최고 디자인 신품','20120201',1170000,'AHlbAAAAvewfegAB.jpg',to_date('12/10/14','RR/MM/DD'),999);
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10003,'보드세트','한시즌 밖에 안썼습니다. 눈물을 머금고 내놓음 ㅠ.ㅠ','20120217',200000,'AHlbAAAAve1WwgAC.jpg',to_date('12/11/14','RR/MM/DD'),999);
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10004,'인라인','좋아욥','20120819',20000,'AHlbAAAAve37LwAD.jpg',to_date('12/11/14','RR/MM/DD'),999);
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10005,'삼성센스 2G','sens 메모리 2Giga','20121121',800000,'AHlbAAAAtBqyWAAA.jpg',to_date('12/11/14','RR/MM/DD'),999);
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10006,'연꽃','정원을 가꿔보세요','20121022',232300,'AHlbAAAAtDPSiQAA.jpg',to_date('12/11/15','RR/MM/DD'),999);
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10007,'삼성센스','노트북','20120212',600000,'AHlbAAAAug1vsgAA.jpg',to_date('12/11/12','RR/MM/DD'),999);
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10042,'마이스터스튁','세련되면서도 슬림하고 깔끔한 라인이 직장 생활에 활력을 불어넣을 제품을 찾고 있는 젊은 사업가들의 이목을 집중시킵니다','2019-06-15',1790000,'001.png',to_date('19/06/02','RR/MM/DD'),5);
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10008,'테스트001','테스트001','20190516',50000,'noImg',to_date('19/05/10','RR/MM/DD'),999);
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10009,'테스트002','테스트002','20190523',50000,'noImg',to_date('19/05/10','RR/MM/DD'),999);
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10010,'테스트001','테스트001','20190517',100000,'1.jpg',to_date('19/05/11','RR/MM/DD'),999);
Insert into PRODUCT (PROD_NO,PROD_NAME,PROD_DETAIL,MANUFACTURE_DAY,PRICE,IMAGE_FILE,REG_DATE,PROD_AMOUNT) values (10020,'잼미','이쁘네','20190525',100000,'qd6fB8f.gif',to_date('19/05/25','RR/MM/DD'),999);
REM INSERTING into TRANSACTION
SET DEFINE OFF;
Insert into TRANSACTION (TRAN_NO,PROD_NO,BUYER_ID,PAYMENT_OPTION,RECEIVER_NAME,RECEIVER_PHONE,DEMAILADDR,DLVY_REQUEST,TRAN_STATUS_CODE,ORDER_DATA,DLVY_DATE,AMOUNT) values (10001,10001,'user15','1  ','ㅁㄴㅇ','119','QQQ','QQQ','002',null,to_date('19/05/02','RR/MM/DD'),null);
Insert into TRANSACTION (TRAN_NO,PROD_NO,BUYER_ID,PAYMENT_OPTION,RECEIVER_NAME,RECEIVER_PHONE,DEMAILADDR,DLVY_REQUEST,TRAN_STATUS_CODE,ORDER_DATA,DLVY_DATE,AMOUNT) values (10060,10001,'admin','1  ','admin',null,'서울시 서초구',null,'001',null,to_date('19/06/01','RR/MM/DD'),1);
Insert into TRANSACTION (TRAN_NO,PROD_NO,BUYER_ID,PAYMENT_OPTION,RECEIVER_NAME,RECEIVER_PHONE,DEMAILADDR,DLVY_REQUEST,TRAN_STATUS_CODE,ORDER_DATA,DLVY_DATE,AMOUNT) values (10003,10002,'user15','1  ','SCOTT','119','QQQ','111','002',to_date('19/05/16','RR/MM/DD'),to_date('19/05/03','RR/MM/DD'),null);
Insert into TRANSACTION (TRAN_NO,PROD_NO,BUYER_ID,PAYMENT_OPTION,RECEIVER_NAME,RECEIVER_PHONE,DEMAILADDR,DLVY_REQUEST,TRAN_STATUS_CODE,ORDER_DATA,DLVY_DATE,AMOUNT) values (10004,10005,'user15','1  ','AAA','111','222','333','002',to_date('19/05/04','RR/MM/DD'),to_date('19/05/03','RR/MM/DD'),null);
Insert into TRANSACTION (TRAN_NO,PROD_NO,BUYER_ID,PAYMENT_OPTION,RECEIVER_NAME,RECEIVER_PHONE,DEMAILADDR,DLVY_REQUEST,TRAN_STATUS_CODE,ORDER_DATA,DLVY_DATE,AMOUNT) values (10041,10000,'user15','1  ','은우','010-2474-9706','내마음속',null,'002',null,to_date('19/06/01','RR/MM/DD'),1);
Insert into TRANSACTION (TRAN_NO,PROD_NO,BUYER_ID,PAYMENT_OPTION,RECEIVER_NAME,RECEIVER_PHONE,DEMAILADDR,DLVY_REQUEST,TRAN_STATUS_CODE,ORDER_DATA,DLVY_DATE,AMOUNT) values (10042,10000,'user15','1  ','은우','010-2474-9706','내마음속',null,'002',null,to_date('19/06/01','RR/MM/DD'),20);
Insert into TRANSACTION (TRAN_NO,PROD_NO,BUYER_ID,PAYMENT_OPTION,RECEIVER_NAME,RECEIVER_PHONE,DEMAILADDR,DLVY_REQUEST,TRAN_STATUS_CODE,ORDER_DATA,DLVY_DATE,AMOUNT) values (10061,10001,'user15','1  ','은우','010-2474-9706','내마음속',null,'002',null,to_date('19/06/01','RR/MM/DD'),1);
Insert into TRANSACTION (TRAN_NO,PROD_NO,BUYER_ID,PAYMENT_OPTION,RECEIVER_NAME,RECEIVER_PHONE,DEMAILADDR,DLVY_REQUEST,TRAN_STATUS_CODE,ORDER_DATA,DLVY_DATE,AMOUNT) values (10062,10000,'user15','1  ','은우','010-2474-9706','내마음속',null,'002',null,to_date('19/06/01','RR/MM/DD'),100);
REM INSERTING into USERS
SET DEFINE OFF;
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('admin','admin','1234','admin',null,null,'서울시 서초구','admin@mvc.com',to_date('12/01/14','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('manager','manager','1234','admin',null,null,null,'manager@mvc.com',to_date('12/01/14','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user01','SCOTT','1111','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user02','SCOTT','2222','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user03','SCOTT','3333','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user04','SCOTT','4444','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user05','SCOTT','5555','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user06','SCOTT','6666','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user07','SCOTT','7777','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user08','SCOTT','8888','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user09','SCOTT','9999','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user10','SCOTT','1010','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user11','SCOTT','1111','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user12','SCOTT','1212','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user13','SCOTT','1313','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user14','SCOTT','1414','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user15','은우','1515','user',null,'010-2474-9706','내마음속','p960720@naver.com',to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user16','SCOTT','1616','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user17','SCOTT','1717','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user18','SCOTT','1818','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
Insert into USERS (USER_ID,USER_NAME,PASSWORD,ROLE,SSN,CELL_PHONE,ADDR,EMAIL,REG_DATE) values ('user19','SCOTT','1919','user',null,null,null,null,to_date('19/05/01','RR/MM/DD'));
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "PRODUCT" MODIFY ("PROD_NO" NOT NULL ENABLE);
 
  ALTER TABLE "PRODUCT" MODIFY ("PROD_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "PRODUCT" ADD PRIMARY KEY ("PROD_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "COMMENTS" MODIFY ("COMMENT_NO" NOT NULL ENABLE);
 
  ALTER TABLE "COMMENTS" MODIFY ("PROD_NO" NOT NULL ENABLE);
 
  ALTER TABLE "COMMENTS" MODIFY ("REPLY" NOT NULL ENABLE);
 
  ALTER TABLE "COMMENTS" ADD PRIMARY KEY ("COMMENT_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table TRANSACTION
--------------------------------------------------------

  ALTER TABLE "TRANSACTION" MODIFY ("TRAN_NO" NOT NULL ENABLE);
 
  ALTER TABLE "TRANSACTION" MODIFY ("PROD_NO" NOT NULL ENABLE);
 
  ALTER TABLE "TRANSACTION" MODIFY ("BUYER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "TRANSACTION" ADD PRIMARY KEY ("TRAN_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "USERS" MODIFY ("USER_ID" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("USER_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" MODIFY ("PASSWORD" NOT NULL ENABLE);
 
  ALTER TABLE "USERS" ADD PRIMARY KEY ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "COMMENTS" ADD FOREIGN KEY ("PROD_NO")
	  REFERENCES "PRODUCT" ("PROD_NO") ENABLE;
 
  ALTER TABLE "COMMENTS" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TRANSACTION
--------------------------------------------------------

  ALTER TABLE "TRANSACTION" ADD FOREIGN KEY ("PROD_NO")
	  REFERENCES "PRODUCT" ("PROD_NO") ENABLE;
 
  ALTER TABLE "TRANSACTION" ADD FOREIGN KEY ("BUYER_ID")
	  REFERENCES "USERS" ("USER_ID") ENABLE;
