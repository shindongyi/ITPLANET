<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<select id="search" style="width:90px;">
					<option value="1">자격증</option>
					<option value="2">공모전</option>
				</select>
			</div>
			<table class="table" id="listArea">
				<tr style="background:#003458; color:white;">
					<th width="100px">No</th>
					<th width="200px">스터디종류</th>
					<th width="300px">제목</th>
					<th width="100px">스터디현황</th>
					<th width="100px">지역</th>
					<th width="60px">조회</th>
					<th width="100px">작성자</th>
					<th width="100px">작성일</th>
				</tr>
				
				<% for(int i=0; i< 10; i++){ %>
				<tr>
					<td><%= 10-i %></td>
					<td>자격증-정처기</td>
					<td>정처기따요</td>
					<td>3/5</td>
					<td>서울 강서구</td>
					<td>10</td>
					<td>김개똥</td>
					<td>2019-08-13</td>
				</tr>
				<% }%>

			</table>
		</div>
	
		<div class="pagingArea" align="center">
			<%-- <% if(!list.isEmpty()){ %>
				<button onclick="location.href='<%= request.getContextPath() %>/list.to?currentPage=1'">&lt;&lt;</button> &nbsp;
				<button id="beforeBtn" onclick="location.href='<%= request.getContextPath() %>/list.to?currentPage='">&lt;</button>&nbsp;
				<script>
					if(<%= currentPage %> <= 1){
						$('#beforeBtn').attr("disabled", "true");
					}
				</script>
				<!-- 10개의 페이지 목록 -->
				<% for(int p = startPage; p <= endPage; p++){%>
					<% if(p == currentPage){%>
						<button id="choosen" disabled><%= p %></button>&nbsp;
					<% }else{ %>
						<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.to?currentPage=<%= p %>'"><%= p %></button>&nbsp;
					<% } %>
				<% } %>

				<button id="afterBtn" onclick="location.href='<%= request.getContextPath() %>/list.to?currentPage='">&gt;</button>&nbsp;
				<button onclick="location.href='<%= request.getContextPath() %>/list.to?currentPage='">&gt;&gt;</button>&nbsp;
				<script>
					if(<%= currentPage %> >= <%=endPage%>){
						$('#afterBtn').attr("disabled", "true");
					}
				</script>
			<% } %> --%>
			<button onclick="">&lt;&lt;</button> &nbsp;
			<button id="beforeBtn" onclick="">&lt;</button>&nbsp;
			<% for(int i=1; i<=10; i++){ %>
				<button id="numBtn" onclick=""><%= i %></button>&nbsp;
			<% } %>
			<button id="afterBtn" onclick="">&gt;</button>&nbsp;
			<button onclick="">&gt;&gt;</button>&nbsp;
			
			<div class="searchArea" align="right">
				<input type="button" value="모집하기">
			</div>
		</div>
		
		
	</div>
	
	<script>
		ns(function(){
			ns('#listArea td').mouseenter(function(){
				ns(this).parent().css({'color':'white', 'cursor':'pointer', 'background-image': 'linear-gradient(to right, #003458, white)'});
			}).mouseout(function(){
				ns(this).parent().css({'background':'none', 'color':'black'});
			}).click(function(){
				var tcode = $(this).parent().children().children('input').val();
			});
		});
	</script>
	
	
</body>
</html>