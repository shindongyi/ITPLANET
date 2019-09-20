<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITPLANET</title>
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
				<a href="#"><strong>${ scrapCount.compCount+scrapCount.lcsCount }개</strong>총 스크랩 수</a>
			</li>
			<li>
				<a href="myPageScrapView.do?type=1"><strong>${ scrapCount.compCount+0 }개</strong>공모전</a>
			</li>
			<li>
				<a href="myPageScrapView.do?type=2"><strong>${ scrapCount.lcsCount+0 }개</strong>자격증</a>
			</li>
			<li>
				<a href="#"><strong>${ codingCount+0 }개</strong>코딩테스트</a>
			</li>
		</ul>
	</div>
	<!--end profile -->
	<div class="mypageNav">
		<div class="navTitle">MYPAGE MENU</div>
		<div class="navContent">
			<ul>
				<li>
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
					<i class="fas fa-angle-right"></i>
					<span class="navCt_title">MY SCRAP</span>
					<ul style="display:none;">
						<li>
							<a class="goScrap" id="compBtn" href="myPageScrapView.do?type=1">공모전</a>
						</li>
						<li>
							<a class="goScrap" id="lcsBtn" href="myPageScrapView.do?type=2">자격증</a>
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
			$(event.target).prev().attr('class', 'fas fa-angle-right');
		} else {
			$(event.target).prev().attr('class', 'fas fa-angle-down');
		}
	});
	</script>
</div>
<!-- end leftSection 마이페이지 메뉴-->
<!-- start main -->
</body>
</html>