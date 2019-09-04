<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900|Noto+Sans:400,400i,700,700i&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/member/mypageMenubar-style.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/mypageCommon-style.css" type="text/css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
<!-- start leftSection 마이페이지 메뉴 -->
<div class="leftSection">
	<div class="profile">
		<p class="hello">Hello, ${loginUser.nickName }</p>
		<ul>
			<li>
				<a href=""><strong>${ scrapCount.hireCount+scrapCount.compCount+scrapCount.lcsCount }개</strong>총 스크랩</a>
			</li>
			<li>
				<a href=""><strong>${ scrapCount.compCount }개</strong>공모전</a>
			</li>
			<li>
				<a href=""><strong>${ scrapCount.hireCount }개</strong>채용공고</a>
			</li>
			<li>
				<a href=""><strong>${ scrapCount.lcsCount }개</strong>자격증</a>
			</li>
		</ul>
	</div>
	<!--end profile -->
	<div class="mypageNav">
		<div class="navTitle">MYPAGE MENU</div>
		<div class="navContent">
			<ul>
				<li>
					<%-- <img class="arrow" src="${contextPath}/resources/images/member/right-arrow.png"> --%>
					<i class="fas fa-angle-right"></i>
					<span class="navCt_title">MY INFO</span>
					<ul style="display:none;">
						<li>
							<a id="updateInfo" href="confirmUser.do">내 정보 관리</a>
						</li>
						<li>
							<a id="updatePwd" href="updatePwdForm.do">비밀번호변경</a>
						</li>
						<li>
							<a id="deleteM" href="deleteMV.do">회원탈퇴</a>
						</li>
					</ul>
				</li>
				<li>
					<%-- <img class="arrow" src="${contextPath}/resources/images/right-arrow.png"> --%>
					<i class="fas fa-angle-right"></i>
					<span class="navCt_title">MY SCRAP</span>
					<ul style="display:none;">
						<li>
							<a class="goScrap" id="compBtn" href="myPageScrapView.do?type=1">공모전</a>
						</li>
						<li>
							<a class="goScrap" id="hireBtn" href="myPageScrapView.do?type=2">채용공고</a>
						</li>
						<li>
							<a class="goScrap" id="lcsBtn" href="myPageScrapView.do?type=3">자격증</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<!-- end mypageNav -->
	<script>
	$('.navCt_title').on('click', function(){
		var a = $(event.target).prev();
		$(event.target).next().toggle();
		
		if($(event.target).next().css('display') == 'none'){
			/* $(event.target).prev().attr('src','${contextPath}/resources/image/right-arrow.png'); */
			$(event.target).prev().attr('class', 'fas fa-angle-right');
		} else {
			/* $(event.target).prev().attr('src','${contextPath}/resources/image/down-arrow.png'); */
			$(event.target).prev().attr('class', 'fas fa-angle-down');
		}
	});
	</script>
</div>
<!-- end leftSection 마이페이지 메뉴-->
<script>
/* 	$('.goScrap').on('click', function(){
		var type = $(event.target).val(); 
		location.href="myPageScrapView.do?type="+ type;
		location.href="myPageScrapView.do";
	}); 
	 $('#updateInfo').on('click', function(){
	location.href="confirmUser.do";
	});
	$('#updatePwd').on('click', function(){
		location.href="updatePwdForm.do";
	});
	$('#deleteM').on('click', function(){
		location.href="joinView.do";
	}); */
</script>
<!-- start main -->
</body>
</html>