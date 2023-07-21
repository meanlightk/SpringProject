-- !! 결제 테이블 필요 !! --
CREATE DATABASE IF NOT EXISTS `shop`;
USE `shop`;

CREATE TABLE member(
	name varchar(100) NOT NULL,
	mem_id varchar(100) PRIMARY KEY,
	pwd varchar(300) NOT NULL,
	pnum varchar(100) NOT NULL,
	email varchar(100) NOT NULL,
	userAddr varchar(300) NOT NULL,
	userDaddr varchar(200) NOT NULL,
	grade int NOT NULL DEFAULT 2 comment '1:관리자 2~4:일반회원 2:새싹회원, 3:실버회원, 4:골드회원',
	regidate datetime DEFAULT current_timestamp,
	updatedate datetime DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
	status enum ('1', '2', '3', '4') DEFAULT '1' NOT NULL comment '1:정상 2:휴면 3:잠금 4:탈퇴'
);

CREATE TABLE authority(
	auth_id int AUTO_INCREMENT PRIMARY KEY,
	mem_id varchar(100) NOT NULL,
	auth varchar(100) NOT NULL COMMENT '이용자:ROLE_MEMBER / 매니저:ROLE_MANAGER / 관리자:ROLE_ADMIN',
	CONSTRAINT `fk_mem_id` -- 외래 키 제약 조건 이름 (임의로 지정 가능)
	FOREIGN KEY (`mem_id`)
	REFERENCES `member` (`mem_id`) -- 컬럼을 참조합니다.
	ON DELETE CASCADE -- 부모 레코드가 삭제될 경우 종속된 자식 레코드도 함께 삭제됩니다.
	ON UPDATE CASCADE -- 부모 레코드의 기본 키가 업데이트될 경우 자식 레코드의 외래 키도 함께 업데이트됩니다.
);

CREATE TABLE goods (
    goods_no INT AUTO_INCREMENT PRIMARY KEY,
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

-- ALTER TABLE goodsImage ADD CONSTRAINT fk_goods FOREIGN KEY (pno) REFERENCES goods(pno); 

CREATE TABLE IF NOT EXISTS `qna` (
  `qna_no` int NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1:답변대기중 2:답변완료',
  PRIMARY KEY (`qna_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
	regidate datetime DEFAULT current_timestamp,
	dstatus enum('1', '2', '3', '4') NOT NULL comment '1:배송준비중 2:출고완료 3:배송중 4:배송완료'
);

CREATE TABLE IF NOT EXISTS `gclaim` (
  `gclaim_no` int NOT NULL AUTO_INCREMENT,
  `goods_no` int NOT NULL,
  `mem_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('1','2','3','4','5') NOT NULL COMMENT '1:단순변심 2:제품하자 3:사이즈문제 4:오배송 5:기타',
  PRIMARY KEY (`gclaim_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='클레임';

CREATE TABLE IF NOT EXISTS `answer_claim` (
  `answer_no` int NOT NULL AUTO_INCREMENT,
  `gclaim_no` int NOT NULL COMMENT 'gclaim gclaim_no 컬럼 fk',
  `title` varchar(200) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1:처리대기 2:처리중 3:처리완료',
  PRIMARY KEY (`answer_no`) USING BTREE,
  CONSTRAINT `fk_answer_claim_gclaim` -- 외래 키 제약 조건 이름 (임의로 지정 가능)
    FOREIGN KEY (`gclaim_no`) -- answer_claim 테이블의 gclaim_no 컬럼이
    REFERENCES `gclaim` (`gclaim_no`) -- gclaim 테이블의 clno 컬럼을 참조합니다.
    ON DELETE CASCADE -- 부모 레코드가 삭제될 경우 종속된 자식 레코드도 함께 삭제됩니다.
    ON UPDATE CASCADE -- 부모 레코드의 기본 키가 업데이트될 경우 자식 레코드의 외래 키도 함께 업데이트됩니다.
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='관리자 클레임 답변';


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

CREATE TABLE coupon (
	id int AUTO_INCREMENT PRIMARY KEY,
	cname varchar(80) NOT NULL,
	code varchar(50) UNIQUE NOT NULL,
	ctype int NOT NULL,
	value int NOT NULL,
	cond varchar(50) comment '쿠폰 적용 조건',
	regidate datetime DEFAULT current_timestamp,
	enddate datetime NOT NULL,
	status int NOT NULL DEFAULT 1 comment '1:쿠폰 이용 가능 / 2:쿠폰 발급 / 3:쿠폰 이용 정지',
	CONSTRAINT check_date_range CHECK (regidate <= enddate)
);

-- table member 샘플
-- DELETE FROM shop.member;
-- INSERT INTO shop.member(name, id, pwd, pnum, email, grade) VALUES('admin', 'admin', '12345', '01011111111', 'admin@test.com', 2);


-- sample
-- INSERT INTO `gclaim` (`goods_no`, `mem_id`, `content`, `status`)
-- VALUES
-- (101, 'user123', '상품에 하자가 있어 클레임을 제기합니다.', '2'),
-- (102, 'user456', '배송된 상품이 다른 제품입니다.', '4'),
-- (103, 'user789', '사이즈가 맞지 않아 클레임을 요청합니다.', '3');
-- 
-- INSERT INTO `answer_claim` (`gclaim_no`, `title`, `content`, `status`)
-- VALUES
-- (1, '클레임 처리 대기 중', '담당자가 클레임을 확인 중입니다.', '1'),
-- (2, '클레임 처리 중', '상품 교환 처리 중입니다.', '2'),
-- (1, '클레임 처리 완료', '클레임이 성공적으로 처리되었습니다.', '3'),
-- (3, '클레임 처리 중', '상품 사이즈 문제로 교환 진행 중입니다.', '2');


/* 계층형 쿼리문 with pagination */
/*
SELECT * FROM(
	WITH RECURSIVE ClaimHierarchy AS (
	  SELECT
	    gclaim_no,
	    goods_no,
	    mem_id,
	    content,
	    regidate,
	    updatedate,
	    status,
	    1 AS level
	  FROM gclaim
	  
	  UNION ALL
	  
	  SELECT
	    ac.gclaim_no,
	    gc.goods_no,
	    gc.mem_id,
	    ac.content,
	    ac.regidate,
	    ac.updatedate,
	    ac.status,
	    ch.level + 1 AS level
	  FROM answer_claim ac
	  JOIN ClaimHierarchy ch ON ac.gclaim_no = ch.gclaim_no
	  JOIN gclaim gc ON ac.gclaim_no = gc.gclaim_no
	  WHERE LEVEL = 1
	)
	SELECT
	  LEVEL,
	  gclaim_no,
	  goods_no,
	  mem_id,
	  CONCAT(SPACE(4*(LEVEL-1)), content) AS content,
	  regidate,
	  updatedate,
	  status,
	  ROW_NUMBER() over(ORDER BY regidate desc) AS rownum
	FROM ClaimHierarchy
	ORDER BY gclaim_no, LEVEL
)b
WHERE rownum BETWEEN (1-1)*100+(1-1)*10+1 AND (1-1)*100+1*10;
*/



COMMIT;