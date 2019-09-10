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
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>


	<div id="container" class="container-fluid  center-block">
		
		<!-- <div class="search-box">
			<input class="search-txt" type="text" name="" placeholder="Type to search" >
			<a class="search-btn" href="#">
				<i class="fas fa-search"></i>
			</a>
		</div> -->
		
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
		<div class="list" id="hListBox">
			<div class="item">
				<a class="top" href="#">
					<i class="far fa-bookmark"></i>
					<p class="company">서울문화재단</p>
					<span class="hTitle">[서울문화재단] 2019년 제3차 직원 공개 채용 </span>
				</a>
				<ul id="desc">
					<li></li>
				</ul>
				<hr>
				<p class="info">
					<span class="dday highlight">D-3</span>
				</p>
			</div>
		</div>
	</div>
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>	    
	
	<script>
		$(document).ready(function(){
			$.ajax({
				url: "hJsonList.do",
				type: "POST",
				dataType: "json",
				success: function(data){
					$hListBox = $("#hListBox");
					$hListBox.html("");

					var $hr;
					var $item;
					
					var $name;
					var $title;
					var $href;
					var $location;
					var $industry;
					var $experience;
					var $required;
					var $expiration_date;
					var $salary;
					var $jobType;
					
					var $aTop;
					var $hScrap;
					var $desc;
					var $info;
					console.log(data);
					if(data.length > 0) {
						for(var i in data){
							$hr = $("<hr>");
							$hScrap = $("<i class='far fa-bookmark'>");
							$item = $("<div class='item'>");
							$aTop = $("<a class='top'>").attr("href",decodeURIComponent(data[i].href));
							$desc = $("<ul id='desc' style='list-style-type: none;'>");
							$info = $("<p class='info'>")
							
							$name = $("<p class='company'>").text(decodeURIComponent(data[i].name));
							$title = $("<span class='hTitle'>").text(decodeURIComponent(data[i].title));
							$location = $("<li>").text((decodeURIComponent(data[i].location)).replace(/[+&gt;+]/gi," "));
							// .replace('+&gt;+',' ').replace('+',' ').replace('&gt;',' ')
							$industry = $("<li>").text(decodeURIComponent(data[i].industry));
							$experience = $("<li>").text(decodeURIComponent(data[i].experience));
							$required = $("<li>").text(decodeURIComponent(data[i].required));
							$jobType = $("<span>").text(decodeURIComponent(data[i].jobType));
							if(decodeURIComponent(data[i].salary) != null){
								$salary = $("<span>").text(decodeURIComponent(data[i].salary).replace(/[undefined]/gi," "));
							}
							
							var date = new Date((decodeURIComponent(data[i].expiration_date))*1000);
							var today = new Date();
							var diff = today.getTime() - date.getTime();
							var dday = Math.floor(diff/(1000*60*60*24)); 
							
							$expiration_date = $("<span class='dday highlight'>").text("D"+dday);
							
							
							$aTop.append($name);
							$aTop.append($title);
							
							$desc.append($location);
							$desc.append($("<br>"));
							$desc.append($industry);
							$desc.append($experience);
							$desc.append($required);
							$info.append($hScrap);
							$info.append($jobType);
							$info.append($salary);
							$info.append($expiration_date);
							
							
							
							$item.append($aTop);
							$item.append($desc);
							$item.append($hr);
							$item.append($info);
							$hListBox.append($item);
							
						}
					}
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert("에러 발생 ! \n" + textStatus + " : " + errorThrown);
				}
				
			})
		});
	</script>
	
</body>
</html>