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
	
	#cpCheck {
	   margin-left: 90%;
	   position: absolute;
	    top: 3.5rem;
	    right: 6rem;
	}
	
	.topList thead {
	   background: #003458;
	    opacity: 0.9;
	   color: #FFFFFF;
	}
</style>
</head>
<body>
   
   <c:import url="../common/menubar.jsp"/>
   
   <!-- iframe -->
  <div class="box">
       <div class="container">
       <h2 style="margin-right:400px; margin-left: 50px;">오답률 리스트</h2><h2>정답률 리스트</h2>
       	 <div>
          <table class="table table-hover responsive-table topList" id="lowList" style="width:40%; float:left; margin-right: 70px; margin-left: 50px;">
             <colgroup>
               <col width="30%" />
               <col width="15%" />
               <col width="10%" />
               <col width="15%" />      
            </colgroup>
             <thead>
                <tr>
                   <th>문제 제목</th>
                   <th>맞은 사람</th>
                   <th>제출</th>
                   <th>정답 비율</th>
                </tr>
             </thead>
          
             <tbody>
                <tr>
                   <td>456</td>
                   <td style="text-align:center;">789</td>
                   <td style="text-align:center;">456</td>
                   <td style="text-align:center;">156</td>
                </tr>
             </tbody>
          </table>
		 </div>
		 
		 <div>
          <table class="table table-hover responsive-table topList" id="topList" style="width:40%; float:rigth;">
             <colgroup>
               <col width="30%" />
               <col width="15%" />
               <col width="15%" />
               <col width="15%" />      
            </colgroup>
             <thead>
                <tr>
                   <th>문제 제목</th>
                   <th>맞은 사람</th>
                   <th>제출</th>
                   <th>정답 비율</th>
                </tr>
             </thead>
          
             <tbody>
                <tr>
                   <td>456</td>
                   <td style="text-align:center;">789</td>
                   <td style="text-align:center;">456</td>
                   <td style="text-align:center;">156</td>
                </tr>
             </tbody>
          </table>
       </div>
       </div>
   </div>

   
   <div class="box">
    <div class="container">
    	<c:if test="${ loginUser.nickName == '관리자' }">
    	<a href="javascript:location.href='insertCT.do'">문제 작성</a>
    	</c:if>
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
		                      <input type="hidden" name="qNum" value="${ ctList.qNum }">
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
	
	function lowList(){
		$.ajax({
			url: "lowCoding.do",
			dataType: "json",
			success: function(data){
				$tableBody = $("#lowList tbody");
				$tableBody.html("");
				
				for(var i in data){
					var $tr = $("<tr>");
					var $title = $("<td>").text(decodeURIComponent(data[i].qTtitle.replace(/\+/g, " ")));
					var $success = $("<td style='text-align:center;'>").text(data[i].correctNum);
					var $total = $("<td style='text-align:center;'>").text(data[i].submitNum);
					var $per = $("<td style='text-align:center;'>").text(data[i].correctPer + "%");
					
					$tr.append($title);
					$tr.append($success);
					$tr.append($total);
					$tr.append($per);
					
					$tableBody.append($tr);
				}
			}
		});
	}
	
	function topList(){
		$.ajax({
			url: "topCoding.do",
			dataType: "json",
			success: function(data){
				$tableBody = $("#topList tbody");
				$tableBody.html("");
				
				for(var i in data){
					var $tr = $("<tr>");
					var $title = $("<td>").text(decodeURIComponent(data[i].qTtitle.replace(/\+/g, " ")));
					var $success = $("<td style='text-align:center;'>").text(data[i].correctNum);
					var $total = $("<td style='text-align:center;'>").text(data[i].submitNum);
					var $per = $("<td style='text-align:center;'>").text(data[i].correctPer + "%");
					
					$tr.append($title);
					$tr.append($success);
					$tr.append($total);
					$tr.append($per);
					
					$tableBody.append($tr);
				}
			}
		});
	}
	
	
	$(function(){
		<c:forEach items="${ cpList }" var="cpList">
	        <c:if test="${ cpList.qPass == 'O' }">
	           $('input[value=${cpList.qNum}]').parent().append("<i class='fas fa-check' id='cpCheck'>");
	        </c:if>
	     </c:forEach>
	     
	     lowList();
	     topList();
	     setInterval(function(){
			topList();
			lowList();
		}, 15000);
	  });
</script>
<c:import url="../common/footer.jsp"/>
</body>
</html>