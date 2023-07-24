<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="../resources/css/claim.css">
</head>
<body>
	<div class="claims">
		<div class="claim">
			<em class="claim__label">클레임</em>
			<div class="claim__wrap">
				<strong class="claim__author"></strong>
				<div class="claim__selected-option">상품명+종류</div>
			</div>
			<div class="claim__content">
				content
			</div>
			<div class="claim__time">
				time
			</div>
		</div>
		<div class="claim__reply">
			<i class="claim__reply__icon"></i>
			<em class="claim__reply__label">처리중</em>
			<div class="claim__reply__wrap">
				<strong class="claim__reply__author">회사명</strong>
				<div class="claim__reply__selected-option"></div>
			</div>
			<div class="claim__reply__content">
				content
			</div>
			<div class="claim__reply__time">
				time
			</div>
		
		</div>
	</div>
</body>
</html>

