<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITPLANET</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/member/loginView-style.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/mypageCommon-style.css" type="text/css">
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<%-- 	<script type="text/javascript">
		$(function(){
			var msg = "<%= request.getAttribute("msg")%>";
			if(msg != "null"){
				alert(msg);
			}
		});
	</script> --%>
	<div id="wrap">
		<div id="container">
			<h2>LOGIN</h2>
			<p>ITPLANET에 오신 것을 환영합니다.</p>
			<div class="formBox">
				<div class="overHidden">
					<div class="loginSection">
						<form name="loginForm" method="post" action="login.do?url=${url}">
							<h3>회원 로그인</h3>
							<p class="tip"> 가입하신 ITPLANET 아이디와 비밀번호를 입력해주세요.<br>비밀번호는 대소문자를 구분합니다.
							<fieldset>
								<legend>회원 로그인</legend>
								<div class="flexForm tPad">
									<div>
										<input type="text" name="userId" id="userId" class="txtInp" maxlength="20" autocomplete="off" placeholder="아이디">
									</div>
								</div>
								<div class="flexForm tPad">
									<div>
										<input type="password" name="userPwd" id="userPwd" class="txtInp" maxlength="15" autocomplete="off" placeholder="비밀번호">
									</div>
								</div>
							</fieldset>
							<button class="loginBtn">로그인</button>
							<div class="help">
								<p><a href="forgetView.do">아이디/비밀번호 찾기 ></a></p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>