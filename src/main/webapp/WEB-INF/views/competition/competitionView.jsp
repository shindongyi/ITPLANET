<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href="${ contextPath }/resources/css/bootstrap.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="${contextPath }/resources/css/mainView/competiton.css">
<title>Insert title here</title>
<style>
	input[type=button]{
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
	
	.pagination *{
		font-size:medium;
	}
	
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div id="container" data-target="1" data-target-name="공모전"
		data-target-path="contest" data-category="" data-keyword=""
		style="padding-top: 0px;">
		<div class="horizontal">
			<h2>인기 공모전</h2>
			<div class="items" style="border: 1px solid black; padding-top: 7px;">
				<c:forEach var="top" items="${ topCompetition }" begin="0" end="4">
					<a class="item" href="competitionDetail.do?cId=${ top.cId }">
						<c:forEach var="ima" items="${ cattachmentList }">
							<c:if test="${ ima.cId == top.cId }">
								<figure style="background-image: url('${ contextPath }/resources/compeloadFiles/${ima.changeName }')"></figure>
							</c:if>
						</c:forEach>
						<h3>${ top.cTitle }</h3>
						<p class="info">
							<span class="dday highlight">${ top.cStartDate } ~ ${ top.cDueDate }</span><br>
							<span class="viewcount">조회수 : ${ top.cCount }</span>
						</p>
						
					</a>
				</c:forEach>
				
			</div>
		</div>
		
		<div class="list" style="width: 1000px;">
		
			<c:forEach items="${ competitionList }" var="cList">
				<div class="item" style="border: 1px solid #a8a8a8;">
					<a class="top" href="competitionDetail.do?cId=${ cList.cId }">
						<c:forEach var="ima" items="${ cattachmentList }">
							<c:if test="${ ima.cId == cList.cId }">
								<figure style="background-image: url('${ contextPath }/resources/compeloadFiles/${ima.changeName }')"></figure>
							</c:if>
						</c:forEach>
						<p class="badges">
							<span>공모전</span>
						</p>
						<h2>${ cList.cTitle }</h2>
						<p style="height:30px; font-size:small;"><span>${ cList.cWriter }</span></p>
						<p class="info">
							<span class="dday highlight">${ cList.cStartDate } ~ ${ cList.cDueDate }</span>
							<span class="viewcount">${ cList.cCount }</span>
						</p>
						<hr>
					</a>
					<div class="bottom">
						<a href="/contest/view?id=5996">
							<span class="text">상세</span>
						</a>
						<a href="/contest/view?id=5996&amp;menu=team">
							<span class="text">스터디 모집</span>
						</a>
					</div>
				</div>			
			</c:forEach>
		</div>
		<div align="center">
			<ul class="pagination justify-content-center">
				<c:if test="${ pi.currentPage <=1 }">
					<li class="page-item disabled"><a class="page-link" href="javascript:void(0);">Previous</a></li>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="competitionView.do">
						<c:param name="page" value="${ pi.currentPage -1 }"/>
					</c:url>
					<li class="page-item"><a class="page-link" href="${ before }">Previous</a></li>
				</c:if>
				<c:forEach var ="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<li class="page-item disabled"><a class="page-link" href="javascript:void(0);">${ p }</a></li>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="competitionView.do">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<li class="page-item"><a class="page-link" href="${ pagination }">${ p }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					 <li class="page-item disabled"><a class="page-link" href="javascript:void(0);">Next</a></li>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="next" value="competitionView.do">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					 <li class="page-item"><a class="page-link" href="${ next }">Next</a></li>
				</c:if>
			 </ul>
			 
			 <c:if test="${ loginUser != null }">
				<div style="text-align: right;">
					<input type="button" value="공모전 작성" onclick="javascript:location.href='competitionInsertView.do'" style="font-size:medium;">
				</div>
			</c:if>
		</div>
	</div>
	
<!-- 푸터  -->
 <c:import url="../common/footer.jsp"/>
<!-- /푸터 -->
</body>
</html>