REM   Script: CREATE_DB_FOR_PING-T
REM   ORACLE_MASTER_BRONZE

SELECT 
  SYSDATE, SYSTIMESTAMP 
FROM 
  DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = "YYYY-MM-DD";

ALTER SESSION SET NLS_TIMESTAMP_FORMAT = "YYYY-MM-DD HH24:MI:SS.FF";

SELECT 
  SYSDATE, SYSTIMESTAMP 
FROM 
  DUAL;

CREATE TABLE departments 
       (department_id	NUMBER(2) CONSTRAINT pk_dept PRIMARY KEY, 
	department_name	VARCHAR2(21) , 
        manager_id	NUMBER(4)) ;

INSERT INTO departments VALUES (1, '総務', 1001);

INSERT INTO departments VALUES (2, '営業', 1002);

INSERT INTO departments VALUES (3, '開発', 1003);

INSERT INTO departments VALUES (4, 'マーケティング', 1004);

INSERT INTO departments VALUES (5, '品質管理', 1005);

SELECT * FROM departments;

CREATE TABLE departments2 
       (department_id	ROWID CONSTRAINT pk_dept2 PRIMARY KEY);

SELECT * FROM departments2;

CREATE TABLE departments3 
       (department_id	NUMBER(2) CONSTRAINT pk_dept3 PRIMARY KEY, 
	department_name	VARCHAR2(21) , 
        employee_id	NUMBER(4)) ;

INSERT INTO departments3 VALUES (1, '総務', 1001);

INSERT INTO departments3 VALUES (2, '営業', 1001);

INSERT INTO departments3 VALUES (3, '開発', 1001);

INSERT INTO departments3 VALUES (4, '品質管理', 1001);

INSERT INTO departments3 VALUES (5, 'マーケティング', 1001);

SELECT * FROM departments3;

CREATE TABLE employees 
       (employee_id	NUMBER(4) CONSTRAINT pk_emp PRIMARY KEY, 
	employee_name	VARCHAR2(15), 
	yomi		VARCHAR2(24), 
	job_id		NUMBER(4), 
	manager_id	NUMBER(4), 
	hiredate	DATE, 
	salary		NUMBER(7), 
	commission	NUMBER(7), 
	department_id	NUMBER(2) CONSTRAINT fk_deptno REFERENCES departments(department_id));

INSERT INTO employees VALUES (1001, '山田二郎', 'やまだじろう', 1002, NULL, '2001-04-01', 500000, 2000000, 1);

INSERT INTO employees VALUES (1002, '佐藤昭夫', 'さとうあきお', 1002, NULL, '2001-04-01', 500000, 2000000, 2);

INSERT INTO employees VALUES (1003, '山口洋子', 'やまぐちようこ', 1002, NULL, '2001-10-01', 500000, 2000000, 3);

INSERT INTO employees VALUES (1004, '田中浩介', 'たなかこうすけ', 1002, NULL, '2001-10-01', 500000, 2000000, 4);

INSERT INTO employees VALUES (1005, '加藤昭彦', 'かとうあきひこ', 1002, NULL, '2001-10-01', 500000, 2000000, 5);

INSERT INTO employees VALUES (1006, '佐々木明子', 'ささきあきこ', 1001, NULL, '2001-04-01', 800000, 5000000, 1);

INSERT INTO employees VALUES (1007, '菊池浩二', 'きくちこうじ', 1001, NULL, '2001-04-01', 800000, 5000000, 1);

INSERT INTO employees VALUES (1008, '中山大輔', 'なかやまだいすけ', 1003, 1001, '2003-04-01', 400000, 1500000, 1);

INSERT INTO employees VALUES (1009, '星野健一', 'ほしのけんいち', 1005, 1002,'2005-10-01', 400000, 1500000, 2);

INSERT INTO employees VALUES (1010, '斎藤京子', 'さいとうきょうこ', 1006, 1003, '2002-12-01', 400000, 1200000, 3);

INSERT INTO employees VALUES (1011, '吉田亜希', 'よしだあき', 1007, 1004, '2007-04-01', 400000, 1000000, 4);

