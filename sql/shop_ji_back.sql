-- --------------------------------------------------------
-- 호스트:                          3.39.15.64
-- 서버 버전:                        8.0.33-0ubuntu0.22.04.2 - (Ubuntu)
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- shop 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shop`;

-- 테이블 shop.answer_claim 구조 내보내기
CREATE TABLE IF NOT EXISTS `answer_claim` (
  `answer_no` int NOT NULL AUTO_INCREMENT,
  `gclaim_no` int NOT NULL COMMENT 'gclaim clno 컬럼 fk',
  `title` varchar(200) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('1','2','3') NOT NULL COMMENT '1:처리대기 2:처리중 3:처리완료',
  PRIMARY KEY (`answer_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='관리자 클레임 답변';

-- 테이블 데이터 shop.answer_claim:~0 rows (대략적) 내보내기
DELETE FROM `answer_claim`;
/*!40000 ALTER TABLE `answer_claim` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_claim` ENABLE KEYS */;

-- 테이블 shop.answer_qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `answer_qna` (
  `answer_no` int NOT NULL AUTO_INCREMENT,
  `qna_no` int NOT NULL COMMENT 'gclaim clno 컬럼 fk',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1:처리대기 2:처리중 3:처리완료',
  PRIMARY KEY (`answer_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='관리자qna 답변';

-- 테이블 데이터 shop.answer_qna:~0 rows (대략적) 내보내기
DELETE FROM `answer_qna`;
/*!40000 ALTER TABLE `answer_qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_qna` ENABLE KEYS */;

-- 테이블 shop.cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_no` int NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'member 컬럼 fk',
  `goods_no` int DEFAULT NULL,
  `ordernum` int DEFAULT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='장바구니\r\n';

-- 테이블 데이터 shop.cart:~0 rows (대략적) 내보내기
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- 테이블 shop.gclaim 구조 내보내기
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

-- 테이블 데이터 shop.gclaim:~0 rows (대략적) 내보내기
DELETE FROM `gclaim`;
/*!40000 ALTER TABLE `gclaim` DISABLE KEYS */;
/*!40000 ALTER TABLE `gclaim` ENABLE KEYS */;

-- 테이블 shop.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `goods_no` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `skintype` varchar(100) NOT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stock` int NOT NULL,
  `status` enum('1','2','3') NOT NULL COMMENT '1:판매중 2:재입고중 3:품절',
  PRIMARY KEY (`goods_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='상품\r\n';

-- 테이블 데이터 shop.goods:~0 rows (대략적) 내보내기
DELETE FROM `goods`;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 테이블 shop.goodsImage 구조 내보내기
CREATE TABLE IF NOT EXISTS `goodsImage` (
  `image_no` int NOT NULL AUTO_INCREMENT,
  `goods_no` int NOT NULL,
  `imagepath` varchar(150) NOT NULL,
  PRIMARY KEY (`image_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='상품 이미지';

-- 테이블 데이터 shop.goodsImage:~0 rows (대략적) 내보내기
DELETE FROM `goodsImage`;
/*!40000 ALTER TABLE `goodsImage` DISABLE KEYS */;
/*!40000 ALTER TABLE `goodsImage` ENABLE KEYS */;

-- 테이블 shop.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `mem_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) NOT NULL,
  `pwd` varchar(300) NOT NULL,
  `pnum` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `grade` int NOT NULL DEFAULT '2' COMMENT '1:관리자 2~4:일반회원 2:새싹회원, 3:실버회원, 4:골드회원',
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('1','2','3','4') NOT NULL DEFAULT '1' COMMENT '1:정상 2:휴면 3:잠금 4:탈퇴',
  PRIMARY KEY (`mem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.member:~0 rows (대략적) 내보내기
DELETE FROM `member`;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 shop.orderlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderlist` (
  `orderlist_no` int NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `totprice` int NOT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `dstatus` enum('1','2','3','4') NOT NULL COMMENT '1:배송준비중 2:출고완료 3:배송중 4:배송완료',
  PRIMARY KEY (`orderlist_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.orderlist:~0 rows (대략적) 내보내기
DELETE FROM `orderlist`;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;

-- 테이블 shop.qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `qna` (
  `qna_no` int NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('1','2') NOT NULL COMMENT '1:답변대기중 2:답변완료',
  PRIMARY KEY (`qna_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.qna:~0 rows (대략적) 내보내기
DELETE FROM `qna`;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;

-- 테이블 shop.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `review_no` int NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'member id 컬럼 fk',
  `goods_no` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `score` int NOT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.review:~0 rows (대략적) 내보내기
DELETE FROM `review`;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
