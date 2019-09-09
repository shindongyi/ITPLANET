<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href="${ contextPath }/resources/css/bootstrap.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="${ contextPath }/resources/css/hire/hireList.css">
<title>Insert title here</title>
<style type="text/css">
	/* .outer{
		width: 1200px; height: auto;min-height:500px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	#listArea{text-align: center; margin:auto;}
	table#listArea{background-color:white; box-shadow:-1px 8px 20px 0px #FF5E00;}
	#listArea td{line-height: 43px;}
	.tableArea{width:1200px; height:auto; margin-left:auto;	margin-right:auto; margin-bottom:15px;}
	.pagingArea{margin-bottom:20px;}
	.pagingArea button{border-radius: 5px; background: white; width:auto;}
	.searchArea{margin-right: 50px;}
	.searchArea button{background: #D1B2FF; border-radius: 5px; color: white; width: 80px; heigth: 25px; text-align: center;}
	button:hover{cursor: pointer;} */
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	<div class="outer align-content-center">
		<br>
		<h2 align="center">나의 스터디</h2>
		<br><br>
		
		<div class="list">
			<div class="item">
				<a class="top" href="#">
					<i class="far fa-bookmark"></i>
					<p class="company">서울문화재단</p>
					<span class="hTitle">[서울문화재단] 2019년 제3차 직원 공개 채용 </span>
				</a>
				<hr>
				<p class="info">
					<span class="dday highlight">D-3</span>
				</p>
			</div>
			<div class="item">
				<a class="top" href="#">
					<i class="far fa-bookmark"></i>
					<p class="company">서울문화재단</p>
					<span class="hTitle">[서울문화재단] 2019년 제3차 직원 공개 채용 </span>
				</a>
				<hr>
				<p class="info">
					<span class="dday highlight">D-3</span>
				</p>
			</div>
			<div class="item">
				<a class="top" href="#">
					<i class="fas fa-bookmark"></i>
					<p class="company">서울문화재단</p>
					<span class="hTitle">[서울문화재단] 2019년 제3차 직원 공개 채용 </span>
				</a>
				<hr>
				<p class="info">
					<span class="dday highlight">D-3</span>
				</p>
			</div>
			<div class="item">
				<a class="top" href="#">
					<i class="far fa-bookmark"></i>
					<p class="company">서울문화재단</p>
					<span class="hTitle">[서울문화재단] 2019년 제3차 직원 공개 채용 </span>
				</a>
				<hr>
				<p class="info">
					<span class="dday highlight">D-3</span>
				</p>
			</div>
		</div>
	
		<%-- <div class="pagingArea" align="center">
			<% if(!list.isEmpty()){ %>
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
			<% } %>
			
			
		</div> --%>
		
		
	</div>
	<c:import url="../common/footer.jsp"/>
	
	<script>
		$(function(){
			$('#listArea td').mouseenter(function(){
				$(this).parent().css({'background': 'rgba(38, 112, 251, 0.24)', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).parent().css('background', 'none');
			}).click(function(){
				var tcode = $(this).parent().children().children('#tcode').val();
				var cname= $(this).parent().children().children('#cname').val();
				location.href="<%= request.getContextPath() %>/views/chat/chatRoom.jsp?tcode="+tcode+"&cname="+cname;
			});
		});
	</script>
	<script src='${ contextPath }/resources/js/bootstrap.js'></script>

</body>
</html>