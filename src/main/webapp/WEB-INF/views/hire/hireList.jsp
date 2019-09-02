<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용 정보 목록</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/hire/hireList.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/77f9f5360f.js"></script>
</head>
<body>
	<div class="header">
		
	</div>


	<div id="container" class="container-fluid  center-block">
		
		<div class="search-box">
			<input class="search-txt" type="text" name="" placeholder="Type to search" >
			<a class="search-btn" href="#">
				<i class="fas fa-search"></i>
			</a>
		</div>
		
		<div class="filter">
			<select class="form-control" >
				<option value="직무">직무</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
			</select>
			<select class="form-control" >
				<option value="지역">지역</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
			</select>
			<select class="form-control">
				<option value="학력">학력</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
			</select>
			<select class="form-control">
				<option value="경력">경력</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
			</select>
			<select class="form-control">
				<option value="근무형태">근무형태</option>
				<option>신입</option>
				<option>경력</option>
			</select>
		</div>
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
	</div>
	
	<script>
		
	</script>
	
</body>
</html>