INSERT INTO employees VALUES (1012, '阿部伊吹', 'あべいぶき', 1008, 1005, '2010-04-01', 400000, 800000, 5);

INSERT INTO employees VALUES (1013, '米村真司', 'よねむらしんじ', 1004, 1001, '2011-04-01', 350000, 800000, 1);

INSERT INTO employees VALUES (1014, '伊藤佳奈', 'いとうかな', 1005, 1002, '2010-04-01', 300000, 800000, 2);

INSERT INTO employees VALUES (1015, '橋本淳', 'はしもとあつし', 1006, 1003, '2009-12-01', 300000, 800000, 3);

INSERT INTO employees VALUES (1016, '井上悦子', 'いのうええつこ', 1007, 1004, '2010-04-01', 200000, 800000, 4);

INSERT INTO employees VALUES (1017, '渡辺和也', 'わたなべかずや', 1008, 1005, '2012-04-01', NULL, NULL, 5);

INSERT INTO employees VALUES (1018, '塚本孝', 'つかもとたかし', 1003, 1001, '2012-04-01', NULL, NULL, 1);

INSERT INTO employees VALUES (1019, '野口圭子', 'のぐちけいこ', 1004, 1001, '2012-04-01', NULL, NULL, 1);

INSERT INTO employees VALUES (1020, '内田雄介', NULL, 1004, 1001, '2012-04-01', 200000, NULL, 1);

INSERT INTO employees VALUES (1021, '高田明', NULL, 1004, 1001, '2012-04-01', 200000, NULL, 1);

INSERT INTO employees VALUES (1022, '坂本真', NULL, 1004, 1001, '2012-04-01', 200000, NULL, 1);

SELECT * FROM employees;

CREATE TABLE grade 
	(grade			CHAR, 
	high			NUMBER(7), 
	low			NUMBER(7));

INSERT INTO grade VALUES ('A', 1000000, 800001);

INSERT INTO grade VALUES ('B', 800000, 600001);

INSERT INTO grade VALUES ('C', 600000, 400001);

INSERT INTO grade VALUES ('D', 400000, 200001);

INSERT INTO grade VALUES ('E', 200000, 0);

CREATE TABLE customers 
	(customer_id		NUMBER(4) CONSTRAINT pk_cust PRIMARY KEY, 
	cust_first_name		VARCHAR2(20), 
	cust_last_name		VARCHAR2(20), 
	cust_address		VARCHAR2(40), 
	cust_postal_code	VARCHAR2(10));

INSERT INTO customers VALUES(1001, '浩二', '田中', '東京都品川区荏原', '142-0063' );

INSERT INTO customers VALUES(1002, '二郎', '佐々木', '東京都大田区池上', '146-0082');

INSERT INTO customers VALUES(1003, '真弓', '山口', '東京都品川区小山', '142-0062');

INSERT INTO customers VALUES(1004, '美穂', '高橋', '神奈川県横浜市中区曙町', '231-0057');

INSERT INTO customers VALUES(1005, '彰', '斎藤', '神奈川県横浜市港北区大倉山', '222-0037');

INSERT INTO customers VALUES(1006, '元', '加藤', '千葉県浦安市今川', '279-0022');

INSERT INTO customers VALUES(1007, '美佳', '吉沢', '東京都世田谷区池尻', '154-0001');

INSERT INTO customers VALUES(1008, '優子', '田口', '東京都目黒区自由が丘', '152-0035');

INSERT INTO customers VALUES(1009, '健二', '佐藤', '神奈川県横浜市戸塚区吉田町', '244-0817');

INSERT INTO customers VALUES(1010, '卓', '後藤田', '千葉県習志野市秋津', '275-0025');

INSERT INTO customers VALUES(1011, '武', '藤田', '東京都板橋区相生町', '174-0044');

CREATE TABLE sales 
	(prod_id	NUMBER(4), 
	cust_id		NUMBER(4), 
	time_id		DATE, 
	promo_id	NUMBER(4), 
	quantity_sold	NUMBER(10,2), 
	CONSTRAINT sales_pk PRIMARY KEY(prod_id, cust_id, time_id));

