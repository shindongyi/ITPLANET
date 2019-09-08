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
					<a href="mypage.do">MY PAGE</a>
				</h2>
				<div id="breadcrumb">
					<a href="#">HOME</a> > 
					<a href="myPage.do">MY PAGE</a> > MY SCRAP > 
						<strong>${ type }</strong>
				</div>
			</div>
			<div id="mypageMain">
			<c:import url="/WEB-INF/views/member/mypageMenubar.jsp"/>
			<div class="myContent">
				<div class="titleSection">
					<h3>스크랩</h3>
					<ul class="list">
						<li>회원님께서 스크랩하신 ${ type } 공고를 모아둔 곳입니다.</li>
					</ul>
				</div>
				<div class="mySection">
					<div id="primaryContent">
						<div id="list_area_wrap">
							<div id="list_area">
								<button class="listBtn">공모전</button>
								<button class="listBtn">채용공고</button>
								<button class="listBtn">자격증</button>
							</div>
							<script>
								var type = "${ typeNum }";
								$('.listBtn').eq(type-1).attr('class','listBtn selList');
								$('.listBtn').on('click', function(){
									var type = $(this).index()+1;
									location.href="myPageScrapView.do?type="+type;
								});
							</script>
						</div>
						<table id="bList">
							<tr>
								<th></th>
								<th nowrap="nowrap">제목</th>
								<th nowrap="nowrap">글쓴이</th>
								<th nowrap="nowrap">작성일</th>
								<th nowrap="nowrap">조회</th>
							</tr>
							<c:forEach var="i" items="${ list }">
								<tr>
									<td class="num">${ 0 }</td>
									<td class="title"><a href="#">${ i.TITLE }</a></td>
									<td class="writer">${ i.WRITER }</td>
									<td class="date">${ i.MODIFYDATE }</td>
									<c:if test="${ !empty i.COUNT }">
										<td class="count">${ i.COUNT }</td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
						<!-- end bList -->
						<div id="paging">
							<!-- 이전페이지 -->
							<c:if test="${ pi.currentPage <= 1 }">
								<span id="num_prev">
									<!-- <span class="arrow txt">◀</span>
									<span class="txt">이전</span> -->
									<a class="arrow txt">◀ 이전</a>
								</span>
							</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="before" value="myPageScrapView.do">
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
									<c:param name="type" value="${ typeNum }"/>
								</c:url>
								<span id="num_prev">
									<a class="arrow txt" href="${ before }">◀ 이전</a>
								</span>
							</c:if>
							
							<!-- 페이지 -->
							<c:forEach var="i" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ i eq pi.currentPage}">
									<a class="pagingNum b">${ i }</a>
								</c:if>
								<c:if test="${ i ne pi.currentPage}">
									<c:url var="pagination" value="myPageScrapView.do">
										<c:param name="page" value="${ i }"/>
										<c:param name="type" value="${ typeNum }"/>
									</c:url>
									<a href="${ pagination }" class="pagingNum">${ i }</a>
								</c:if>
							</c:forEach>
							
							<!-- 다음 -->
							<c:if test="${ pi.currentPage >= pi.maxPage }">
								<a class="arrow txt">다음 ▶</a>
							</c:if>
							
							<c:if test="${pi.currentPage < pi.maxPage }">
								<c:url var="after" value="myPageScrapView.do">
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
									<c:param name="type" value="${ typeNum }"/>
								</c:url> 
								<a class="arrow txt" href="${ after }">다음 ▶</a>
							</c:if>
						<!--<span id="num_next">
								<span class="arrow txt">▶</span>
								<span class="txt">다음</span>
							</span> -->
						</div>
						<!-- end paging -->
						<div id="search_row">
							<span id="search_box">
								<input type="text" id="searchBar">
								<span id="searchLbl">
									<span id="step_txt"></span>
								</span>
							<button id="after"><i class="fas fa-search"></i></button>
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
	$('.navContent .navCt_title').eq(1).next().toggle();
</script>
</body>
</html>