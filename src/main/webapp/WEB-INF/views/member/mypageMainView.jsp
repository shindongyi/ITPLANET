<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member/mypageMainView-style.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<div id="wrap">
		<div id="container">
			<div id="mypageContentWrap">
				<div id="myHeader">
					<h2>
						<a href="mypage.do">MY PAGE</a>
					</h2>
					<div id="breadcrumb"></div>
				</div>
				<div id="mypageMain">
				<c:import url="/WEB-INF/views/member/mypageMenubar.jsp"/>
				<div class="section middleSection">
					<!-- start compe 공모전 리스트 -->
					<div class="article compe">
						<h3>최근 공모전 스크랩</h3>
						<div class="detail">
							<ul class="scpList"> 
								<li>
									<a href="#" class="figure">
										<img src="" width="106" height="106" alt="">
									</a>
									<a href="#">
										<span class="scpName">공모전 제목</span>
									</a>
								</li>
							</ul>
							<a href="mypageScrapView.do?type=1" class="more"><span>more</span>></a>
						</div>
					</div>
					<!-- end compe 공모전 리스트 -->
					<!-- start hire 채용공고 리스트 -->
					<div class="article hire">
						<h3>최근 채용공고 스크랩</h3>
						<div class="detail">
							<ul class="scpList"> 
								<li>
									<a href="#" class="figure">
										<img src="" width="106" height="106" alt="">
									</a>
									<a href="#">
										<span class="scpName">채용공고 제목</span>
									</a>
								</li>
							</ul>
							<a href="mypageScrapView.do?type=2" class="more"><span>more</span>></a>
						</div>
					</div>
					<!-- end hire 채용정보 리스트 -->
					<!-- start lcs 자격증 리스트 -->
					<div class="article lcs">
						<h3>최근 자격증 스크랩</h3>
						<div class="detail">
							<ul class="scpList"> 
								<li>
									<a href="#" class="figure">
										<img src="" width="106" height="106" alt="">
									</a>
									<a href="#">
										<span class="scpName">자격증 제목</span>
									</a>
								</li>
							</ul>
							<a href="mypageScrapView.do?type=3" class="more"><span>more</span>></a>
						</div>
					</div>
					<!-- end lcs 자격증 리스트 -->
				</div>
				<!-- end middleSection -->
				<!-- start rightSection -->
				<div class="section rightSection">
					<div class="article alarm">
						<h3>
							<i class="fas fa-bell"></i>
							<span></span>
							MY 알림
						</h3>
						<div class="myAlarm">
							<div class="alarmList">
								<div class="almToday">
									<p class="todayBox">2019.08.30 (금)</p> 
								</div>
								<ul class="alarmUnit">
									<li class="itemPart">
										<a href="#">
											<span class="alarmIco"></span>
											<dl>
												<dt>공고만료예정</dt>
												<dd>해당공고제목</dd>
											</dl>
											<p>이 공고의 만료일이 D-3일 남았어요!</p>
										</a>
									</li>
									<li class="itemPart">
										<a href="#">
											<span class="alarmIco"></span>
											<dl>
												<dt>공고만료예정</dt>
												<dd>해당공고제목</dd>
											</dl>
											<p>이 공고의 만료일이 D-3일 남았어요!</p>
										</a>
									</li>
								</ul>
							</div>
							<div class="alarmList">
							<div class="almToday">
								<p class="todayBox">2019.08.29 (목)</p> 
							</div>
							<ul class="alarmUnit">
								<li class="itemPart">
									<a href="#">
										<span class="alarmIco"></span>
										<dl>
											<dt>공고만료예정</dt>
											<dd>해당공고제목</dd>
										</dl>
										<p>이 공고의 만료일이 D-2일 남았어요!</p>
									</a>
								</li>
								<li class="itemPart">
									<a href="#">
										<span class="alarmIco"></span>
										<dl>
											<dt>공고만료예정</dt>
											<dd>해당공고제목</dd>
										</dl>
										<p>이 공고의 만료일이 D-2일 남았어요!</p>
									</a>
								</li>
							</ul>
						</div>
						<p class="expire">수신일로부터 5일이 지난 알림은 자동 삭제됩니다.</p>
						</div>
					</div>
				</div>	
				<!-- end rightSection -->
			</div>
		</div>
	</div>
</div>
</body>
</html>