INSERT INTO sales VALUES(1001, 1001, '2010-02-01', 1001, 2);

INSERT INTO sales VALUES(1001, 1001, '2010-05-28', 1001, 1);

INSERT INTO sales VALUES(1001, 1002, '2010-03-01', 1001, 3);

INSERT INTO sales VALUES(1001, 1002, '2010-11-15', 1001, 1);

INSERT INTO sales VALUES(1001, 1002, '2011-04-21', 1001, 10);

INSERT INTO sales VALUES(1001, 1003, '2010-11-16', 1001, 5);

INSERT INTO sales VALUES(1001, 1003, '2011-01-10', 1001, 2);

INSERT INTO sales VALUES(1002, 1001, '2010-05-28', 1010, 1);

INSERT INTO sales VALUES(1002, 1003, '2011-01-10', 1010, 1);

CREATE TABLE products 
	(prod_id	NUMBER(4), 
	prod_name	VARCHAR2(50), 
	prod_category	VARCHAR2(50));

INSERT INTO products VALUES(1001, 'LEDライト', '懐中電灯');

INSERT INTO products VALUES(1002, 'Light_LED_ハンディライト(6球)', '懐中電灯');

INSERT INTO products VALUES(1003, 'HighPower_LED_ハンディライト2', '懐中電灯');

INSERT INTO products VALUES(1004, 'LED_サイクルライト', 'サイクルライト');

INSERT INTO products VALUES(1005, '(Wide)LEDシーリングライト', 'シーリング');

INSERT INTO products VALUES(1006, 'Silver LED_ライト', '懐中電灯');

INSERT INTO products VALUES(1007, 'BEST HITS_60''s', 'CD');

INSERT INTO products VALUES(1008, 'BEST HITS_70''s', 'CD');

INSERT INTO products VALUES(1009, 'BEST HITS_70''s DANCE', 'CD');

INSERT INTO products VALUES(1010, 'BEST HITS_80''s', 'CD');

INSERT INTO products VALUES(1011, 'BEST HITS_80''s DANCE', 'CD');

INSERT INTO products VALUES(1012, 'Lantern', 'ランタン');

INSERT INTO products VALUES(1013, 'led light', '懐中電灯');

INSERT INTO products VALUES(1014, 'cyclelight', 'サイクルライト');

INSERT INTO products VALUES(1015, 'ledランタン', 'ランタン');

INSERT INTO products VALUES(1016, 'Watch1', '時計');

INSERT INTO products VALUES(1017, 'watch2', '時計');

INSERT INTO products VALUES(1018, 'watch3', '時計');

CREATE TABLE orders 
       (order_id	NUMBER(4) CONSTRAINT pk_order PRIMARY KEY, 
	order_date	DATE, 
	order_mode	VARCHAR2(8), 
	cust_id		NUMBER(4) CONSTRAINT fk_custid REFERENCES customers(customer_id), 
	order_status	NUMBER(2), 
	order_total	NUMBER(8,2), 
	prom_id		NUMBER(4));

INSERT INTO orders VALUES(1001, '2010-03-25', NULL, 1001, NULL, 1, NULL);

INSERT INTO orders VALUES(1002, '2010-05-20', NULL, 1001, NULL, 3, NULL);

INSERT INTO orders VALUES(1003, '2010-09-08', NULL, 1001, NULL, 9, NULL);

INSERT INTO orders VALUES(1004, '2010-11-13', NULL, 1001, NULL, 2, NULL);

INSERT INTO orders VALUES(1005, '2011-02-11', NULL, 1001, NULL, 3, NULL);

INSERT INTO orders VALUES(1006, '2010-02-20', NULL, 1002, NULL, 3, NULL);

INSERT INTO orders VALUES(1007, '2010-04-30', NULL, 1002, NULL, 1, NULL);

INSERT INTO orders VALUES(1008, '2010-06-04', NULL, 1002, NULL, 1, NULL);

INSERT INTO orders VALUES(1009, '2010-10-17', NULL, 1002, NULL, 3, NULL);

INSERT INTO orders VALUES(1010, '2011-01-24', NULL, 1002, NULL, 2, NULL);

