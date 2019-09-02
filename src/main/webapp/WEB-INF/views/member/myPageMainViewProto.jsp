<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/myPageMenuBar-style.css" type="text/css">
</head>
<body>
<div id="wrap">
	<div id="container">
		<div id="myPageMenu">
			<div id="menuTitle"> 
				<span>마이페이지</span>
			</div>
			<div class="menu_box">
				<img id="arrow" src="../image/down-arrow.png">
				<span class="menu myInfo">내 정보</span>
				<ul id="myInfo_next_ul">
					<li>
						<a href="#">내 정보 관리</a>
					</li>
					<li>
						<a href="#">비밀번호변경</a>
					</li>
				</ul>
			</div>
			<div class="menu_box">
				<span class="menu scrap"><a href="#">스크랩</a></span>
			</div>
		</div>
		<!-- end myPageMenu -->
		<div id="content">
			<div id="primaryContent">
				<div id="list_area_wrap">
					<div id="list_area">
						<button class="listBtn selList">공모전</button>
						<button class="listBtn">채용공고</button>
						<button class="listBtn">스터디</button>
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
		</div>
		<!-- end content -->
	</div>
	<!-- end container -->
</div>
<!-- end wrap -->
<script>
	$('#searchBar').on('focus', function(){
		$('#search_box').css('box-shadow','0px 3px 10px -8px');
	});
	$('#searchBar').on('blur', function(){
		$('#search_box').css('box-shadow','');
	});
	$('.myInfo').on('click', function(){
		console.log(event.target);
		$(event.target).next().toggle();
		
		if($('#myInfo_next_ul').css('display') == 'none'){
			console.log(1);
			$('#arrow').attr('src','../image/right-arrow.png');
		} else{
			$('#arrow').attr('src','../image/down-arrow.png');
			console.log(2);
		}
	});
</script>
</body>
</html>