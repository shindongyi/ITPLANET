<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용정보 상세페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/hire/hireDetail.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/77f9f5360f.js"></script>
<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
</head>
<script>

 $(function(){
	 $(document).ready(function(){
		$('#hireCom').hide(); 
	 });
	 
	 $("#hInfo").click(function(){
			$("#hireInfo").show();
			$("#hireCom").hide();
		});
		
		$("#hCom").click(function(){
			$("#hireInfo").hide();
			$("#hireCom").show();
		});
 });
	
</script>

<body>
	<div class="header">
	</div>
	<div id="container">
		<div class="section">
			<h3>채용 기업 이름</h3>
			<p>2019년 하반기 생산기술직 인턴 모집</p>
		</div>
		<div class="section">
			<h3>접수 기간</h3>
			<p class="dday">D-7</p>
			<p class="indent">8월 28일 ~ 9월 5일</p>
			<h3>상세 정보</h3>
			<h4>채용 형태</h4>
			<p class="indent">신입 / 정규직</p>
			<h4>지원 자격</h4>
			<p class="indent">학력 / 무관</p>
			<h4>모집 부문</h4>
			<p class="indent">기타</p>
			<h4>근무 지역</h4>
			<p class="indent">서울</p>
		</div>

		<div class="menubar">
			<ul id="menu">
				<li id="hInfo"><a href="#hireInfo"><ion-icon name="megaphone"></ion-icon>채용 공고</a></li>
				<li><h1>|</h1></li>
				<li id="hCom"><a href="#hireCom"><ion-icon name="information-circle"></ion-icon>기업
						정보</a></li>
			</ul>
		</div>
		<div class="content" id="hireInfo">
			<img src="<%= request.getContextPath() %>/resources/images/hire/a.jpg" class="contentImg">
		</div>
		<div class="section" id="hireCom">
			<h3>기업 개요</h3>
			<hr>
			<a class="website" href="#"><i class="fas fa-link"></i>채용사이트 바로가기</a>
		</div>

		<div class="menubottom">
			<a class="website" href="#"><i class="fas fa-link"></i>채용사이트 바로가기</a>
			<a class="scrap" href="#"><i class="far fa-bookmark"></i>스크랩</a>
		</div>
	</div>

</body>
</html>