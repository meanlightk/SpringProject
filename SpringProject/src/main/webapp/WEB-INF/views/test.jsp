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





<!-- 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    
<div class="container">
  <button type="button" class="btn btn-info btn-round" data-toggle="modal" data-target="#loginModal">
    Login
  </button>  
</div>

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header border-bottom-0">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-title text-center">
          <h4>Login</h4>
        </div>
        <div class="d-flex flex-column text-center">
          <form>
            <div class="form-group">
              <input type="email" class="form-control" id="email1"placeholder="Your email address...">
            </div>
            <div class="form-group">
              <input type="password" class="form-control" id="password1" placeholder="Your password...">
            </div>
            <button type="button" class="btn btn-info btn-block btn-round">Login</button>
          </form>
          
          <div class="text-center text-muted delimiter">or use a social network</div>
          <div class="d-flex justify-content-center social-buttons">
            <button type="button" class="btn btn-secondary btn-round" data-toggle="tooltip" data-placement="top" title="Twitter">
              <i class="fab fa-twitter"></i>
            </button>
            <button type="button" class="btn btn-secondary btn-round" data-toggle="tooltip" data-placement="top" title="Facebook">
              <i class="fab fa-facebook"></i>
            </button>
            <button type="button" class="btn btn-secondary btn-round" data-toggle="tooltip" data-placement="top" title="Linkedin">
              <i class="fab fa-linkedin"></i>
            </button>
          </di>
        </div>
      </div>
    </div>
      <div class="modal-footer d-flex justify-content-center">
        <div class="signup-section">Not a member yet? <a href="#a" class="text-info"> Sign Up</a>.</div>
      </div>
  </div>
</div>
</div>

<script>
$(document).ready(function() {
	$('#loginModal').modal('show');
		$(function () {
			$('[data-toggle="tooltip"]').tooltip()
		})
	});
</script>

<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap-grid.css">
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap-reboot.css">

<script src="../resources/js/bootstrap.js"/>
<script src="../resources/js/bootstrap.bundle.js"/>


 -->

<%-- <%@include file="includes/loginmodal.jsp" %> --%>

</body>
</html>