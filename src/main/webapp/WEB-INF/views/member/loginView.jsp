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
						<button class="loginBtn" id="loginBtn" type="button">로그인</button>
						<div class="help">
							<p><a href="forgetView.do">아이디/비밀번호 찾기 ></a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var userId = $('#userId');
		var userPwd = $('#userPwd');
		
		$('#loginBtn').on('click', function(){
			submit();
		});	
		
		$('.loginSection').on('keypress', '#userPwd, #userPwd', function(e){
			if(e.keyCode == 13){
				submit();
			}
		})
	
		function submit(){
			var userId = $('#userId').val();
			var userPwd = $('#userPwd').val();
			
			var url = "${url}";
			
			$.ajax({
				url: "login.do",
				method: "post",
				data:{userId:userId, userPwd:userPwd, url:url},
				success:function(data){
					if(data != "fail"){
						console.log("data : " + data);
						location.href= data;
					} else {
						alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.');
					}
				}
			});
		}

	</script>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>