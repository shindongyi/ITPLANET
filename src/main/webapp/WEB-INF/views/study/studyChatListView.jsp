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
<link rel="stylesheet" href="${ contextPath }/resources/css/studyList.css">
<script src="https://kit.fontawesome.com/77f9f5360f.js"></script>
<title>ITPlanet StudyChat</title>
<style type="text/css">

	.fa-sms {
		display: block;
		width: 50px;
	    margin-inline-start: 330px;
	    font-size: 40px;
	    color: #003458;
	}
	
	#container p.info > span {
	    display: inline-block;
	    margin-right: 8px;
	    line-height: 18px;
	    color: black;
	    font-size: 15px;
	    letter-spacing: 0;
	    margin-left: 25px;
	    text-shadow:1px -5px 12px #0c1091;
	}
	
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div id="container" style="margin-left:150px; min-height:auto;">
		<br>
		
		<div class="list" style="width:169vh;">
		<h2 align="center">나의 스터디</h2>
		<br><br>
			<c:if test="${ !empty chatList }">
				<c:forEach items="${ chatList }" var="chatList">
					<div class="item">
						<a class="top" href="chatRoomView.do?chatName=${ chatList.chatRoom }">
							<i class="fas fa-sms"></i>
							<p class="company">${chatList.sCategory} - ${ chatList.sCaname }</p>
							<span class="hTitle">[스터디멤버] ${ chatList.chatMember }</span>
						</a>
						<hr>
						<p class="info">
							<span class="dday highlight">${ chatList.sTitle }</span>
						</p>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${ empty chatList }">
				<div style="text-align: center; margin-bottom: 40px;">
					<h2>스터디가 없습니다.</h2>
				</div>
			</c:if>
			
			<div align="center">
			<ul class="pagination justify-content-center">
				<c:if test="${ pi.currentPage <=1 }">
					<li class="page-item disabled"><a class="page-link" href="javascript:void(0);">Previous</a></li>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="chatListView.do">
						<c:param name="page" value="${ pi.currentPage -1 }"/>
					</c:url>
					<li class="page-item"><a class="page-link" href="${ before }">Previous</a></li>
				</c:if>
				<c:forEach var ="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<li class="page-item disabled"><a class="page-link" href="javascript:void(0);">${ p }</a></li>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="chatListView.do">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<li class="page-item"><a class="page-link" href="${ pagination }">${ p }</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					 <li class="page-item disabled"><a class="page-link" href="javascript:void(0);">Next</a></li>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="next" value="chatListView.do">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					 <li class="page-item"><a class="page-link" href="${ next }">Next</a></li>
				</c:if>
			 </ul>
		</div>
			
		</div>
		
	</div>
	<c:import url="../common/footer.jsp"/>
	
	
	<script src='${ contextPath }/resources/js/bootstrap.js'></script>

</body>
</html>