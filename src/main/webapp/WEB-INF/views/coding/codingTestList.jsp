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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/77f9f5360f.js"></script>
</head>
<body>
   
   <%@ include file="/WEB-INF/views/common/menubar.jsp" %>
   
   <!-- iframe -->
   <div class="pageFrame">
      <iframe id="pageFrame" name="pageFrame" src="http://www.jobkorea.co.kr/Starter/calendar/sub/week" frameborder="0" width="1000px" height="300px" scrolling="auto"></iframe>
   </div>
   
   <div class="box">
    <div class="container">
    	<a onclick="javascript:location.href='insertCT.do'">코딩테스트</a>
    	<c:if test="${ ctList.isEmpty() }">
    		
    	</c:if>
    	
        <div class="row">
          	<c:if test="${ !ctList.isEmpty() }">
    			<c:forEach items="${ ctList }" var="ctList">
		    			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
		               
		               <div class="box-part">
		                        
		                        
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
             
          
      </div>      
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>	    
</body>
</html>