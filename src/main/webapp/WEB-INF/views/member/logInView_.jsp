<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="${contextPath}/resources/css/myPage/loginView_-style.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/myPage/mypageCommon-style.css" type="text/css">
</head>
<body>

<div id="wrap">
	<div id="contents"> 
		<form id="loginForm" action="login.do" method="post">
			<div id="ct_top">
				<input type="text" id="userId" name="userId" value="" placeholder="아이디">
				<input type="text" id="userPwd" name="userPwd" value="" placeholder="비밀번호">
			</div>
			<div id="ct_middle">
				<ul>
					<li><a href="findId.do">아이디 찾기</a></li>
					<li><a href="findPwd.do">비밀번호 찾기</a></li>
				</ul>
			</div>
			<div id="ct_bottom">
				<button id="logIn" class="cb_button">로그인</button>
				<button type="button" id="join" class="cb_button">회원가입</button>
			</div>
		</form>
	</div>
</div>
<script>
	$('#join').on('click', function(){
		location.href="minsert.do";
	});
</script>z
</body>
</html>