INSERT INTO orders VALUES(1011, '2011-04-01', NULL, 1002, NULL, 3, NULL);

INSERT INTO orders VALUES(1012, '2010-09-25', NULL, 1003, NULL, 1, NULL);

INSERT INTO orders VALUES(1013, '2010-12-25', NULL, 1003, NULL, 10, NULL);

INSERT INTO orders VALUES(1014, '2011-02-25', NULL, 1003, NULL, 1, NULL);

INSERT INTO orders VALUES(1015, '2011-06-25', NULL, 1003, NULL, 3, NULL);

INSERT INTO orders VALUES(1016, '2010-07-08', NULL, 1004, NULL, 1, NULL);

INSERT INTO orders VALUES(1017, '2010-11-28', NULL, 1004, NULL, 2, NULL);

INSERT INTO orders VALUES(1018, '2011-03-15', NULL, 1004, NULL, 1, NULL);

INSERT INTO orders VALUES(1019, '2011-05-08', NULL, 1004, NULL, 1, NULL);

INSERT INTO orders VALUES(1020, '2011-08-13', NULL, 1004, NULL, 5, NULL);

INSERT INTO orders VALUES(1021, '2010-09-08', NULL, 1005, NULL, 1, NULL);

INSERT INTO orders VALUES(1022, '2010-12-31', NULL, 1005, NULL, 1, NULL);

INSERT INTO orders VALUES(1023, '2011-02-26', NULL, 1005, NULL, 3, NULL);

INSERT INTO orders VALUES(1024, '2011-03-31', NULL, 1005, NULL, 6, NULL);

INSERT INTO orders VALUES(1025, '2011-07-08', NULL, 1005, NULL, 1, NULL);

CREATE TABLE order_items 
	(order_id	NUMBER(4), 
	order_item_id	NUMBER(4), 
	prod_id		NUMBER(4), 
	unit_price	NUMBER(8,2), 
	quantity	NUMBER(8));

CREATE TABLE promotions 
	(promo_id	NUMBER(4), 
	promo_name	VARCHAR2(30), 
	promo_category	VARCHAR2(20), 
	promo_coat	NUMBER(8,2), 
	promo_begin_date	DATE, 
	promo_end_date	DATE);

INSERT INTO promotions VALUES(1001, 'プロモーション1', '', NULL, '2010-05-10', '2010-05-10');

INSERT INTO promotions VALUES(1002, 'プロモーション2', '', NULL, '2011-08-01', '2012-01-01');

INSERT INTO promotions VALUES(1003, 'プロモーション3', '', NULL, '2012-02-22', NULL);

INSERT INTO promotions VALUES(1004, 'プロモーション4', '', NULL, '2011-12-24', '2012-12-31');

INSERT INTO promotions VALUES(1005, 'プロモーション5', '', NULL, '2010-10-01', '2010-12-31');

CREATE TABLE jobs 
       (job_id		NUMBER(4), 
	job_name	VARCHAR2(40));

INSERT INTO jobs VALUES(1001, '取締役');

INSERT INTO jobs VALUES(1002, '管理職');

INSERT INTO jobs VALUES(1003, '人事');

INSERT INTO jobs VALUES(1004, '広報');

INSERT INTO jobs VALUES(1005, '技術営業');

INSERT INTO jobs VALUES(1006, 'システムエンジニア');

INSERT INTO jobs VALUES(1007, 'マーケティング');

INSERT INTO jobs VALUES(1008, 'テストエンジニア');

INSERT INTO jobs VALUES(1009, '生産管理');

INSERT INTO jobs VALUES(1010, '基礎研究');

CREATE TABLE prod 
	(prodid		NUMBER(2) PRIMARY KEY, 
	name		VARCHAR2(20), 
	category	NUMBER(2), 
	startdate	DATE, 
	enddate		DATE);

CREATE TABLE oldprod 
	(prodid		NUMBER(2) PRIMARY KEY, 
	name		VARCHAR2(20), 
	category	NUMBER(2), 
	startdate	DATE, 
	enddate		DATE);

