<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
					<a href="#">HOME</a> > 
					<a href="myPage.do">MY PAGE</a> > MY INFO > 
					<strong>개인정보 수정</strong>
				</div>
			</div>
			<div id="mypageMain">
			<c:import url="/WEB-INF/views/member/mypageMenubar.jsp"/>
			<div class="myContent">
				<div class="titleSection">
					<h3>개인정보 수정</h3>
					<ul class="list">
						<li>회원님의 주소와 연락처 등 개인정보를 수정하실 수 있습니다.</li>
						<li>휴대전화번호와 이메일은 한번 더 확인하시어 주시기 바랍니다.</li>
					</ul>
				</div>
				<div class="mySection">
				<div id="primaryContent">
					<!-- 개인정보 수정 입력 부분 -->
					<h4>개인정보 관리</h4>
					<form id="update_form" method="post" action="updateM.do">
								<!-- <h2>개인정보 수정</h2> -->
								<div class="updateForm_content">
									<div class="row_group">
										<div class="update_row">
											<div class="box">
												<h3 class="update_title"><label for="userName">이름</label><span class="red_mark">*</span></h3>
												<input type="text" id="userName" name="userName" class="int" value="${ loginUser.userName }">
											</div>
											<div class="error_box" id="userNameMsg" style="display: none;"></div>
										</div>
										<div class="update_row">
											<div class="box">
												<h3 class="update_title"><label for="nickName">닉네임</label><span class="red_mark">*</span></h3>
												<input type="text" id="nickName" name="nickName" class="int" value="${ loginUser.nickName }">
											</div>
											<div class="error_box" id="nickNameMsg" style="display: none;"></div>
										</div>
										<div class="update_row update_birth">
											<div class="birth_wrap">
												<h3 class="update_title"><label>생년월일</label><span class="red_mark">*</span></h3>
												<div class="inner_birth_wrap">
													<div class="birth_yy">
														<input type="text" id="birth_yy" name="birth_yy" class="int" maxlength="4" value="${fn:substring(loginUser.birthDay, 0, 4)}">
													</div>
													<div class="birth_mm">
														<select id="birth_mm" name="birth_mm" class="sel">
														<c:forEach var="i" begin="1" end="12">
															<c:if test="${ i eq  fn:substring(loginUser.birthDay, 5, 7)}"> 
																<option selected="selected">${ i }</option>
															</c:if>
															<c:if test="${i ne fn:substring(loginUser.birthDay, 5, 7)}">
																<option>${ i }</option>
															</c:if>
														</c:forEach>
														</select>
													</div>
													<div class="birth_dd">
														<input type="text" id="birth_dd" name="birth_dd" class="int" maxlength="2" value="${fn:substring(loginUser.birthDay, 8, 10)}">
													</div>
												</div>
											</div>
											<div class="error_box" id="birthMsg" style="display: none;"></div>
										</div>
										<!-- end update_birth -->
										<div class="update_row update_gender">
											<div class="box">
												<h3 class="update_title"><label for="gender">성별</label><span class="red_mark">*</span></h3>
												<select id="gender" name="gender" class="sel">
													<option disabled selected>성별</option>
													<option value="남">남자</option>
													<option value="여">여자</option>
												</select>
											</div>
											<span class="error_box" id="genderMst" style="display: none;"></span>
										</div>
										<script>
											$(function(){
												var gender = "${ loginUser.gender}";
												if(gender == "남"){
													$('option[value="남"]').attr('selected', 'true');
												} else{
													$('option[value="여"]').attr('selected', 'true');
												}
											});
										</script>
										<!-- end update_gender -->
										<div class="update_row">
											<div class="box">
												<h3 class="update_title"><label for="email">본인 확인 이메일</label><span class="red_mark">*</span></h3>
												<button type="button" class="emailBtn" id="sendNum">인증번호 전송</button>
												<input type="text" id="email" name="email" class="int email" value="${ loginUser.email }">
											</div>
											<div class="box" id="emailNumCk" style="display: none;">
												<button class="emailBtn" id="checkNum">인증번호 확인</button>
												<input type="text" class="int email" id="inputNum">
											</div>
											<div class="error_box" id="emailMsg" style="display: none;"></div>
										</div>
									</div>
								</div>
								<!-- end update_content -->
								<div id="btn_area">
									<button type="button" id="update_btn">수정하기</button>
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
</div>
<script>
var check = false;

