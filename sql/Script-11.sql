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

-- table qna의 컬럼 regidate 초기값 변경을 방지하는 트리거
DELIMITER //
CREATE TRIGGER prevent_qregidate_update
BEFORE UPDATE ON qna
FOR EACH ROW
BEGIN
    IF NEW.regidate <> OLD.regidate THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'regidate의 초기값을 변경할 수 없습니다.';
    END IF;
END; //
DELIMITER ;

CREATE TABLE product_review(
	id varchar(100) NOT NULL,
	pno int NOT NULL,
	title varchar(200) NOT NULL,
	content varchar(4000) NOT NULL,
	score int NOT NULL,
	regidate date DEFAULT current_timestamp,
	updatedate date DEFAULT current_timestamp
);

--table product_review의 컬럼 regidate 초기값 변경을 방지하는 트리거
DELIMITER //
CREATE TRIGGER prevent_pregidate_update
BEFORE UPDATE ON product_review
FOR EACH ROW
BEGIN
    IF NEW.regidate <> OLD.regidate THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'regidate의 초기값을 변경할 수 없습니다.';
    END IF;
END; //
DELIMITER ;


-- table member 샘플
-- DELETE FROM shop.member;
INSERT INTO shop.member(name, id, pwd, pnum, email, grade) VALUES('admin', 'admin', '12345', '01011111111', 'admin@test.com', 2);

COMMIT;