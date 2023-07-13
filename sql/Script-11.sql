-- !! 결제 테이블 필요 !! --

CREATE TABLE member(
	name varchar(100) NOT NULL,
	id varchar(100) PRIMARY KEY,
	pwd varchar(300) NOT NULL,
	pnum varchar(100) NOT NULL,
	email varchar(100) NOT NULL,
	grade int NOT NULL comment '1:관리자 2~4:일반회원 2:새싹회원, 3:실버회원, 4:골드회원',
	regidate datetime DEFAULT current_timestamp,
	updatedate datetime DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
	status enum ('1', '2', '3') NOT NULL comment '1:정상 2:휴면 3:잠금 4:탈퇴'
);

CREATE TABLE goods (
    gno INT AUTO_INCREMENT PRIMARY KEY,
    category VARCHAR(100) NOT NULL,
    pname VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    skintype VARCHAR(100) NOT NULL,
    regidate DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    stock INT NOT NULL,
    status ENUM ('1', '2', '3') NOT NULL COMMENT '1:판매중 2:재입고중 3:품절'
);

CREATE TABLE goodsImage(
	ino int AUTO_INCREMENT PRIMARY KEY,
	gno int NOT NULL,
	imagepath varchar(150) NOT NULL
);

ALTER TABLE goodsImage ADD CONSTRAINT fk_goods FOREIGN KEY (pno) REFERENCES goods(pno); 

CREATE TABLE qna(
	qno int AUTO_INCREMENT PRIMARY KEY,
	id varchar(100) NOT NULL,
	title varchar(200) NOT NULL,
	content varchar(4000) NOT NULL,
	regidate datetime DEFAULT current_timestamp,
	updatedate datetime DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
	status enum('1', '2') NOT NULL comment '1:답변대기중 2:답변완료'
);

-- table qna의 컬럼 regidate 초기값 변경을 방지하는 트리거
/*DELIMITER //
CREATE TRIGGER prevent_qregidate_update
BEFORE UPDATE ON qna
FOR EACH ROW
BEGIN
    IF NEW.regidate <> OLD.regidate THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'regidate의 초기값을 변경할 수 없습니다.';
    END IF;
END; //
DELIMITER ;*/

CREATE TABLE review(
	rno int AUTO_INCREMENT PRIMARY KEY,
	id varchar(100) NOT NULL comment 'member id 컬럼 fk',
	pno int NOT NULL,
	title varchar(200) NOT NULL,
	content varchar(4000) NOT NULL,
	score int NOT NULL,
	regidate datetime DEFAULT current_timestamp,
	updatedate datetime DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE orderlist(
	ono int AUTO_INCREMENT PRIMARY KEY,
	id varchar(100) NOT NULL,
	totprice int NOT NULL,
	regidate date DEFAULT current_timestamp,
	dstatus enum('1', '2', '3', '4') NOT NULL comment '1:배송준비중 2:출고완료 3:배송중 4:배송완료'
);

CREATE TABLE gclaim(
	clno int AUTO_INCREMENT PRIMARY KEY,
	gno int NOT NULL,
	id varchar(100),
	content varchar(1000),
	regidate datetime DEFAULT current_timestamp,
	updatedate datetime DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
	status enum('1', '2', '3', '4', '5') NOT NULL comment '1:단순변심 2:제품하자 3:사이즈문제 4:오배송 5:기타'
);

CREATE TABLE answer(
	ano int AUTO_INCREMENT PRIMARY KEY,
	clno int NOT NULL comment 'gclaim clno 컬럼 fk',
	title varchar(200) NOT NULL,
	content varchar(1000) NOT NULL,
	regidate datetime DEFAULT current_timestamp,
	updatedate datetime DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
	status enum ('1', '2', '3') NOT NULL comment '1:처리대기 2:처리중 3:처리완료'
);



-- table product_review의 컬럼 regidate 초기값 변경을 방지하는 트리거
/*DELIMITER //
CREATE TRIGGER prevent_pregidate_update
BEFORE UPDATE ON product_review
FOR EACH ROW
BEGIN
    IF NEW.regidate <> OLD.regidate THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'regidate의 초기값을 변경할 수 없습니다.';
    END IF;
END; //
DELIMITER ;*/

CREATE TABLE cart (
	cno int AUTO_INCREMENT PRIMARY KEY,
	memid varchar(100) comment 'member 컬럼 fk',
	gno int,
	ordernum int DEFAULT NULL,
	regidate datetime DEFAULT current_timestamp
);

-- table member 샘플
-- DELETE FROM shop.member;
-- INSERT INTO shop.member(name, id, pwd, pnum, email, grade) VALUES('admin', 'admin', '12345', '01011111111', 'admin@test.com', 2);

COMMIT;