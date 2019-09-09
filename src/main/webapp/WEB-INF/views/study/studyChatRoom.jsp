<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String tcode = request.getParameter("tcode");
	String cname = request.getParameter("cname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href="${ contextPath }/resources/css/bootstrap.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.outer{
		width: 1200px; height: auto;min-height:500px; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	}
	/* .tableArea{width:1200px; height:auto; margin-left:auto;	margin-right:auto; margin-bottom:15px;} */
	button:hover{cursor: pointer;}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<script>
		
		var tcode = <%= tcode %>;
		var cname = '<%= cname %>';
		var nickname = '${ loginUser.nickName }';
		
		$(document).ready(function() {
			window.addEventListener("message", sendChildMessage, false);
		});

		function processFn(event) {
			var bla = event.data;
		}

		function sendChildMessage() {	
			document.getElementById("iframe").contentWindow.postMessage([nickname,cname] , '*');
		}	
	</script>
	<div class="row align-content-center">
		<div class="col-md-3" style="max-width:20.85%;"></div>
		<div class="col-md-7">
			<br>
			<h2 class="text-center" style="font-family: 'Monotype Corsiva';">Welcom to Chatting Room</h2>
			<br><br>
			<div align="center">
				<iframe id="iframe" src="http://192.168.120.84:9708" style="width:600px; height:700px; margin-bottom: 50px; border-radius: 25px; border-style: groove;"></iframe>
			</div>
		
		</div>
		<div class="col-md-3" style="max-width:20.85%;"></div>
	</div>
	
	<c:import url="../common/footer.jsp"/>
	<script src='${ contextPath }/resources/js/bootstrap.js'></script>
</body>
</html>