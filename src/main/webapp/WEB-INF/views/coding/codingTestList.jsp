<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>코딩테스트 목록</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/coding/codingTestList.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/77f9f5360f.js"></script>
<style>
	.question{
		cursor: pointer;
	}
	.question:hover{
		background: #a3a3cc24;
	}
</style>
</head>
<body>
   
   <c:import url="../common/menubar.jsp"/>
   
   <!-- iframe -->
   <div class="pageFrame">
      <iframe id="pageFrame" name="pageFrame" src="http://www.jobkorea.co.kr/Starter/calendar/sub/week" frameborder="0" width="1000px" height="300px" scrolling="auto"></iframe>
   </div>
   
   <div class="box">
    <div class="container">
    	<a href="javascript:location.href='insertCT.do'">문제 작성</a>
    	
        <div class="row">
        	<c:if test="${ empty loginUser }">
        		<c:if test="${ ctList.isEmpty() }">
	        		<h2>등록된 문제가 없습니다.</h2>
	        	</c:if>
	          	<c:if test="${ !ctList.isEmpty() }">
	    			<c:forEach items="${ ctList }" var="ctList">
			    		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" onclick="notLogin();">
			               <div class="box-part  question">
		                      <i class="fab fa-java fa-2x" aria-hidden="true"></i>
			                  <div class="title">
			                     <h4>${ ctList.qTitle }</h4>
			                  </div>
			                  <div class="text">
			                     <span>${ ctList.qContent }</span>
			                  </div>
			                </div>
			            </div>    
	    			</c:forEach>
	    		</c:if>
        	</c:if>
        
        	<c:if test="${ !empty loginUser }">
        		<c:if test="${ ctList.isEmpty() }">
	        		<h2>등록된 문제가 없습니다.</h2>
	        	</c:if>
	          	<c:if test="${ !ctList.isEmpty() }">
	    			<c:forEach items="${ ctList }" var="ctList">
			    		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12" onclick="javascript:location.href='codingTestView.do?Qno=${ ctList.qNum}'">
			               <div class="box-part  question">
		                      <i class="fab fa-java fa-2x" aria-hidden="true"></i>
			                  <div class="title">
			                     <h4>${ ctList.qTitle }</h4>
			                  </div>
			                  <div class="text">
			                     <span>${ ctList.qContent }</span>
			                  </div>
			                </div>
			            </div>    
	    			</c:forEach>
	    		</c:if>
        	</c:if>
      </div>
    </div>
</div>

<script>
	function notLogin(){
		alert("로그인 후에 이용가능한 서비스입니다.");
	}
</script>
<c:import url="../common/footer.jsp"/>
</body>
</html>