$("#userName").blur(function(){
	checkUserName();
});

$("#nickName").blur(function(){
	checkNickName();
});
$("#birth_yy").blur(function(){
	checkBirth();
});
$("#birth_mm").blur(function(){
	checkBirth();
});
$("#birth_dd").blur(function(){
	checkBirth();
});

$("#gender").blur(function(){
	checkGender();
});
$("#email").blur(function(){
	checkEmail();
});

function checkUserName(){
	check = false;
	
	var userName = $('#userName').val();
	var oMsg = $('#userNameMsg');
	
	if(userName == "") {
		showErrorMsg(oMsg, "이름을 입력해주세요.");
	} else {
		oMsg.hide();
		check = true;
	}
}

function checkNickName(){
	check = false;
	
	var nickName = $('#nickName').val();
	var oMsg = $('#nickNameMsg');
	
	if(nickName == "") {
		showErrorMsg(oMsg, "닉네임을 입력해주세요.");
	} else {
		oMsg.hide();
		checkNickNameAjax();
	}
}

function checkNickNameAjax(){
	var nickName = $('#nickName').val();
	var oMsg = $('#nickNameMsg');
	
	$.ajax({
		url: "checkNickName.do",
		method: "POST",
		data: {nickName:nickName},
		success: function(data){
			if(data == "success"){
				showErrorMsg(oMsg, "이미 사용중인 닉네임입니다.");
				check= false;
			} else{
				showErrorMsg(oMsg, "사용 가능한 닉네임입니다.");
				oMsg.css('color', 'green');
				check= true;
			}
		}
	});
}

function checkBirth(){
	check = false;
	
	var birth_yy = $('#birth_yy').val();
	var birth_mm = $('#birth_mm').val();
	var birth_dd = $('#birth_dd').val();
	var oMsg = $('#birthMsg');
	
	var isBirth_yy = /^[1-2]{1}[90]{1}[0-9]{2}/;
	var isBirth_mm = /^[0-9]+$/;
	var isBirth_dd;
	
	switch(birth_mm){
	case "1": case "3": case "5": case "7": case "8": case "10": case "12":
		isBirth_dd = /^[1-2]{1}[0-9]{1}$|^[3]{1}[0-1]{1}$/;
		break;
	case "4": case "6": case "9": case "11":
		isBirth_dd = /^[1-2]{1}[0-9]{1}$|^[3]{1}[0]{1}$/;
		break;
	case "2": 
		isBirth_dd = /^[1]{1}[0-9]{1}$|^[2]{1}[0-9]{1}$/;
		break;
	}
		
	if(birth_yy == "" || birth_dd == "" || !isBirth_mm.test(birth_mm)){
		showErrorMsg(oMsg, "생년월일을 다시 확인해주세요.");
	} else if(!isBirth_dd.test(birth_dd)){
		showErrorMsg(oMsg, "생년월일을 다시 확인해주세요.");
	} else if(!isBirth_yy.test(birth_yy)){
		showErrorMsg(oMsg, "정말요?");
	} else{
		oMsg.hide();
		check = true;
	}
}

function checkGender(){
	check = false;
	
	var gender = $('#gender').val();
	var oMsg = $('#genderMsg');
	
	if(gender != "남자" || gender != "여자"){
		showErrorMsg(oMsg, "성별을 선택해주세요.");
	} else {
		oMsg.hide();
		check = true;
	}
}

function checkEmail(){
	check = false;
	
	var email = $('#email').val();
	var oMsg = $('#emailMsg');
	
	var isEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	if(!isEmail.test(email)){
		showErrorMsg(oMsg, "이메일을 다시 확인해주세요.")
	} else {
		oMsg.hide();
		check = true;
	}
}

// 인증번호 전송 버튼 클릭시 번호 입력 칸 토글
$('#sendNum').on('click', function(){
	$('#emailNumCk').attr('style', '');
});

function showErrorMsg(oMsg, msg){
	oMsg.attr('style', '');
	oMsg.text(msg);
}

$('#update_btn').on('click', function(){
	if(check){
		console.log("2:"+check);
		$('#update_form').submit();
	} else {
		console.log(check);
		alert("모든 항목을 확인해주세요."+check);
	}
});
</script>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>