<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITPLANET</title>
<link rel="stylesheet" href="${contextPath}/resources/css/member/myPageScrapView-style.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/mypageCommon-style.css" type="text/css">
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
				<div id="breadcrumb">
					<a href="/">HOME</a> > 
					<a href="mypage.do">MY PAGE</a> > MY SCRAP > 
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
							<div id="list_area_lft">
								<input type="checkbox" id="checkAll"><label for="checkAll"> 전체 선택</label>	
								<c:url var="deleteScrap" value="deleteScrap.do">
									<c:param name="type" value="${ type }"/>
									<c:param name="keyword" value="${ keyword }"/>
									<c:param name="page" value="${ pi.currentPage }"/>
								</c:url>						
								<button class="dltBtn">삭제하기</button>
							</div>
							<div id="list_area_rgt">
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
								<th></th>
								<th nowrap="nowrap">제목</th>
								<th nowrap="nowrap">글쓴이</th>
								<th nowrap="nowrap">작성일</th>
								<!-- <th nowrap="nowrap">조회</th> -->
							</tr>
							<c:forEach var="i" items="${ list }" varStatus="status">
								<tr>
									<td class="num">
										<input type="hidden" value="${ i.SID }" id="sid${ status.count }">
										<input type="checkbox" id="check${ status.count }">
									</td>
									<td class="num">
										${ status.count }
									</td>
									<td class="title"><a href="#">${ i.TITLE }</a></td>
									<td class="writer">${ i.WRITER }</td>
									<td class="date">${ i.MODIFYDATE }</td>
<%-- 									<c:if test="${ !empty i.COUNT }">
										<td class="count">${ i.COUNT }</td>
									</c:if> --%>
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
									<c:param name="keyword" value="${ keyword }"/>
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
										<c:param name="keyword" value="${ keyword }"/>
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
									<c:param name="keyword" value="${ keyword }"/>
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
	// 검색칸 포커스 / 블러에 따른 css
	$('#searchBar').on('focus', function(){
		$('#search_box').css('box-shadow','0px 3px 10px -8px');
	});
	$('#searchBar').on('blur', function(){
		$('#search_box').css('box-shadow','');
	});
	
	// 메뉴바 상위 메뉴 열려있게
	$('.navContent .navCt_title').eq(1).next().toggle();
	
	// 검색 결과 처리
	var submit1 = false;
	var submit2 = false;
	var keyword = null;
	var typeStr = "${type}";
	var type = 0;
	if(typeStr == "공모전"){
		type= 1;
	}else if(typeStr == "채용공고"){
		type= 2;
	}else if(typeStr == "자격증"){
		type= 3;
	}
	$('#searchBar').on('keypress', function(key){
		if(key.keyCode==13) submit();
	});
	$('#after').on('click', function(){
		submit();
	});
	function submit(){
		keyword = $('#searchBar').val();
		location.href = "myPageScrapView.do?keyword="+keyword+"&type="+type;
	}
	
	// 스크랩 삭제
	// 체크박스 전체선택
	$('#list_area_wrap input').on('click', function(){
		if($(this).is(':checked')) $('#bList input[type=checkbox]').prop('checked', true);
		else $('#bList input[type=checkbox]').prop('checked', false);
	});
	// 삭제
  	$('.dltBtn').on('click', function(){
		var list = "";
		var listSize = ${list.size()};
		for(var i = 1; i <= listSize; i++ ){
			if($('#check'+i).is(':checked')){
				if(i != listSize){
					list += $('#sid'+i).val();
					list += "/";
				} else{
					list += $('#sid'+i).val();					
				}
			}
		}
		
		if(list != ""){
			location.href = "${deleteScrap}&list="+list;
/* 			var aa = "${deleteScrap}&list="+list;
			console.log("123: " + aa); */
		}
		
	}); 
</script>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>