<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPageScrapView-style.css" type="text/css">
</head>
<body>
<div id="wrap">
	<div id="container">
		<div id="mypageContentWrap">
			<div id="myHeader">
				<h2>
					<a href="myPage.do">MY PAGE</a>
				</h2>
				<div id="breadcrumb">
					<a href="#">HOME</a> > 
					<a href="myPage.do">MY PAGE</a> > MY SCRAP > 
					<strong>공모전</strong>
				</div>
			</div>
			<div id="mypageMain">
			<c:import url="/WEB-INF/views/member/mypageMenubar.jsp"/>
			<div class="myContent">
				<div class="titleSection">
					<h3>스크랩</h3>
					<ul class="list">
						<li>회원님께서 스크랩하신 공고를 모아둔 곳입니다.</li>
					</ul>
				</div>
				<div class="mySection">
					<div id="primaryContent">
						<div id="list_area_wrap">
							<div id="list_area">
								<button class="listBtn selList">공모전</button>
								<button class="listBtn">채용공고</button>
								<button class="listBtn">자격증</button>
							</div>
						</div>
						<table id="bList">
							<tr>
								<th></th>
								<th nowrap="nowrap">제목</th>
								<th nowrap="nowrap">글쓴이</th>
								<th nowrap="nowrap">작성일</th>
								<th nowrap="nowrap">조회</th>
							</tr>
							<c:forEach begin="1" end="10" var="i">
								<tr>
									<td class="num">${ i }</td>
									<td class="title"><a href="#">${ i }번째 글</a></td>
									<td class="writer">홍길동</td>
									<td class="date">2019-08-17</td>
									<td class="count">${ i }</td>
								</tr>
							</c:forEach>
						</table>
						<!-- end bList -->
						<div id="paging">
							<span id="num_prev">
								<span class="arrow txt">◀</span>
								<span class="txt">이전</span>
							</span>
							<c:forEach begin="1" end="10" var="i">
								<c:if test="${ i eq 1}">
								<a href="#" class="pagingNum b">${ i }</a>
								</c:if>
								<c:if test="${ i ne 1}">
								<a href="#" class="pagingNum">${ i }</a>
								</c:if>
							</c:forEach>
							<span id="num_next">
								<span class="arrow txt">▶</span>
								<span class="txt">다음</span>
							</span>
						</div>
						<!-- end paging -->
						<div id="search_row">
							<span id="search_box">
								<input type="text" id="searchBar">
								<span id="searchLbl">
									<span id="step_txt"></span>
								</span>
							<button id="after"></button>
							</span>
						</div>
						<!-- end search -->
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
	$('#searchBar').on('focus', function(){
		$('#search_box').css('box-shadow','0px 3px 10px -8px');
	});
	$('#searchBar').on('blur', function(){
		$('#search_box').css('box-shadow','');
	});
</script>
</body>
</html>