CREATE TABLE prod2 
	(prodid		NUMBER(2) PRIMARY KEY, 
	name		VARCHAR2(20), 
	category	NUMBER(2), 
	startdate	DATE, 
	enddate		DATE);

CREATE TABLE prod3 
	(prodid		NUMBER(2) PRIMARY KEY, 
	name		VARCHAR2(20), 
	category	NUMBER(2), 
	startdate	DATE, 
	enddate		DATE);

INSERT INTO prod VALUES (1, 'Mozart', 10, '2010-01-30', NULL);

INSERT INTO prod VALUES (2, 'Jawz', 20, '2002-08-01', NULL);

INSERT INTO prod VALUES (3, 'DragonBall', 30, '2003-05-17', NULL);

INSERT INTO prod VALUES (4, 'ELLE', 40, '2007-11-25', NULL);

INSERT INTO prod VALUES (5, 'Mario', 50, '2005-09-08', NULL);

INSERT INTO prod VALUES (6, NULL, NULL, NULL, NULL);

INSERT INTO oldprod VALUES (1, 'Bach', 10, '2001-02-14', '2010-05-31');

INSERT INTO oldprod VALUES (2, 'Vogue', 40, '2005-12-08', '2012-03-31');

INSERT INTO oldprod VALUES (3, 'iPod', 60, '2001-01-15', '2008-10-26');

INSERT INTO oldprod VALUES (4, NULL, NULL, NULL, NULL);

INSERT INTO prod3 VALUES (1, 'Mozart', 10, '2010-01-30', NULL);

INSERT INTO prod3 VALUES (2, 'Jawz', 20, '2002-08-01', NULL);

INSERT INTO prod3 VALUES (3, 'DragonBall', 30, '2003-05-17', NULL);

INSERT INTO prod3 VALUES (4, 'ELLE', 40, '2007-11-25', NULL);

INSERT INTO prod3 VALUES (5, 'Mario', 50, '2005-09-08', NULL);

INSERT INTO prod3 VALUES (6, NULL, NULL, NULL, NULL);

CREATE TABLE category 
	(category	NUMBER(2), 
	name		VARCHAR2(20));

INSERT INTO category VALUES(10, 'music');

INSERT INTO category VALUES(20, 'movie');

INSERT INTO category VALUES(30, 'comic');

INSERT INTO category VALUES(40, 'magazine');

INSERT INTO category VALUES(50, 'game');

INSERT INTO category VALUES(60, 'stationery');

CREATE TABLE dummy 
	(column1	NUMBER(2), 
	column2		VARCHAR2(10));

INSERT INTO dummy VALUES (1, 'dummydata1');

INSERT INTO dummy VALUES (2, 'dummydata2');

INSERT INTO dummy VALUES (3, 'dummydata3');

INSERT INTO dummy VALUES (4, 'dummydata4');

INSERT INTO dummy VALUES (5, 'dummydata5');

CREATE TABLE salary 
	(sal		NUMBER(8));

INSERT INTO salary VALUES (100000);

INSERT INTO salary VALUES (200000);

INSERT INTO salary VALUES (300000);

INSERT INTO salary VALUES (NULL);

CREATE TABLE emp 
	(id NUMBER(2) PRIMARY KEY, 
	name VARCHAR2(10), 
	birth DATE, 
	salary NUMBER(8), 
	note LONG);

CREATE TABLE emp2 
	(salary		NUMBER(8));

INSERT INTO emp2 VALUES (100000);

INSERT INTO emp2 VALUES (NULL);

INSERT INTO emp2 VALUES (500000);

CREATE TABLE emp7 
	(employee_id		NUMBER(4), 
	employee_name		VARCHAR2(12), 
	hiredate		DATE, 
	salary			NUMBER(7), 
	department_id		NUMBER(2));

CREATE TABLE new_products 
	(prod_id		NUMBER(4) CONSTRAINT pk_prodid PRIMARY KEY, 
	prod_name		VARCHAR2(50), 
	prod_category		VARCHAR2(50), 
	prod_status		VARCHAR2(20),	 
	list_price		NUMBER(8,2));

