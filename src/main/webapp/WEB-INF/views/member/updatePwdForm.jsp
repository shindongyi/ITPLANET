<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITPLANET</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member/updateMemberForm-style.css" type="text/css">
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<div id="wrap">
	<div id="container">
		<div id="mypageContentWrap">
			<div id="myHeader">
				<h2>
					<a href="mypage.do">MY PAGE</a>
				</h2>
				<div id="breadcrumb">
					<a href="/">HOME</a> > 
					<a href="mypage.do">MY PAGE</a> > MY INFO > 
					<strong>비밀번호 변경</strong>
				</div>
			</div>
			<div id="mypageMain">
			<c:import url="/WEB-INF/views/member/mypageMenubar.jsp"/>
				<div class="myContent">
					<div class="titleSection">
						<h3>비밀번호 변경</h3>
					</div>
					<div class="mySection">
						<div id="primaryContent">
						<!-- 비밀번호 수정 입력 부분 -->
						<h4>비밀번호 변경</h4>
								<div class="updateForm_content">
									<div class="row_group">
										<div class="update_row">
											<div class="box">
												<h3 class="update_title"><label for="userPwd">현재 비밀번호</label><span class="red_mark">*</span></h3>
												<input type="password" id="userPwd" name="userPwd" class="int" maxlength="20">
											</div>
											<div class="error_box" id="userPwdMsg" style="display: none;"></div>
										</div>
										<div class="update_row">
											<div class="box">
												<h3 class="update_title"><label for="newPwd">새 비밀번호</label><span class="red_mark">*</span></h3>
												<input type="password" id="newPwd" name="newPwd" class="int" maxlength="20">
											</div>
											<div class="error_box" id="newPwdMsg" style="display: none;"></div>
										</div>
										<div class="update_row">
											<div class="box">
												<h3 class="update_title"><label for="newPwd2">새 비밀번호 확인</label><span class="red_mark">*</span></h3>
												<input type="password" id="newPwd2" name="newPwd2" class="int" maxlength="20">
											</div>
											<div class="error_box" id="newPwd2Msg" style="display: none;"></div>
										</div>
									</div>
									<!-- end row_group -->
								</div>
								<!-- end update_content -->
								<div id="btn_area">
									<button id="update_btn" type="button">변경하기</button>
								</div>	
						</div>
						<!-- end primaryContent -->
					</div>
					<!-- end myContent -->
				</div>
			</div>
		</div>
	</div>
</div>		
	<script>
		var userPwdFlag = false;
		var userPwdFlag2 = false;
		var checkPwd = false;
		
		$("#userPwd").blur(function(){
			checkUserPwd();
		});
		$("#newPwd").blur(function(){
			checkNewPwd();
		});
		$("#newPwd2").blur(function(){
			checkNewPwd2();
		});
		
		function checkUserPwd(){
			checkPwd = false;
			var userPwd = $('#userPwd').val();
			
			$.ajax({
				url: "checkUserPwd.do",
				method:"post",
				data:{userPwd:userPwd},
				success:function(data){
					if(data == "success"){
						checkPwd = true;
					} else {
						checkPwd = false;
					}
				}
				
			});
		}
		
		function checkNewPwd(){
			userPwdFlag = false;
			
			var newPwd = $('#newPwd').val();
			var oMsg = $('#newPwdMsg');
			
			var isUserPwd = /^(?=.*[a-z])((?=.*\d)(?=.*\W)).{6,20}$/gi;
			
			if(!isUserPwd.test(newPwd)){
				showErrorMsg(oMsg, "8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
			} else {
				oMsg.hide();
				userPwdFlag = true;
			} 
		}
		
		function checkNewPwd2(){
			userPwdFlag2 = false;
			
			var newPwd = $('#newPwd').val();
			var newPwd2 = $('#newPwd2').val();
			var oMsg = $('#newPwd2Msg');
			
			if(newPwd != newPwd2){
				showErrorMsg(oMsg, "비밀번호가 일치하지 않습니다.");
				console.log("1번 : " + newPwd);
				console.log("2번 : " + newPwd2);
			} else{
				oMsg.hide();
				userPwdFlag2 = true;
			}
		}
		
		function showErrorMsg(oMsg, msg){
			oMsg.attr('style', '');
			oMsg.text(msg);
		}
		
		$('#update_btn').on('click', function(){
			if(userPwdFlag && checkPwd){
				var newPwd = $('#newPwd').val();
				
				$.ajax({
					url: "updatePwd.do",
					data:{newPwd:newPwd},
					method:"post",
					success:function(data){
						if(data == "success"){
							alert('비밀번호가 변경되었습니다.');
							location.href='mypage.do';
						} else{
							alert('비밀번호 변경에 실패하였습니다. 잠시후 다시 시도해주세요.');
						}
					}
				});
				
			} else {
				if(!userPwdFlag){
					alert('모든 항목을 확인해주세요');
				} else if(!checkPwd){
					alert('현재 비밀번호와 일치하지 않습니다. 다시 확인해주세요.');
				}
			}
		});
		
		// 메뉴바 상위 메뉴 열려있게
		$('.navContent .navCt_title').eq(0).next().toggle();
	</script>
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>