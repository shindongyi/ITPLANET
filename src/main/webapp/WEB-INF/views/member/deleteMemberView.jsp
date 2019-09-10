<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITPLANET</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member/updateMemberForm-style.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/deleteMemberView-style.css" type="text/css">
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
					<strong>회원탈퇴</strong>
				</div>
			</div>
			<div id="mypageMain">
			<c:import url="/WEB-INF/views/member/mypageMenubar.jsp"/>
				<div class="myContent">
					<div class="titleSection">
						<h3>회원탈퇴</h3>
						<div>
							<p>그 동안 ITPLANET을 이용해주셔서 감사합니다.</p>
						</div>
						<div class="dropGuide">
							<h4>회원 탈퇴 안내</h4>
							<ol class="guide">
								<li>
									<span class="crRed fb">1.</span>
									<strong>회원탈퇴 시</strong>
									회원님의 정보는 소비자 보호에 관한 법류에 의거한 ITPLANET 고객정보 보호정책에 따라 관리됩니다.
								</li>
								<li>
									<span class="crRed fb">2.</span>
									<strong>회원탈퇴 시</strong>
									회원님이 활동하셨던 기록에 대한 복구는 어려울 수 있습니다.
								</li>
								<li>
									<span class="crRed fb">3.</span>
									한 번 탈퇴한 아이디는 다시 사용할 수 없습니다.
								</li>
							</ol>
						</div>
					</div>
					<div class="mySection">
						<div id="primaryContent">
						<!-- 본인확인 입력 부분 -->
						<h4>본인확인</h4>
						<form id="update_form" method="post" action="#">
							<div class="updateForm_content">
								<div class="row_group">
									<div class="update_row">
										<div class="box">
											<h3 class="update_title">아이디</h3>
											<strong>${ loginUser.userId }</strong>
										</div>
									</div>
									<div class="update_row">
										<div class="box" style="height:110px">
											<div class="error_box guideMsg">회원정보에 등록된 이메일을 입력하여 주세요.</div>
											<h3 class="update_title email_title"><label for="email">본인 확인</label></h3>
											<input type="text" id="email" name="email" class="int emailCk">
										</div>
										<div class="error_box" id="confirmUser" style="display: none;"></div>
									</div>
								</div>
							</div>
							<div id="btn_area">
								<button type="button" id="drop_btn">탈퇴하기</button>
							</div>
							<!-- end updateForm_content -->
						</form>
						</div>
						<!-- end primaryContent -->
					</div>
					<!-- end myContent -->
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#drop_btn').on('click', function(){
			var email = $('#email').val();
			
			$.ajax({
				url: "emailCheck.do",
				method: "post",
				data: {email : email},
				success: function(data){
					if(data == "success"){
						if(confirm("정말 탈퇴하시겠습니까?"))
						location.href="deleteM.do";
					} else {
						$('#confirmUser').text('회원정보에 등록된 이메일과 일치하지 않습니다.');
					}
				}
			});
		});	
	</script>
</div>		
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>