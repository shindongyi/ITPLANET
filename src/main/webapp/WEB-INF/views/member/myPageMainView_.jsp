<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/myPage/myPageMainView_-style.css" type="text/css">
</head>
<body>
<div id="primaryContent">
	<div id="info_list">
		<a class="info_box change_pwd"></a>
		<a class="info_box change_info"></a>
	</div>
	<div id="scrap_list">
		<a class="scrap_box competition"></a>
		<a class="scrap_box hire"></a>
		<a class="scrap_box study"></a>
	</div>
</div>
<!-- end primaryContent -->
<script>
	$('.change_pwd').on('click', function(){
		$('#content').load('updatePwdForm.do');
	});
	$('.change_info').on('click', function(){
		$('#content').load('updateMemberForm.do');
	});
	$('.competition').on('click', function(){
		$('#content').load('myPageScrapView.do');
	});
	$('.hire').on('click', function(){
		$('#content').load('myPageScrapView.do');
	});
	$('.study').on('click', function(){
		$('#content').load('myPageScrapView.do');
	});
</script>
</body>
</html>