INSERT INTO new_products VALUES(2001, '鉛筆', '筆記具', '販売中', 60);

INSERT INTO new_products VALUES(2002, 'ボールペン', '筆記具', '販売中', 110);

INSERT INTO new_products VALUES(2003, 'シャープペンシル', '筆記具', '販売中', 120);

INSERT INTO new_products VALUES(2004, '蛍光ペン', '筆記具', '生産中止', 160);

INSERT INTO new_products VALUES(2005, '油性マジック', '筆記具', '販売中', 200);

INSERT INTO new_products VALUES(2006, '水性マジック', '筆記具', '生産中止', 200);

INSERT INTO new_products VALUES(2007, '大学ノートA4', 'ノート', '販売中', 200);

INSERT INTO new_products VALUES(2008, '大学ノートA5', 'ノート', '販売中', 150);

INSERT INTO new_products VALUES(2009, '大学ノートB5', 'ノート', '販売中', 180);

INSERT INTO new_products VALUES(2010, 'スティックのり', '接着用品', '販売中', 180);

INSERT INTO new_products VALUES(2011, 'セロハンテープ', '接着用品', '販売中', 240);

INSERT INTO new_products VALUES(2012, 'ガムテープ', '接着用品', '生産中止', 300);

CREATE TABLE payments 
	(payment_id	NUMBER(8) CONSTRAINT pk_pay PRIMARY KEY, 
	 cust_id		NUMBER(4) CONSTRAINT fk_pay REFERENCES customers(customer_id), 
	 payment_date	TIMESTAMP, 
	 payment_amt	NUMBER(8,2));

INSERT INTO payments VALUES (1, 1007, '13-04-10 11:27:49.330256', 2700);

INSERT INTO payments VALUES (2, 1001, '13-05-02 21:45:01.915344', 15000);

INSERT INTO payments VALUES (3, 1003, '13-08-24 10:13:26.668197', 45500);

INSERT INTO payments VALUES (4, 1002, '13-10-09 07:55:08.912340', NULL);

INSERT INTO payments VALUES (5, 1010, '13-12-19 15:42:21.700564', 17600);

INSERT INTO payments VALUES (6, 1001, '14-01-16 18:36:48.009894', NULL);

INSERT INTO payments VALUES (7, 1009, '14-01-29 01:05:52.530112', 21000);

INSERT INTO payments VALUES (8, 1008, '14-03-08 12:16:41.972064', 5600);

INSERT INTO payments VALUES (9, 1004, '14-05-22 20:45:09.446397', 33400);

INSERT INTO payments VALUES (10, 1011, '14-06-04 19:31:23.892655', NULL);

INSERT INTO payments VALUES (11, 1006, '14-07-04 14:59:37.046644', NULL);

CREATE TABLE sales3 
	(prod_id		NUMBER(4), 
	cust_id			NUMBER(4) CONSTRAINT fk_cust REFERENCES customers(customer_id), 
	time_id			DATE, 
	promo_id		NUMBER(4), 
	quantity_sold	NUMBER(10,2), 
	CONSTRAINT pk_sales3 PRIMARY KEY(prod_id, cust_id, time_id));

INSERT INTO sales3 VALUES(1001, 1009, '2010-05-10', 1001, 25);

INSERT INTO sales3 VALUES(1001, 1002, '2010-05-28', 1001, 7);

INSERT INTO sales3 VALUES(1003, 1001, '2010-08-25', NULL, 13);

INSERT INTO sales3 VALUES(1002, 1011, '2010-11-05', 1005, 21);

INSERT INTO sales3 VALUES(1006, 1007, '2011-03-21', NULL, 4);

INSERT INTO sales3 VALUES(1003, 1004, '2011-10-30', 1002, 34);

INSERT INTO sales3 VALUES(1004, 1002, '2011-12-31', 1002, 15);

INSERT INTO sales3 VALUES(1002, 1003, '2012-04-01', 1003, 9);

INSERT INTO sales3 VALUES(1018, 1007, '2012-07-10', 1004, 16);

INSERT INTO sales3 VALUES(1015, 1008, '2013-01-15', NULL, 10);

