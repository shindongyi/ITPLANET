<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="today"  value="<%=new Date()%>"/>
<c:set var="day1" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>"/>
<c:set var="day2" value="<%=new Date(new Date().getTime() + 60*60*24*2000)%>"/>
<fmt:formatDate type="date" value="${day1}" var="day11" pattern="YYYY-MM-dd (E)"/>
<fmt:formatDate type="date" value="${day2}" var="day22" pattern="YYYY-MM-dd (E)"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITPLANET</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member/mypageMainView-style.css" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
								<c:if test="${fn:length(recentComp) > 0 }">
								<c:forEach var="j" items="${ recentComp }" >
									<a href="${ j.LINK }" class="figure">
										<img src="${ j.FILEPATH/j.IMAGENAME }" width="106" height="106" alt="${ j.TITLE }">
									</a>
									<a href="${ j.LINK }">
										<span class="scpName">${ j.TITLE }</span>
									</a>
								</c:forEach>
								</c:if>
								</li>
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
								<c:if test="${fn:length(recentHire) > 0 }">
								<c:forEach var="j" items="${ recentHire }" >
								<li>
									<a href="${ j.LINK }" class="figure">
										<span class="scpName">${ j.TITLE }</span>
										<span class="scpName">${ j.LOCATION }</span>
										<span class="scpName">${ j.INFO }</span>
										<span class="scpName">${ j.HTYPE }</span>
									</a>
								</li>
								</c:forEach>
								</c:if>
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
								<c:if test="${fn:length(recentLcs) > 0 }">
								<c:forEach var="j" items="${ recentLcs }" >
								<li>
										<a href="${ j.LINK }" class="figure">
											<img src="${ k.FILEPATH/k.IMAGENAME }" width="106" height="106" alt="${ j.TITLE }">
										</a>
										<a href="${ j.LINK }">
											<span class="scpName">${ j.TITLE }</span>
										</a>
								</li>
								</c:forEach> 
								</c:if>
							</ul>
							<a href="myPageScrapView.do?type=3" class="more"><span>more</span>></a>
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
					 		<c:if test="${!empty day1List or !empty day2List}">
							<c:forEach var="i" begin="1" end="2">
							<c:if test="${i eq'1' }">
									<div class="almToday">
										<p class="todayBox">${day11}</p>
									</div>
									<c:forEach var="j" items="${ day1List }" varStatus="hStatus">
									<div class="alarmList">
										<ul class="alarmUnit">
											<li class="itemPart">
												<a href="#">
												<span class="alarmIco">
													<c:if test="${ j.CHANGENAME ne null }">
														<img src="" alt="${ j.TITLE }이미지">
													</c:if>
													<c:if test="${ j.CHANGENAME eq null}">
														<div class="scpName">${ j.TITLE }</div>
														<div class="scpName">${ j.LOCATION }</div>
														<div class="scpName">${ j.INFO }</div>
														<div class="scpName">${ j.HTYPE }</div>
													</c:if>
												</span>
													<dl>
														<dt>공고만료예정</dt>
														<dd>${ j.TITLE }</dd>
													</dl>
													<p>이 공고의 만료일이 D-1일 남았어요!</p>
												</a>
											</li>
										</ul>
									</div>
									</c:forEach>
									</c:if>
											<c:if test="${i eq'2' }">
									<div class="almToday">
										<p class="todayBox">${day22}</p>
									</div>
									<c:forEach var="j" items="${ day2List }" varStatus="hStatus">
									<div class="alarmList">
										<ul class="alarmUnit">
											<li class="itemPart">
												<a href="#">
												<span class="alarmIco">
													<c:if test="${ j.CHANGENAME ne null }">
														<img src="" alt="${ j.TITLE }이미지">
													</c:if>
													<c:if test="${ j.CHANGENAME eq null}">
														<div class="scpName">${ j.TITLE }</div>
														<div class="scpName">${ j.LOCATION }</div>
														<div class="scpName">${ j.INFO }</div>
														<div class="scpName">${ j.HTYPE }</div>
													</c:if>
												</span>
													<dl>
														<dt>공고만료예정</dt>
														<dd>${ j.TITLE }</dd>
													</dl>
													<p>이 공고의 만료일이 D-2일 남았어요!</p>
												</a>
											</li>
										</ul>
									</div>
									</c:forEach>
									</c:if>
									</c:forEach>
									</c:if>
									<c:if test="${empty day1List or empty day2List}">
										<div class="alarmIsNull">
											<p>NO DATA</p>
											<div class="alaramList">
												<span>마감이 임박한 공고가 없습니다.</span>
											</div>
										</div>
									</c:if>
						<p class="expire">수신일로부터 5일이 지난 알림은 자동 삭제됩니다.</p>
						</div>
					</div>
				</div>	
				<!-- end rightSection -->
			</div>
		</div>
	</div>
</div>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>