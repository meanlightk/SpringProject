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
  `gclaim_no` int NOT NULL COMMENT 'gclaim gclaim_no 컬럼 fk',
  `title` varchar(200) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1:처리대기 2:처리중 3:처리완료',
  PRIMARY KEY (`answer_no`) USING BTREE,
  KEY `fk_answer_claim_gclaim` (`gclaim_no`),
  CONSTRAINT `fk_answer_claim_gclaim` FOREIGN KEY (`gclaim_no`) REFERENCES `gclaim` (`gclaim_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='관리자 클레임 답변';

-- 테이블 데이터 shop.answer_claim:~4 rows (대략적) 내보내기
DELETE FROM `answer_claim`;
/*!40000 ALTER TABLE `answer_claim` DISABLE KEYS */;
INSERT INTO `answer_claim` (`answer_no`, `gclaim_no`, `title`, `content`, `regidate`, `updatedate`, `status`) VALUES
	(1, 1, '클레임 처리 대기 중', '담당자가 클레임을 확인 중입니다.', '2023-07-24 10:40:04', '2023-07-24 10:40:04', '1'),
	(2, 2, '클레임 처리 중', '상품 교환 처리 중입니다.', '2023-07-24 10:40:04', '2023-07-24 10:40:04', '2'),
	(3, 1, '클레임 처리 완료', '클레임이 성공적으로 처리되었습니다.', '2023-07-24 10:40:04', '2023-07-24 10:40:04', '3'),
	(4, 3, '클레임 처리 중', '상품 사이즈 문제로 교환 진행 중입니다.', '2023-07-24 10:40:04', '2023-07-24 10:40:04', '2'),
	(6, 9, 'asd', 'asd', '2023-07-26 07:07:53', '2023-07-26 07:07:53', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='관리자qna 답변';

-- 테이블 데이터 shop.answer_qna:~4 rows (대략적) 내보내기
DELETE FROM `answer_qna`;
/*!40000 ALTER TABLE `answer_qna` DISABLE KEYS */;
INSERT INTO `answer_qna` (`answer_no`, `qna_no`, `title`, `content`, `regidate`, `updatedate`, `status`) VALUES
	(2, 1, 'c', 'c', '2023-07-19 16:41:35', '2023-07-19 16:41:35', '1'),
	(3, 1, 'c', 'c', '2023-07-19 16:44:13', '2023-07-19 16:44:13', '1'),
	(4, 1, 'c', 'c', '2023-07-19 16:45:27', '2023-07-19 16:45:27', '1'),
	(5, 1, 'c', 'c', '2023-07-19 23:21:46', '2023-07-19 23:21:46', '1');
/*!40000 ALTER TABLE `answer_qna` ENABLE KEYS */;

-- 테이블 shop.authority 구조 내보내기
CREATE TABLE IF NOT EXISTS `authority` (
  `auth_id` int NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(100) NOT NULL,
  `auth` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '이용자:ROLE_MEMBER / 매니저:ROLE_MANAGER / 관리자:ROLE_ADMIN',
  PRIMARY KEY (`auth_id`),
  KEY `fk_mem_id` (`mem_id`),
  CONSTRAINT `fk_mem_id` FOREIGN KEY (`mem_id`) REFERENCES `member` (`mem_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.authority:~5 rows (대략적) 내보내기
DELETE FROM `authority`;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
INSERT INTO `authority` (`auth_id`, `mem_id`, `auth`) VALUES
	(1, 'test00', 'ROLE_MEMBER'),
	(2, 'test123', 'ROLE_MEMBER'),
	(3, 'admin', 'ROLE_MEMBER'),
	(4, 'admin', 'ROLE_MANAGER'),
	(5, 'admin', 'ROLE_ADMIN');
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;

-- 테이블 shop.cart 구조 내보내기
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_no` int NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'member 컬럼 fk',
  `goods_no` int DEFAULT NULL,
  `ordernum` int DEFAULT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `quantity` int DEFAULT NULL,
  `status` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '1.결제전 2. 결제완료',
  `update_date` datetime DEFAULT NULL,
  `optionName` varchar(200) DEFAULT NULL,
  `totalPrice` int DEFAULT NULL,
  `pname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cart_no`) USING BTREE,
  KEY `FK_MEM_ID2` (`mem_id`),
  KEY `FK_GOOD_NO` (`goods_no`),
  CONSTRAINT `FK_GOOD_NO` FOREIGN KEY (`goods_no`) REFERENCES `goods` (`goods_no`),
  CONSTRAINT `FK_MEM_ID2` FOREIGN KEY (`mem_id`) REFERENCES `member` (`mem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='장바구니\r\n';

-- 테이블 데이터 shop.cart:~4 rows (대략적) 내보내기
DELETE FROM `cart`;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` (`cart_no`, `mem_id`, `goods_no`, `ordernum`, `regidate`, `quantity`, `status`, `update_date`, `optionName`, `totalPrice`, `pname`) VALUES
	(1, 'admin', 56, 12, '2023-07-22 11:10:50', 16, '2', '2023-07-25 14:16:31', NULL, NULL, NULL),
	(2, 'admin', 57, 12, '2023-07-22 11:10:50', 21, '2', '2023-07-25 14:16:32', NULL, NULL, NULL),
	(3, 'test00', 58, NULL, '2023-07-26 16:06:24', 1, '1', NULL, '심마이크로 에센스(500ml) + 샘플30일\n', 56000, '[Sephora] 더 퍼스트 제너추어 심마이크로 에센스'),
	(4, 'test00', 58, NULL, '2023-07-26 16:06:24', 4, '1', NULL, '심마이크로 에센스(350ml) + 샘플10일\n', 224000, '[Sephora] 더 퍼스트 제너추어 심마이크로 에센스'),
	(5, 'test123', NULL, NULL, '2023-07-27 01:34:38', 1, '1', NULL, '심마이크로 에센스(500ml) + 샘플30일\n', 56000, NULL),
	(6, 'test123', NULL, NULL, '2023-07-27 01:35:20', 1, '1', NULL, '심마이크로 에센스(350ml) + 샘플10일\n', 56000, NULL),
	(7, 'test123', 58, NULL, '2023-07-27 01:38:12', 3, '1', NULL, '심마이크로 에센스(500ml) + 샘플30일\n', 168000, '[Sephora] 더 퍼스트 제너추어 심마이크로 에센스'),
	(8, 'test123', 58, NULL, '2023-07-27 02:28:18', 3, '1', NULL, '심마이크로 에센스(500ml) + 샘플30일\n', 168000, '[Sephora] 더 퍼스트 제너추어 심마이크로 에센스'),
	(9, 'test123', 58, NULL, '2023-07-27 02:31:21', 1, '1', NULL, '심마이크로 에센스(350ml) + 샘플10일\n', 56000, '[Sephora] 더 퍼스트 제너추어 심마이크로 에센스'),
	(10, 'test123', 58, NULL, '2023-07-27 02:31:21', 1, '1', NULL, '심마이크로 에센스(500ml) + 샘플30일\n', 56000, '[Sephora] 더 퍼스트 제너추어 심마이크로 에센스');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

-- 테이블 shop.coupon 구조 내보내기
CREATE TABLE IF NOT EXISTS `coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(80) NOT NULL,
  `code` varchar(50) NOT NULL,
  `ctype` int NOT NULL,
  `value` int NOT NULL,
  `cond` varchar(50) DEFAULT NULL COMMENT '쿠폰 적용 조건',
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `enddate` datetime NOT NULL,
  `status` int NOT NULL DEFAULT '1' COMMENT '1:쿠폰 이용 가능 / 2:쿠폰 발급 / 3:쿠폰 이용 정지',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  CONSTRAINT `check_date_range` CHECK ((`regidate` <= `enddate`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.coupon:~0 rows (대략적) 내보내기
DELETE FROM `coupon`;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='클레임';

-- 테이블 데이터 shop.gclaim:~5 rows (대략적) 내보내기
DELETE FROM `gclaim`;
/*!40000 ALTER TABLE `gclaim` DISABLE KEYS */;
INSERT INTO `gclaim` (`gclaim_no`, `goods_no`, `mem_id`, `content`, `regidate`, `updatedate`, `status`) VALUES
	(1, 49, 'user123', '상품에 하자가 있어 클레임을 제기합니다.', '2023-07-24 10:40:02', '2023-07-24 10:40:02', '2'),
	(2, 50, 'user456', '배송된 상품이 다른 제품입니다.', '2023-07-24 10:40:02', '2023-07-24 10:40:02', '4'),
	(3, 51, 'user789', '사이즈가 맞지 않아 클레임을 요청합니다.', '2023-07-24 10:40:02', '2023-07-24 10:40:02', '3'),
	(7, 47, 'test00', '갓삐ㅣㅣㅣㅣㅣㅣㅣㅣ', '2023-07-25 10:57:54', '2023-07-25 10:57:54', '4'),
	(8, 49, 'test00', '배송된 제품 파손에 의한 환불 요청', '2023-07-25 11:10:18', '2023-07-25 14:51:28', '2'),
	(9, 48, 'test00', '안녕하세요 감사해요 잘있어요 다시 만나요', '2023-07-26 06:14:59', '2023-07-26 06:17:12', '1');
/*!40000 ALTER TABLE `gclaim` ENABLE KEYS */;

-- 테이블 shop.goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `goods` (
  `goods_no` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `sellPrice` int NOT NULL,
  `skintype` varchar(100) NOT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `stock` int NOT NULL,
  `status` enum('1','2','3') NOT NULL COMMENT '1:판매중 2:재입고중 3:품절',
  `content` text,
  `discountPrice` int DEFAULT NULL,
  `originalPrice` int DEFAULT NULL,
  `UUID` varchar(100) DEFAULT NULL,
  `imagepath` varchar(200) DEFAULT NULL,
  `option_list` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`goods_no`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='상품\r\n';

-- 테이블 데이터 shop.goods:~12 rows (대략적) 내보내기
DELETE FROM `goods`;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`goods_no`, `category`, `pname`, `sellPrice`, `skintype`, `regidate`, `updatedate`, `stock`, `status`, `content`, `discountPrice`, `originalPrice`, `UUID`, `imagepath`, `option_list`) VALUES
	(47, 'skincare', '상품 test', 1, 'middle', '2023-07-20 10:14:21', '2023-07-20 10:14:21', 1, '1', '<p><img alt="" src="/upload/ef1c2d54c4e5401e9f3451705294db1f.png" style="height:248px; width:545px" /></p>\r\n', 1, 1, '7460b5b0-af5f-406f-a8a3-17ba16d15f5a', '/main/1/7460b5b0-af5f-406f-a8a3-17ba16d15f5a_a.png', NULL),
	(48, 'base', '45번 상품인지 확인', 1, 'dry', '2023-07-20 10:32:32', '2023-07-24 17:07:22', 1, '1', '<p><img alt="" src="/upload/777e0c7eb68b46c09579c2af7cba0520.png" style="height:727px; width:600px" /></p>\r\n', 1, 1, '09ce468e-d633-4a7d-bb01-dd8912b2ff80', '/main/45/09ce468e-d633-4a7d-bb01-dd8912b2ff80_a.png', NULL),
	(49, 'skincare', '49번 상품', 1, 'dry', '2023-07-20 10:55:16', '2023-07-20 10:55:16', 100, '1', '<p>49번 상품<img alt="" src="/upload/ee0378f98c164bae9214c873fa4b564b.png" style="height:248px; width:545px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>다음</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>다음<img alt="" src="/upload/db0c24bd4c9d4964a70abaa573c972d5.png" style="height:727px; width:600px" /></p>\r\n', 1, 1, 'ad4d56fb-d6ba-496b-b62f-43eb8adf7adf', '/main/48/ad4d56fb-d6ba-496b-b62f-43eb8adf7adf_spring.png', NULL),
	(50, 'skincare', '50번상품', 1, 'dry', '2023-07-20 10:58:17', '2023-07-20 10:58:17', 1, '1', '<p><img alt="" src="/upload/28715b2eb37d455695eaf4841f480911.png" style="height:727px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/upload/4b549291fcbb4ae383b688dd1a818828.jpg" style="height:189px; width:142px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 1, 1, '6ac4c6b6-6f0f-4480-bf8e-469804eb65ed', '/main/50/6ac4c6b6-6f0f-4480-bf8e-469804eb65ed_spring.png', NULL),
	(51, 'skincare', '51번상품', 1, 'dry', '2023-07-20 11:04:52', '2023-07-20 11:04:52', 12, '1', '<p><img alt="" src="/upload/f7d17c88c59947ba99e241706e0d92a1.png" style="height:727px; width:600px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/upload/d85cfecbbc8b40d68bcd6399ffdb94a5.jpg" style="height:189px; width:142px" /></p>\r\n\r\n<p><img alt="" src="/upload/81ecbef1917642ecbe82fcfacdb5ecd4.jpg" style="height:276px; width:270px" /></p>\r\n', 1, 1, 'ed759d87-e6f4-4650-bdc7-1967f17870ee', 'main51/ed759d87-e6f4-4650-bdc7-1967f17870ee_블록다이어그램.jpg', NULL),
	(52, 'skincare', '52번', 1, 'dry', '2023-07-20 11:16:49', '2023-07-20 11:16:49', 1, '1', '<p><img alt="" src="/upload/fc3f5f71b11a4b9eadcaaf6fcb6d0f5c.jpg" style="height:728px; width:1167px" /><img alt="" src="/upload/52416b08fafe4df1bcf40c09f36ba0cc.png" style="height:920px; width:920px" /></p>\r\n', 1, 1, 'e9e85982-e67b-4726-b022-3d35219dcd41', '/main/52/e9e85982-e67b-4726-b022-3d35219dcd41_imimimi.jpg', NULL),
	(53, 'skincare', '53번', 1, 'dry', '2023-07-20 11:19:21', '2023-07-20 11:19:21', 1, '1', '<p><img alt="" src="/upload/67308e70a9f24b2f8790969407fd7d56.jpg" style="height:344px; width:551px" /></p>\r\n', 1, 1, '7fc1d9c6-dfe7-47ed-b226-cc227d9f3e32', '53/7fc1d9c6-dfe7-47ed-b226-cc227d9f3e32_imimimi.jpg', NULL),
	(54, 'skincare', '54번 상품', 11, 'dry', '2023-07-21 07:20:47', '2023-07-21 07:20:47', 1, '1', '<p><img alt="" src="/upload/f596bb0a395e484584fca09baa438e82.jpg" style="height:344px; width:551px" /></p>\r\n\r\n<p>아 지겹다</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/upload/208af4b16c50456db439e50c3f96f451.jpg" style="height:276px; width:270px" /></p>\r\n', 11, 100, 'fe4aff80-2a75-45a1-a884-07ca99233e9c_', '54/fe4aff80-2a75-45a1-a884-07ca99233e9c_', NULL),
	(55, 'skincare', '55번 상품', 1, 'dry', '2023-07-21 07:22:45', '2023-07-21 07:22:45', 1, '1', '<p><img alt="" src="/upload/3a2b89d1cdc24107a2af6ff30f5a5766.png" style="height:920px; width:920px" /></p>\r\n', 1, 1, '4c5e3b83-f386-4aa8-839e-4de19e8b1b08', '55/4c5e3b83-f386-4aa8-839e-4de19e8b1b08_블록다이어그램.jpg', NULL),
	(56, 'skincare', '56번 상품 ', 1, 'dry', '2023-07-21 07:33:19', '2023-07-21 07:33:19', 1, '1', '<p><img alt="" src="/upload/d3b278ad5cfe42de9069f19d7b9e4370.png" style="height:920px; width:920px" /></p>\r\n', 1, 1, '56682825-1ce9-431f-9ef6-cf344ba54f85', '56/56682825-1ce9-431f-9ef6-cf344ba54f85_nodecap.jpg', '11\r\n냥냥냥\r\n'),
	(57, 'skincare', '57번 상품', 100, 'middle', '2023-07-22 09:28:54', '2023-07-22 09:28:54', 11, '1', '<p><img alt="" src="/upload/10e9a2efde33416980223ae4aab69613.png" style="height:390px; width:632px" /></p>\r\n\r\n<p>이미지 여러 개 올리기</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/upload/d90a771af0144d3b8d803df72e5f99e0.png" style="height:468px; width:743px" />이미지 여러개 올리기</p>\r\n\r\n<p>...</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt="" src="/upload/4c8bf740830c4d92ad203b0c0dc55c1d.png" style="height:549px; width:675px" />이미지 여러개 올리기</p>\r\n\r\n<p><img alt="" src="/upload/802c31944dda4f89962b2a693044686d.png" style="height:401px; width:415px" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 100, 100, '4232caf6-6faa-4c64-8b67-0cce8119e425', '57/4232caf6-6faa-4c64-8b67-0cce8119e425_스크린샷 2023-05-30 151731.png', '강아지\r\n고양이\r\n얼룩말\r\n승냥이\r\n늑대\r\n'),
	(58, 'skincare', '[Sephora] 더 퍼스트 제너추어 심마이크로 에센스', 63000, 'middle', '2023-07-22 11:20:56', '2023-07-22 11:20:56', 300, '1', '<p><img alt="김태희 사진1" src="/upload/355015d4c84145748d3de3bc783957c6.png" style="height:718px; width:538px" /><img alt="김태희 사진2" src="/upload/7882370d5dc34044a9b8927613a67727.png" style="height:829px; width:700px" /><img alt="태희 사진3" src="/upload/64c1d21e822c451ab1a3095c7697e452.jpg" style="height:989px; width:700px" /></p>\r\n', 56000, 10000, 'f35628f5-821d-4716-8a7a-9f179f99c653', '58/f35628f5-821d-4716-8a7a-9f179f99c653_kth1.png', '심마이크로 에센스(500ml) + 샘플30일\r\n심마이크로 에센스(350ml) + 샘플10일\r\n'),
	(59, 'skincare', '[라네즈] 립 슬리핑 마스크', 22000, 'dry,middle,oily', '2023-07-23 05:52:23', '2023-07-23 05:52:23', 100, '1', '<p><img alt="" src="/upload/46054595f9ab43728ec2a38593b70b0d.png" style="height:520px; width:495px" /><img alt="" src="/upload/f03adfdfcf1b4650b698b54e3024b148.png" style="height:718px; width:538px" /><img alt="" src="/upload/549a0ec7a0c340d5aa26fa26d7e75592.png" style="height:647px; width:546px" /><img alt="" src="/upload/78f68668d3ed4115a085dc76efdf4639.jpg" style="height:1447px; width:1024px" /></p>\r\n', 22000, 14000, 'd4755350-2f6a-45d2-b46c-ee416d920291', '59/d4755350-2f6a-45d2-b46c-ee416d920291_main1.png', '');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;

-- 테이블 shop.goodsImage 구조 내보내기
CREATE TABLE IF NOT EXISTS `goodsImage` (
  `image_no` int NOT NULL AUTO_INCREMENT,
  `goods_no` int NOT NULL,
  `imagepath` varchar(150) NOT NULL,
  `uuid` varchar(100) NOT NULL,
  `ifmain` enum('1','2','3') DEFAULT NULL,
  PRIMARY KEY (`image_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='상품 이미지';

-- 테이블 데이터 shop.goodsImage:~0 rows (대략적) 내보내기
DELETE FROM `goodsImage`;
/*!40000 ALTER TABLE `goodsImage` DISABLE KEYS */;
INSERT INTO `goodsImage` (`image_no`, `goods_no`, `imagepath`, `uuid`, `ifmain`) VALUES
	(60, 58, '58/36a5a453-ab47-49a2-967a-6fd8053b550c_product1.png', '36a5a453-ab47-49a2-967a-6fd8053b550c', NULL),
	(61, 58, '58/215661eb-b070-4be7-a688-d58c2d766a3c_product2.png', '215661eb-b070-4be7-a688-d58c2d766a3c', NULL),
	(62, 58, '58/545b6ed5-3fb6-4f3e-8e93-07a3dd17ca39_product3.png', '545b6ed5-3fb6-4f3e-8e93-07a3dd17ca39', NULL),
	(63, 58, '58/b108f5f0-fccc-4181-9c96-4a31cff1b646_product4.png', 'b108f5f0-fccc-4181-9c96-4a31cff1b646', NULL),
	(64, 58, '58/95f786db-c7c7-4793-a432-dfc68510035a_product5.png', '95f786db-c7c7-4793-a432-dfc68510035a', NULL),
	(65, 58, '58/8b0198ec-adc3-4041-abed-597d1ec4499c_product6.png', '8b0198ec-adc3-4041-abed-597d1ec4499c', NULL),
	(66, 58, '58/825d2270-5b89-4b9e-856e-0615a8cba49a_product7.png', '825d2270-5b89-4b9e-856e-0615a8cba49a', NULL);
/*!40000 ALTER TABLE `goodsImage` ENABLE KEYS */;

-- 테이블 shop.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `mem_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) NOT NULL,
  `pwd` varchar(300) NOT NULL,
  `pnum` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `userAddr` varchar(300) NOT NULL,
  `userDaddr` varchar(200) NOT NULL,
  `grade` int NOT NULL DEFAULT '2' COMMENT '1:관리자 2~4:일반회원 2:새싹회원, 3:실버회원, 4:골드회원',
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('1','2','3','4') NOT NULL DEFAULT '1' COMMENT '1:정상 2:휴면 3:잠금 4:탈퇴',
  PRIMARY KEY (`mem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.member:~3 rows (대략적) 내보내기
DELETE FROM `member`;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`mem_id`, `name`, `pwd`, `pnum`, `email`, `userAddr`, `userDaddr`, `grade`, `regidate`, `updatedate`, `status`) VALUES
	('admin', '관리자', '312433c28349f63c4f387953ff337046e794bea0f9b9ebfcb08e90046ded9c76', '01034563456', 'admin@admin.com', '서울 강동구 가래여울길 71 (고덕동)', '513-206', 2, '2023-07-24 00:03:12', '2023-07-24 00:03:12', '1'),
	('test00', '자바무새', '312433c28349f63c4f387953ff337046e794bea0f9b9ebfcb08e90046ded9c76', '01011111111', 'parrot@naver.om', '경기 안산시 단원구 예술대학로 61 (고잔동, 주공5단지상가)', '513-206', 2, '2023-07-21 00:14:15', '2023-07-21 00:14:15', '1'),
	('test123', '홍길동', '99d4335759ab8f7e708ca3922e1171aeadc95b3367e1e3442104f6e2949379cd', '', '', '', '', 2, '2023-07-22 11:06:12', '2023-07-22 11:06:12', '1');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 shop.menu 구조 내보내기
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_cd` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `menu_name` varchar(10) DEFAULT NULL,
  `menu_url` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`menu_cd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.menu:~4 rows (대략적) 내보내기
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`menu_cd`, `menu_name`, `menu_url`) VALUES
	('01', 'Home', '/home'),
	('02', 'Shop', '/showlist'),
	('03', 'Features', '/cart/view'),
	('05', 'About', '/about');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- 테이블 shop.orderlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `orderlist` (
  `orderlist_no` int NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `totprice` int NOT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `dstatus` enum('1','2','3','4') NOT NULL DEFAULT '1' COMMENT '1:배송준비중 2:출고완료 3:배송중 4:배송완료',
  `waybill_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '송장 번호',
  `parcel_cd` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '택배사 코드_ji add',
  PRIMARY KEY (`orderlist_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.orderlist:~16 rows (대략적) 내보내기
DELETE FROM `orderlist`;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` (`orderlist_no`, `mem_id`, `totprice`, `regidate`, `dstatus`, `waybill_num`, `parcel_cd`) VALUES
	(4, 'test123', 5616, '2023-07-22 16:12:33', '1', NULL, NULL),
	(5, 'test123', 3500, '2023-07-22 16:12:54', '1', NULL, NULL),
	(6, 'test123', 5616, '2023-07-22 16:15:41', '1', NULL, NULL),
	(7, 'test123', 5616, '2023-07-22 16:17:55', '1', NULL, NULL),
	(8, 'test123', 5616, '2023-07-22 16:19:55', '1', NULL, NULL),
	(9, 'test123', 3500, '2023-07-22 16:21:14', '1', NULL, NULL),
	(10, 'test123', 5616, '2023-07-22 16:24:18', '1', NULL, NULL),
	(11, 'test123', 3500, '2023-07-24 04:12:40', '1', NULL, NULL),
	(12, 'test123', 3500, '2023-07-24 04:13:07', '4', '576110328685', '04'),
	(13, 'admin', 3500, '2023-07-24 09:38:40', '1', NULL, NULL),
	(14, 'admin', 3500, '2023-07-24 09:38:42', '1', NULL, NULL),
	(15, 'admin', 3500, '2023-07-24 09:38:45', '1', NULL, NULL),
	(16, 'admin', 3500, '2023-07-24 09:38:48', '1', NULL, NULL),
	(17, 'admin', 3500, '2023-07-24 09:38:48', '1', NULL, NULL),
	(18, 'test00', 318500, '2023-07-26 16:16:38', '1', NULL, NULL),
	(19, 'test00', 318500, '2023-07-26 16:16:48', '1', NULL, NULL);
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;

-- 테이블 shop.order_address 구조 내보내기
CREATE TABLE IF NOT EXISTS `order_address` (
  `address_no` int NOT NULL AUTO_INCREMENT,
  `order_no` int NOT NULL,
  `name` varchar(10) NOT NULL,
  `phone` varchar(13) NOT NULL,
  `addr1` text NOT NULL,
  `addr2` text NOT NULL,
  `memo` text,
  `registered` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='배송주소';

-- 테이블 데이터 shop.order_address:~16 rows (대략적) 내보내기
DELETE FROM `order_address`;
/*!40000 ALTER TABLE `order_address` DISABLE KEYS */;
INSERT INTO `order_address` (`address_no`, `order_no`, `name`, `phone`, `addr1`, `addr2`, `memo`, `registered`) VALUES
	(4, 4, '홍길동', '01011112222', '경기 성남시 분당구 서판교로 32', 'ㄻㄻ', 'ㄻㄴㄻ', '2023-07-22 16:12:33'),
	(5, 5, '홍길동', '01011112222', '경기 성남시 분당구 서판교로 32', 'ㄻㄻ', 'ㄻㄴㄻ', '2023-07-22 16:12:54'),
	(6, 6, 'fasf', 'fasf', '경기 가평군 청평면 북한강로 2020', 'fsa', 'fsaf', '2023-07-22 16:15:41'),
	(7, 7, 'fafsaf', 'asfa', '서울 종로구 세검정로7가길 16', 'fasf', 'fasf', '2023-07-22 16:17:55'),
	(8, 8, '홍길동', '0101112222', '경기 성남시 분당구 대왕판교로 477', '테스트', 'ㅁㅁ', '2023-07-22 16:19:55'),
	(9, 9, '홍길동', '0101112222', '경기 성남시 분당구 대왕판교로 477', '테스트', 'ㅁㅁ', '2023-07-22 16:21:14'),
	(10, 10, '홍길동', '01011112222', '서울 강남구 압구정로79길 6', '테스트', '가나다', '2023-07-22 16:24:18'),
	(11, 11, '테스트 이름', '01011112222', '대전 동구 판교1길 3', '123', '123', '2023-07-24 04:12:40'),
	(12, 12, '테스트 이름', '01011112222', '경기 성남시 분당구 대왕판교로606번길 45', '123', '123', '2023-07-24 04:13:07'),
	(13, 13, 'test', '0152475922', '경기 안산시 단원구 시화벤처로 705', 'test', 'ㅅㄷ', '2023-07-24 09:38:40'),
	(14, 14, 'test', '0152475922', '경기 안산시 단원구 시화벤처로 705', 'test', 'ㅅㄷ', '2023-07-24 09:38:42'),
	(15, 15, 'test', '0152475922', '경기 안산시 단원구 시화벤처로 705', 'test', 'ㅅㄷ', '2023-07-24 09:38:45'),
	(16, 16, 'test', '0152475922', '경기 안산시 단원구 시화벤처로 705', 'test', 'ㅅㄷ', '2023-07-24 09:38:48'),
	(17, 17, 'test', '0152475922', '경기 안산시 단원구 시화벤처로 705', 'test', 'ㅅㄷ', '2023-07-24 09:38:48'),
	(18, 18, 'wjww', 'ww', '경기 안산시 단원구 갈마지길 5-2', 'ㅇㄹㄴㅇㄹ', 'ㄴㅇㄹㄴ', '2023-07-26 16:16:38'),
	(19, 19, 'wjww', 'ww', '경기 안산시 단원구 갈마지길 5-2', 'ㅇㄹㄴㅇㄹ', 'ㄴㅇㄹㄴ', '2023-07-26 16:16:48');
/*!40000 ALTER TABLE `order_address` ENABLE KEYS */;

-- 테이블 shop.order_payment 구조 내보내기
CREATE TABLE IF NOT EXISTS `order_payment` (
  `payment_no` int NOT NULL AUTO_INCREMENT,
  `order_no` int NOT NULL,
  `pay_type` tinyint NOT NULL DEFAULT '1' COMMENT 'pay_type. 1: 주문결제, 2: 주문취소',
  `imp_uid` varchar(45) NOT NULL COMMENT 'imp_uid',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT 'status. 1: 확인 대기, 2: 검증 완료, 3: 위조 혹은 변조 발생하여 강제취소',
  `reg_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'reg_date',
  PRIMARY KEY (`payment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.order_payment:~0 rows (대략적) 내보내기
DELETE FROM `order_payment`;
/*!40000 ALTER TABLE `order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_payment` ENABLE KEYS */;

-- 테이블 shop.qna 구조 내보내기
CREATE TABLE IF NOT EXISTS `qna` (
  `qna_no` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `regidate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1:작성중 2:전송완료',
  PRIMARY KEY (`qna_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.qna:~0 rows (대략적) 내보내기
DELETE FROM `qna`;
/*!40000 ALTER TABLE `qna` DISABLE KEYS */;
/*!40000 ALTER TABLE `qna` ENABLE KEYS */;

-- 테이블 shop.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `review_no` int NOT NULL AUTO_INCREMENT,
  `mem_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'member id 컬럼 fk',
  `goods_no` int NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `content` varchar(4000) NOT NULL,
  `score` int NOT NULL,
  `regidate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 shop.review:~4 rows (대략적) 내보내기
DELETE FROM `review`;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` (`review_no`, `mem_id`, `goods_no`, `title`, `content`, `score`, `regidate`, `updatedate`) VALUES
	(1, 'test', 48, '1234', '<p>1234</p>\r\n', 0, '2023-07-23 02:13:41', '2023-07-23 02:13:41'),
	(2, 'test', 48, '123', '<p>123</p>\r\n', 0, '2023-07-23 02:17:26', '2023-07-23 02:17:26'),
	(3, 'test', 48, '123', '<p>123</p>\r\n', 0, '2023-07-23 02:18:32', '2023-07-23 02:18:32'),
	(4, 'test', 47, 'test', '<p>test</p>\r\n', 0, '2023-07-24 06:27:13', '2023-07-24 06:27:13'),
	(5, 'admin', 58, NULL, '<p>test</p>\r\n', 3, '2023-07-27 01:53:36', '2023-07-27 01:53:36');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
