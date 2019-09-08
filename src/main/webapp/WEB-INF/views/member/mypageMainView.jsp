<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="today"  value="<%=new Date()%>"/>
<c:set var="day1" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>"/>
<c:set var="day2" value="<%=new Date(new Date().getTime() + 60*60*24*2000)%>"/>
<fmt:formatDate type="date" value="${day1}" var="day11" pattern="YYYY-MM-dd (E)"/>
<fmt:formatDate type="date" value="${day2}" var="day22" pattern="YYYY-MM-dd (E)"/>
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
							<c:forEach var="i" items="${ recentComp }">
								<li>
									<a href="${ i.LINK }" class="figure">
										<img src="${ i.FILEPATH/i.IMAGENAME }" width="106" height="106" alt="${ i.TITLE }">
									</a>
									<a href="${ i.LINK }">
										<span class="scpName">${ i.TITLE }</span>
									</a>
								</li>
							</c:forEach>
							</ul>
							<a href="myPageScrapView.do?type=1" class="more"><span>more</span>></a>
						</div>
					</div>
					<!-- end compe 공모전 리스트 -->
					<!-- start hire 채용공고 리스트 -->
					<div class="article hire">
						<h3>최근 채용공고 스크랩</h3>
						<div class="detail">
							<ul class="scpList">
								<c:forEach var="i" items="${ recentHire }">
									<li>
										<a href="${ i.LINK }" class="figure">
											<span class="scpName">${ i.TITLE }</span>
											<span class="scpName">${ i.LOCATION }</span>
											<span class="scpName">${ i.INFO }</span>
											<span class="scpName">${ i.HTYPE }</span>
										</a>
									</li>
								</c:forEach> 
							</ul>
							<a href="myPageScrapView.do?type=2" class="more"><span>more</span>></a>
						</div>
					</div>
					<!-- end hire 채용정보 리스트 -->
					<!-- start lcs 자격증 리스트 -->
					<div class="article lcs">
						<h3>최근 자격증 스크랩</h3>
						<div class="detail">
							<ul class="scpList">
								<c:forEach var="i" items="${ recentLcs }">
									<li>
										<a href="${ i.LINK }" class="figure">
											<img src="${ i.FILEPATH/i.IMAGENAME }" width="106" height="106" alt="${ i.TITLE }">
										</a>
										<a href="${ i.LINK }">
											<span class="scpName">${ i.TITLE }</span>
										</a>
									</li>
								</c:forEach> 
							</ul>
							<a href="myPageScrapView.do?type=3" class="more"><span>more</span>></a>
						</div>
					</div>
					<!-- end lcs 자격증 리스트 -->
				</div>
				<!-- end middleSection -->
				<!-- start rightSection -->
				<%--<div class="section rightSection">
					<div class="article alarm">
						<h3>
							<i class="fas fa-bell"></i>
							<span></span>
							MY 알림
						</h3>
					 	<div class="myAlarm">
							<div class="alarmList">
								<div class="almToday">
									<p class="todayBox">${day11}</p> 
								</div>
								<ul class="alarmUnit">
									<li class="itemPart">
										<a href="#">
											<span class="alarmIco"></span>
											<dl>
												<dt>공고만료예정</dt>
												<dd>${ TITLE }</dd>
											</dl>
											<p>이 공고의 만료일이 D-1일 남았어요!</p>
										</a>
									</li>
								</ul>
							</div>
							<c:forEach var="i" begin="1" end="2">
								<div class="alarmList">
									<div class="almToday">
										<c:if test="i eq 1">
											<p class="todayBox">${day11}</p>
										</c:if>
										<c:if test="i eq 2">
											<p class="todayBox">${day22}</p> 
										</c:if>
									</div>
									<ul class="alarmUnit">
										<li class="itemPart">
											<a href="#">
											<span class="alarmIco">
												<c:if test="${ CHANGENAME ne null }">
													<img src="" alt="${ TITLE }이미지">
												</c:if>
												<c:if test="${ CHANGENAME eq null}">
													<div class="scpName">${ TITLE }</div>
													<div class="scpName">${ LOCATION }</div>
													<div class="scpName">${ INFO }</div>
													<div class="scpName">${ HTYPE }</div>
												</c:if>
											</span>
												<dl>
													<dt>공고만료예정</dt>
													<dd>${ TITLE }</dd>
												</dl>
												<c:if test="i eq 1">
													<p>이 공고의 만료일이 D-1일 남았어요!</p>
												</c:if>
												<c:if test="i eq 2">
													<p>이 공고의 만료일이 D-2일 남았어요!</p> 
												</c:if>
											</a>
										</li>
									</ul>
								</div>
							</c:forEach>
						<p class="expire">수신일로부터 5일이 지난 알림은 자동 삭제됩니다.</p>
						</div>
					</div>
				</div>	
				<!-- end rightSection --> --%>
			</div>
		</div>
	</div>
</div>
</body>
</html>