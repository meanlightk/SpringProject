
CREATE TABLE member(
	name varchar(100) NOT NULL,
	id varchar(100) PRIMARY KEY,
	pwd varchar(300) NOT NULL,
	pnum varchar(100) NOT NULL,
	email varchar(100) NOT NULL,
	grade int NOT null
);

CREATE TABLE goods(
	pno int PRIMARY KEY,
	category varchar(100) NOT NULL,
	pname varchar(100) NOT NULL,
	price int NOT NULL,
	skintype varchar(100) NOT NULL
);

CREATE TABLE goodsImage(
	pno int NOT null,
	imagepath varchar(150) NOT null
);

ALTER TABLE goodsImage ADD CONSTRAINT fk_goods FOREIGN KEY (pno) REFERENCES goods(pno); 

CREATE TABLE qna(
	id varchar(100) NOT NULL,
	title varchar(200) NOT NULL,
	content varchar(4000) NOT NULL,
	regidate date DEFAULT current_timestamp,
	updatedate date DEFAULT current_timestamp
);


CREATE TABLE product_review(
	id varchar(100) NOT NULL,
	pno int NOT NULL,
	title varchar(200) NOT NULL,
	content varchar(4000) NOT NULL,
	score int NOT NULL,
	regidate date DEFAULT current_timestamp,
	updatedate date DEFAULT current_timestamp
);

COMMIT;