<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900|Noto+Sans:400,400i,700,700i&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPageMenuBar_-style.css" type="text/css">
</head>
<body>

<div id="wrap">
	<div id="container">
		<div id="myPageMenu">
			<div id="menuTitle"> 
				<span>마이페이지</span>
			</div>
			<div class="menu_box">
				<img id="arrow" src="${contextPath}/resources/image/down-arrow.png">
				<span class="menu myInfo">내 정보</span>
				<ul id="myInfo_next_ul">
					<li>
						<a id="updatePwd" href="#">비밀번호변경</a>
					</li>
					<li>
						<a id="updateInfo" href="#">내 정보 관리</a>
					</li>
				</ul>
			</div>
			<div class="menu_box">
				<span class="menu scrap"><a href="#">스크랩</a></span>
			</div>
		</div>
		<!-- end myPageMenu -->
		<div id="content">
			<jsp:include page="myPageMainView_.jsp"/>
		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
</div>
<!-- end wrap -->
<script>
	$('.myInfo').on('click', function(){
		console.log(event.target);
		$(event.target).next().toggle();
		
		if($('#myInfo_next_ul').css('display') == 'none'){
			$('#arrow').attr('src','${contextPath}/resources/image/right-arrow.png');
		} else{
			$('#arrow').attr('src','${contextPath}/resources/image/down-arrow.png');
		}
	});
	$('.scrap').on('click', function(){
		$('#content').load('myPageScrapView.do');
	});
	$('#menuTitle').on('click', function(){
		$('#content').load('myPage.do');
	});
	$('#updateInfo').on('click', function(){
		$('#content').load('updateMemberForm.do');
	});
	$('#updatePwd').on('click', function(){
		$('#content').load('updatePwdForm.do');
	});
</script>
</body>
</html>