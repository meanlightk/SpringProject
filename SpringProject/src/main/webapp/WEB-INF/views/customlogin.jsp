<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>





<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">
		$(function() {
			$('#formContent #userID').focus();
			
			// 에러가 있는 경우 메세지 처리
			var errMsg = $('#errMsg').val();
			if(errMsg != '') {
				alert(errMsg);
				$('#formContent').find('#userID').focus();
			}
		});
	</script>
<title>로그인</title>
<link rel="stylesheet" href='<c:out value="/resources/css/login.css"/>'>
</head>
	<body>
		<div class="wrapper fadeInDown">
			<div id="formContent">
				<!-- Tabs Titles -->
				<h2 class="active">로그인</h2>
				<!-- Login Form -->
				<form action="${contextPath}/member/login.do" method="post">
					<input type="text" id="userID" class="fadeIn second" name="userID" placeholder="아이디"> 
					<input type="password" id="password" class="fadeIn third" name="password" placeholder="비밀번호" autocomplete="off"> 
					<input type="submit" class="fadeIn fourth" value="로그인">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" id="errMsg" value='${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}' />
				</form>
				<!-- Signup Link -->
				<div id="formFooter">
					<a class="underlineHover" href="${contextPath}/member/join.do">회원가입</a>
				</div>
			</div>
		</div>



</body>
</html>