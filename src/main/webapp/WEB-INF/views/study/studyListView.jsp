<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script src="${ contextPath }/resources/js/select2.min.js"></script>
<link rel='stylesheet' href="${ contextPath }/resources/css/bootstrap.css">
<link href="${ contextPath }/resources/css/select2.min.css" rel="stylesheet"/>
<script>
		var ns = $.noConflict(true);
		ns(document).ready(function() {
	   		 ns('#search').select2();
		});
</script>
<title>스터디 리스트</title>
<style>
	.outer{
		width: 1200px; height: auto;min-height:500px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	#listArea{text-align: center; margin:auto;}
	#listArea td{line-height: 43px;}
	
	.tableArea{width:1200px; height:auto; margin-left:auto;	margin-right:auto; margin-bottom:15px;}
	.pagingArea{margin-bottom:20px;}
	.pagingArea button{border-radius: 5px; background: white; width:auto;}
	.searchArea{margin-right: 50px;}
	.searchArea button{background: #D1B2FF; border-radius: 5px; color: white; width: 80px; heigth: 25px; text-align: center;}
	button:hover{cursor: pointer;}
	button:disabled{cursor: default;}
	
	input[type=button] {
	  background-color: #003458;
	  color: white;
	  padding: 12px 20px;
	  border: none;
	  border-radius: 20px;
	  cursor: pointer;
	  float: none;
	}
	
	input[type=button]:hover{
	  background-color: white;
	  color: black;
	  box-shadow: 0 0 9px 3px #003458;
	  border-radius:20px;
	}
	
</style>
</head>
<body>

	<div class="outer align-content-center">
		<br>
		<h2 align="center">스터디</h2>
		<br><br>
		<div class="tableArea">
			<div align="right">
			<!-- 검색 네이버 쇼핑 참고 -->
				<select id="search" name="search" style="width:90px;">
					<option value="0">검색</option>
					<option value="자격증">자격증</option>
					<option value="공모전">공모전</option>
				</select>
			</div>
			<table class="table" id="listArea">
				<thead>
					<tr style="background:#003458; color:white;">
						<th width="100px">No</th>
						<th width="200px">스터디종류</th>
						<th width="300px">제목</th>
						<th width="100px">스터디현황</th>
						<th width="150px">지역</th>
						<th width="60px">조회</th>
						<th width="100px">작성자</th>
						<th width="100px">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ !empty list }">
						<c:forEach var="li" items="${ list }">
							<tr>
								<td>${ li.sId }<input type="hidden" value="${ li.sId }"></td>
								<td>${ li.sCategory } - ${ li.sCaName }</td>
								<td>${ li.sTitle }</td>
								<td><c:forEach items="${fn:split(li.chatMember,',') }" var="cm" varStatus="status">
										<c:if test="${ status.last }">
											 ${status.index + 1 }
										</c:if>
									</c:forEach> / ${ li.sMember }</td>
								<td>${ li.lName}</td>
								<td>${ li.sCount }</td>
								<td>${ li.nickName }</td>
								<td>${ li.createDate }</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${ empty list }">
						<tr>
							<td colspan=8>등록된 게시글이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
				
			</table>
		</div>
	
		<div class="pagingArea" align="center">
			<!-- 처음으로 / 이전-->
			<c:if test="${ pi.currentPage <= 1 }">
				<button disabled>&lt;&lt;</button> &nbsp;
				<button disabled>&lt;</button> &nbsp;
			</c:if>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="first" value="studyListView.do">
					<c:param name="page" value="1"/>
				</c:url>
				<c:url var="before" value="studyListView.do">
					<c:param name="page" value="${ pi.currentPage -1 }"/>
				</c:url>
				<button onclick="javascript:location.href='${first}'">&lt;&lt;</button> &nbsp;
				<button onclick="javascript:location.href='${before}'">&lt;</button> &nbsp;
			</c:if>
			
			<!-- 페이징 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<button disabled="disabled">${ p }</button>&nbsp;
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="pagination" value="studyListView.do">
						<c:param name="page" value="${ p }"/>
					</c:url>
					<button onclick="javascript:location.href='${ pagination}'">${ p }</button>&nbsp;
				</c:if>
			</c:forEach>
			
			
			<!-- 다음 / 마지막 -->
			<c:if test="${ pi.currentPage >= pi.maxPage }">
				<button disabled>&gt;</button>&nbsp;
				<button disabled>&gt;&gt;</button>&nbsp;
			</c:if>
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="next" value="studyListView.do">
					<c:param name="page" value ="${ pi.currentPage +1 }"/>
				</c:url>
				<c:url var="last" value="studyListView.do">
					<c:param name="page" value="${pi.maxPage}"/>
				</c:url>
				<button onclick="javascript:location.href='${next}'">&gt;</button>&nbsp;
				<button onclick="javascript:location.href='${last}'">&gt;&gt;</button>&nbsp;
			</c:if>
			
			<c:if test="${ !empty sessionScope.loginUser }">
				<div class="searchArea" align="right">
					<input type="button" value="모집하기" onclick="javascript:location.href='studyInsertView.do';">
				</div>
			</c:if>
			
		</div>
		
		
	</div>
	
	<script>
		ns(function(){
			ns('#listArea td').mouseenter(function(){
				ns(this).parent().css({'color':'white', 'cursor':'pointer', 'background-image': 'linear-gradient(to right, #003458, white)'});
			}).mouseout(function(){
				ns(this).parent().css({'background':'none', 'color':'black'});
			}).click(function(){
				var sId = ns(this).parent().children().children('input').val();
				var logUser = '${loginUser}';
				 
				if(logUser != ''){
					location.href="studyDetail.do?sId="+sId;
				}else{
					alert("회원만 이용할 수 있는 서비스입니다.");
				}
				
			});
		});
	</script>
	
	
</body>
</html>