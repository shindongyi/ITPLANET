<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITPLANET</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member/forgetView-style.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/mypageCommon-style.css" type="text/css">
</head>
<body>
	<div class="wrap">
		<div class="container">
			<div class="contentWrap">
				<div class="findMem">
					<!-- start findId -->
					<div class="findId">
						<h2 class="tMar">아이디 찾기</h2>
						<ul class="help">
							<li>
								- 회원정보에 저장된 이메일 주소로 아이디를 찾을 수 있습니다.
							</li>
						</ul>
						<div class="overHidden">
							<div class="findIdSection tBor">
								<form class="findIdForm" method="post">
									<div id="findIdWrap" class="boxCont">
										<fieldset>
											<legend>이메일주소로 아이디찾기</legend>
											<dl class="frmType overHidden">
												<dt>
													<label for="fidName">성명</label>
												</dt>
												<dd>
													<input type="text" name="fidName" id="fidName" class="txtInp" autocomplete="off"  style="width: 201px" title="성함 입력">
												</dd>
											</dl>
											<dl class="frmType overHidden">
												<dt>
													<label for="fidMail">이메일</label>
												</dt>
												<dd>
													<input type="text" class="txtInp" name="txEmail1" id="fidMail" style="width: 201px" title="이메일 아이디 입력">
													<%-- @
													<input type="text" class="txtInp" name="selfemail" id="selfemail" title="이메일 직접 입력" style="width:81px;ime-mode:disabled;">
													<select name="txEmail2" id="fidMail2" class="select" onchange="" title="이메일 서비스 선택">
														<option selected="selected" disabled="disabled">선택해 주세요</option>
														<c:forEach var="i" items="${email}">
															<c:if test="${i ne 'etc'}">
																<option value="${ i }">${ i }</option>																	
															</c:if>
															<c:if test="${i eq 'etc'}">
																<option value="${ i }">직접입력</option>																	
															</c:if>
														</c:forEach>														
													</select> --%>
												</dd>
											</dl>
										</fieldset>
										<p class="btnAlign">
											<span id="fIdBtn" class="findIdSubBtn">확인</span>
										</p>
									</div>
									<script>
										$('#fIdBtn').on('click', function(){
											findId();
										});
										
										function() findId{
											$.ajax({
												url: "findId.do",
												type: "post",
												data: {userName:fidName, email:txEmail1},
												success: function(data){
													if(data != null){
														$('#resultIdList strong').text('');
														$('#resultIdList strong').text('${data}');
														$('#idResult').show();
													}
												}
											});
										});
									</script>
								</form>
							</div>
						</div>
					</div>
					<!-- end findId -->
					<!-- start findPwd -->
					<div class="findPwd">
						<h2 class="tMar">비밀번호 찾기</h2>
						<ul class="help">
							<li>
								- 아이디와 회원정보에 저장된 이메일 주소로 비밀번호를 찾을 수 있습니다.
							</li>
						</ul>
						<div class="overHidden">
							<div class="findIdSection tBor">
								<form class="findPwdForm" method="post">
									<div id="findPwdWrap" class="boxCont">
										<fieldset>
											<legend>이메일주소로 아이디찾기</legend>
												<dl class="frmType overHidden">
													<dt>
														<label for="fpwId">아이디</label>
													</dt>
													<dd>
														<input type="text" name="fpwId" id="fpwId" class="txtInp" autocomplete="off"  style="width: 201px" title="아이디 입력">
													</dd>
												</dl>
												<dl class="frmType overHidden">
													<dt>
														<label for="fpwName">성명</label>
													</dt>
													<dd>
														<input type="text" name="fpwName" id="fpwName" class="txtInp" autocomplete="off"  style="width: 201px" title="성함 입력">
													</dd>
												</dl>
												<dl class="frmType overHidden">
													<dt>
														<label for="fpwMail2">이메일</label>
													</dt>
													<dd>
														<input type="text" class="txtInp" name="txEmail1" id="fpwMail2" title="이메일 아이디 입력" style="width:201px;">
														<%-- @
														<input type="text" class="txtInp" name="selfemail" title="이메일 직접 입력" style="width:81px;ime-mode:disabled;">
														<select name="txEmail2" class="select" onchange="" title="이메일 서비스 선택">
															<option selected="selected" disabled="disabled">선택해 주세요</option>
															<c:forEach var="i" items="${email}">
																<c:if test="${i ne 'etc'}">
																	<option value="${ i }">${ i }</option>																	
																</c:if>
																<c:if test="${i eq 'etc'}">
																	<option value="${ i }">직접입력</option>																	
																</c:if>
															</c:forEach>														
														</select> --%>
													</dd>
												</dl>
											</fieldset>
										<p class="btnAlign">
											<span id="fPwdBtn" class="findIdSubBtn">확인</span>
										</p>
									</div>
									<script>
										$('#fPwdBtn').on('click', function(){
											findId();
										});
										
										function() findPwd{
											var userId = $('#fpwId').val(); 
											var userName = $('#fpwName').val(); 
											var email = $('#fpwMail2').val();
											
											$.ajax({
												url: "findPwd.do",
												type: "post",
												data: {userId:userId, userName:userName, email:email},
												success: function(data){
													if(data == "success"){
														$('.changePwd').show();
													} else {
														alert('존재하지 않는 회원 정보입니다.');
													}
												}
											});
										});
									</script>
								</form>
							</div>
						</div>
					</div>
					<!-- end findPwd -->
					<!-- start id search result -->
					<div id="idResult" class="findResult overHidden">
						<p><strong>아이디 조회 결과 입력하신 정보와 일치하는 아이디는 아래와 같습니다.</strong><p>
						<ul id="resultIdList" class="idList">
							<li>- <strong>유저아이디</strong>(가입일자 : 0000년 0월 00일)</li>
						</ul>
					</div>
					<!-- end id search result -->
					<!-- start pwd search result -->
					<div class="changePwd">
						<h2 class="tMar">비밀번호 변경</h2>
						<ul class="help">
							<li>
								- 새로운 비밀번호로 변경해주세요.
							</li>
							<li>
								- 다른 아이디나 사이트에서 사용한 적 없는 안전한 비밀번호로 변경해주세요.
							</li>
						</ul>
						<div class="overHidden">
							<div class="findIdSection changePwdSection tBor">
								<form class="changePwdForm" method="post">
									<div id="changePwdWrap" class="boxCont">
										<fieldset>
											<legend>비밀번호 변경하기</legend>
											<dl class="frmType overHidden">
												<dt>
													<label for="newPwd1">새 비밀번호</label>
												</dt>
												<dd>
													<input type="text" name="newPwd1" id="newPwd1" class="txtInp" autocomplete="off"  style="width: 201px" title="새 비밀번호 입력">
													
												</dd>
											</dl>
											<dl class="frmType overHidden">
												<dt>
													<label for="newPwd2">새 비밀번호 확인</label>
												</dt>
												<dd>
													<input type="text" name="newPwd2" id="newPwd2" class="txtInp" autocomplete="off"  style="width: 201px" title="새 비밀번호 확인">
													
												</dd>
											</dl>
										</fieldset>
										<p class="btnAlign">
											<span id="findPwdBtn" class="findIdSubBtn">확인</span>
										</p>
									</div>
								</form>
							</div>
						</div>
					</div>
					<script>
						$('.findPwdBtn').on('click', function(){
							findPwd();
						});
						
						function findPwd(){
							$.ajax
						}
					</script>
					<!-- end pwd search result -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>