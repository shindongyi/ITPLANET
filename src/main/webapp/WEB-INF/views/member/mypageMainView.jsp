<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="today"  value="<%=new Date()%>"/>
<c:set var="day11" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>"/>
<c:set var="day22" value="<%=new Date(new Date().getTime() + 60*60*24*2000)%>"/>
<fmt:formatDate type="date" value="${today}" var="dDay" pattern="YYYY-MM-dd (E)"/>
<fmt:formatDate type="date" value="${day11}" var="day1" pattern="YYYY-MM-dd (E)"/>
<fmt:formatDate type="date" value="${day22}" var="day2" pattern="YYYY-MM-dd (E)"/>
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
								<c:if test="${fn:length(recentComp) > 0 }">
								<c:forEach var="j" items="${ recentComp }" >
								<li>
									<a href="competitionDetail?cId=${ j.SID }" class="figure">
										<img src="" width="106" height="106" alt="${ j.TITLE }">
									</a>
									<a href="competitionDetail?cId=${ j.SID }">
										<span class="scpName">${ j.TITLE }</span>
									</a>
								</li>
								</c:forEach>
								</c:if>
							</ul>
								<c:if test="${empty recentComp }">
								<div>
									<span>스 크 랩  된  글 이  없 습 니 다 .</span>
									<a href="competitionView.do" class="bGoBtn">공모전 게시판 가기 ></a>
								</div>
								</c:if>
							<a href="myPageScrapView.do?type=1" class="more"><span>more</span>></a>
						</div>
					</div>
					<!-- end compe 공모전 리스트 -->
					<!-- start lcs 자격증 리스트 -->
					<div class="article lcs" style="border-bottom: 0.5px solid #ddd;">
						<h3>최근 자격증 스크랩</h3>
						<div class="detail">
							<ul class="scpList">
								<c:if test="${fn:length(recentLcs) > 0 }">
								<c:forEach var="j" items="${ recentLcs }" >
								<li>
									<a href="${ j.LINK }" target="_blank">
										<span class="scpName">제 ${ j.ROUND }회</span>
										<span class="scpName">${ j.TITLE }</span>
									</a>
								</li>
								</c:forEach> 
								</c:if>
							</ul>
								<c:if test="${empty recentLcs }">
								<div>
									<span>스 크 랩  된  글 이  없 습 니 다 .</span>
									<a href="lcsView.do" class="bGoBtn">자격증 게시판 가기 ></a>
								</div>
								</c:if>
							<a href="myPageScrapView.do?type=2" class="more"><span>more</span>></a>
						</div>
					</div>
					<!-- end lcs 자격증 리스트 -->
				</div>
				<!-- end middleSection -->
				<!-- start rightSection 오른쪽 알람 섹션 -->
				<div class="section rightSection"> 
					<div class="article alarm">
						<h3>
							<i class="fas fa-bell"></i>
							<span>MY 알림</span>
						</h3>
							<div class="myAlarm">
					 		<c:if test="${!empty list}"> <!--알람 리스트가 null이 아닐 경우 -->
							<c:forEach var="i" items="${list}" varStatus="status">
							<c:if test="${!empty i }">
								<div class="almToday">
									<c:if test="${ status.index eq '0' }">		
									<p class="todayBox">${dDay}</p>
									</c:if>
									<c:if test="${ status.index eq '1' }">		
									<p class="todayBox">${day1}</p>
									</c:if>
									<c:if test="${ status.index eq '2' }">		
									<p class="todayBox">${day2}</p>
									</c:if>
								</div>
								<c:forEach var="j" items="${ i }">
								<div class="alarmList">
									<ul class="alarmUnit">
										<li class="itemPart">
											<a href="${ j.LINK }" target="_blank">
											<span class="alarmIco">
												<c:if test="${ j.IMAGENAME ne null }"> <!-- 이미지가 있다면 이미지만, 아니면 타이틀과 회차 출력 --> 
													<img src="" alt="${ j.TITLE }이미지">
												</c:if>
												<c:if test="${ j.IMAGENAME eq null}">
													<div class="scpName">제 ${ j.ROUND }회</div>
													<div class="scpName">${ j.TITLE }</div>
												</c:if>
											</span>
												<dl>
													<dt>공고만료예정</dt>
													<dd>${ TITLE }</dd>
												</dl>
												<p>이 공고의 만료일이 D-${status.index}일 남았어요!</p>
											</a>
										</li>
									</ul>
								</div>
								</c:forEach>
								</c:if>
								</c:forEach>
								</c:if>
								<c:if test="${empty list[0] and empty list[1] and empty list[2]}"> <!--알람 리스트가 null일 경우 -->
									<div class="alarmIsNull">
										<p>NO DATA</p>
										<div class="alaramList">
											<span>마감이 임박한 공고가 없습니다.</span>
										</div>
									</div>
								</c:if>
						<p class="expire">날짜가 지난 알림은 자동으로 삭제됩니다.</p>
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