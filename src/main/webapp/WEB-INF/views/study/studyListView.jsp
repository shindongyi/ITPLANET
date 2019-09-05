<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script src="${ contextPath }/resources/js/select2.min.js"></script>
<link rel='stylesheet' href="${ contextPath }/resources/css/bootstrap.css">
<link href="${ contextPath }/resources/css/select2.min.css" rel="stylesheet"/>
<script>
		var ns = $.noConflict(true);
		ns(document).ready(function() {
	   		 ns('#search').select2();
		});
		
		function clearResult(){
			$("#result1").val("x");
			$("#result2").val('x');
			$("#result3").val('x');
			$("#result4").val('x');
			$("#result5").val('x');
		}
		
		function addSe(){
			if($("#search").val() == "-------"){
				alert("카테고리를 선택하세요");
			}else if($("#searchText").val() == ""){
				alert("검색내용을 입력하셔야 추가하실수 있습니다.")
			}else{
				$("#result1").val($("#search").val());
				$("#result2").val($("#searchText").val());
				
				$("#searchText").val("");

			}
		}
		
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
	
	input[type=button],input[type=submit], #succ{
	  background-color: #003458;
	  color: white;
	  padding: 12px 20px;
	  border: none;
	  border-radius: 20px;
	  cursor: pointer;
	  float: none;
	}
	
	input[type=button]:hover, input[type=submit]:hover, #succ:hover{
	  background-color: white;
	  color: black;
	  box-shadow: 0 0 9px 3px #003458;
	  border-radius:20px;
	}
	
	input[name=search] {
	  width: 130px;
	  box-sizing: border-box;
	  border: 2px solid #ccc;
	  border-radius: 4px;
	  font-size: 16px;
	  background-color: white;
	  background-image: url('${contextPath}/resources/images/search.png');
	  background-size: 2em;
	  background-position: 10px 10px; 
	  background-repeat: no-repeat;
	  padding: 12px 20px 12px 40px;
	  -webkit-transition: width 0.4s ease-in-out;
	  transition: width 0.4s ease-in-out;
	}
	
	input[name=search]:focus {
	  width: 80%;
	}
	
	.searchResult{
		border-top: none;
		border-left: none;
		border-right: none;
	}
	
	
</style>
</head>
<body>

	<div class="outer align-content-center">
		<br>
		<h2 align="center">스터디</h2>
		<br><br>
		
		<div class="container">
			<button type="button" class="btn btn-primary btn-block" id="searchBtn">검색</button>
			<br>
		  <ul class="nav nav-tabs" role="tablist" id="searchCategory" style="display: none;">
		    <li class="nav-item">
		      <a class="nav-link active" data-toggle="tab" href="#menu1">검색어 이용</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="tab" href="#menu2">공모전</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="tab" href="#menu3">자격증</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link" data-toggle="tab" href="#menu4">지역</a>
		    </li>
		  </ul>
		
		  <div class="tab-content" id="searchCategoryDe" style="display: none;">
		    <div id="menu1" class="container tab-pane active"><br>
		    	<div>
		    	<select id="search" style="width: 100px;">
		    		<option>-------</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
				</select>
		      	<input type="text" name="search" placeholder="Search.." id="searchText">
		      	<button id="succ" style="width:100px; height:40px;" onclick="addSe();">추가</button>
		      	</div>
		    </div>
		    <div id="menu2" class="container tab-pane fade"><br>
		      	 <ul class="list-group list-group-horizontal list-group-flush">
				 <li class="list-group-item" style="border-top:none; border-bottom:none;"><a href="#" class="list-group-item list-group-item-action">First item</a></li>
				 <li class="list-group-item" style="border-top:none; border-bottom:none;"><a href="#" class="list-group-item list-group-item-action">Second item</a></li>
				 <li class="list-group-item" style="border-top:none; border-bottom:none;"><a href="#" class="list-group-item list-group-item-action">Third item</a></li>
				 <li class="list-group-item" style="border-top:none; border-bottom:none;"><a href="#" class="list-group-item list-group-item-action">Fourth item</a></li>
				 <li class="list-group-item" style="border-top:none; border-bottom:none;"><a href="#" class="list-group-item list-group-item-action">First item</a></li>
				</ul>
		    </div>
		    <div id="menu3" class="container tab-pane fade"><br>
		       <ul class="list-group list-group-horizontal list-group-flush">
				 <li class="list-group-item" style="border-top:none; border-bottom:none;"><a href="#" class="list-group-item list-group-item-action">First item</a></li>
				 <li class="list-group-item" style="border-top:none; border-bottom:none;"><a href="#" class="list-group-item list-group-item-action">Second item</a></li>
				 <li class="list-group-item" style="border-top:none; border-bottom:none;"><a href="#" class="list-group-item list-group-item-action">Third item</a></li>
				 <li class="list-group-item" style="border-top:none; border-bottom:none;"><a href="#" class="list-group-item list-group-item-action">Fourth item</a></li>
				 <li class="list-group-item" style="border-top:none; border-bottom:none;"><a href="#" class="list-group-item list-group-item-action">First item</a></li>
				</ul>
		    </div>
		    <div id="menu4" class="container tab-pane fade" style="overflow-x:hidden; overflow-y:scroll; height:200px;"><br>
		    	<c:forEach items="${ local }" var="lo" varStatus="sta">
		    		<c:if test="${ (sta.index +1) mod 7 eq 1}">
		    			<ul class="list-group list-group-horizontal list-group-flush">
		    			<li class="list-group-item" style="border-top:none; border-bottom:none;"><span class="list-group-item list-group-item-action">${ lo.lName }</span></li>
		    		</c:if>
		    		<c:if test="${ (sta.index +1) mod 7 ne 1 && (sta.index +1) mod 7 ne 0 }">
		    			<li class="list-group-item" style="border-top:none; border-bottom:none;"><span class="list-group-item list-group-item-action">${ lo.lName }</span></li>
		    		</c:if>
		    		<c:if test="${ (sta.index +1) % 7 eq 0}">
		    			 <li class="list-group-item" style="border-top:none; border-bottom:none;"><span class="list-group-item list-group-item-action">${ lo.lName }</span></li>
		    			 </ul>
		    		</c:if>
		    	</c:forEach>
		    </div>
		  </div>
		  <br>
		  
		  <div align="center">
		  	<form action="searchStudyResult.do" name="writer">
		  		<input type="hidden" value="x" id="result1" name="result1"><!-- 검색어 조건 -->
		  		<input type="text" class="searchResult" value="x" id="result2" name="result2" readonly><!-- 검색 내용 -->
			  	<input type="text" class="searchResult" value="x" id="result3" name="result3" readonly><!-- 자격증/공모전 -->
			  	<input type="text" class="searchResult" value="x" id="result4" name="result4" readonly><!-- 상세 -->
			  	<input type="text" class="searchResult" value="x" id="result5" name="result5" readonly><!-- 지역 -->
			  	<input type="submit" value="검색" style="width:100px; height:40px;">
			  	<input type="button" value="초기화" style="width:100px; height:40px;" onclick="clearResult();">
		  	</form>
		  </div>
		</div>
		<br>
		
		<div class="tableArea">
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
		
		$(document).ready(function(){
			$("#searchBtn").click(function(){
				$("#searchCategory").slideToggle("slow");
				$("#searchCategoryDe").slideToggle("slow");
			});
			
			$("#menu4 span").click(function(){
				$("#result5").val($(this).text());
			});
		});
		
	</script>
	
	
</body>
</html>