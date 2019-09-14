<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${ contextPath }/resources/css/mainView/activity.css">

<title>Insert title here</title>
<style>
	#updateComp, button {
  	background-color: #003458;
  	color: white;
  	padding: 12px 20px;
  	border: none;
  	border-radius: 20px;
  	cursor: pointer;
  	float: none;
	}

	#updateComp:hover, button:hover{
  	background-color: white;
 	 color: black;
 	 box-shadow: 0 0 9px 3px #003458;
 	 border-radius:20px;
	}
</style>
</head>
<body>
<c:import url="../common/menubar.jsp"/>
	<form action="updateCompetitionView.do?cId=${ competition.cId }" name="cWrite" id="cWrite">
	<div id="introduce">
		<section class="title" style="top: -170px; transform: none;">
	    <div class="wrap">
	    	<input type="hidden" name="cId" value="${ competition.cId }">
	      <p class="badges"><span>공모전</span></p>
	      <figure style="background-image: url('${ contextPath }/resources/compeloadFiles/${ cAttachment.changeName }');"></figure>
	      <div class="content">
	        <h1>${ competition.cTitle }</h1>
	        <p class="company">${ competition.cWriter }</p>
	        <p class="info"><span class="viewcount">${ competition.cCount }</span></p>
	        <c:if test="${ competition.cWriter == loginUser.nickName }">
	        	<p class="company"><button id="updateComp">수정하기</button><button onclick="deleteComp();">삭제하기</button></p> 
	        </c:if>
	      </div>
	    </div>
	  </section>
	  
	  <section class="tab" style="top: 0px; transform: none;">
	    <div class="wrap">
	      <a href="#" class="active"><span class="text">소개</span></a>
	      <a href="#" data-menu="comment"><span class="text">댓글</span><span class="commentcount count">0</span></a>
	    </div>
	  </section>
	  
	  <div id="container" data-target="1" data-target-path="contest" data-id="6119" data-menu="" style="padding-top: 0px;">
	  	<div class="section">
	  		<h2>공모전 기간</h2>
			
	  		<p class="dday">${ competition.cStartDate } ~ ${ competition.cDueDate }</p>
	  	</div>
	  	<div class="section">
	  		<h2>상세내용</h2>
	  		<textarea rows="5" cols="120" readonly="readonly" style="resize: none; border: none;">${ competition.cContent }</textarea>
	  	</div>
	  	<div class="poster">
	  		<img src="${ contextPath }/resources/compeloadFiles/${ cAttachment.changeName }">
	  	</div>
	  	<div class="bottombar">
	  		<a class="scrap">
	  			<span>스크랩</span>
	  		</a>
	  	</div>
	  </div>
  </div>
  </form>
  <script>
  	function deleteComp(){
  		var bool = confirm("정말로 삭제하시겠습니까?");
		if(bool){
			$('#cWrite').attr("action", "delectCompetition.do?cId=${competition.cId}");
			$('#cWrite').submit();
		}
  	}
  </script>
  
 

<!-- 푸터  -->
<c:import url="../common/footer.jsp"/>
<!-- /푸터 -->
</body>
</html>