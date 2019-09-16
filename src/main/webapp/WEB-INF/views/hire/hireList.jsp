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
		
		<!-- iframe -->
	   <div class="pageFrame">
	      <iframe id="pageFrame" name="pageFrame" src="http://www.jobkorea.co.kr/Starter/calendar/sub/week" frameborder="0" width="980px" height="300px" scrolling="auto"></iframe>
	   </div>
		
		
		<div class="filter">
			<select class="form-control" id="hf_loc">
				<option value="지역" selected>지역</option>
				<option value="101000">서울</option>
				<option value="102000">경기</option>
				<option value="103000">광주</option>
				<option value="104000">대구</option>
				<option value="105000">대전</option>
				<option value="106000">부산</option>
				<option value="107000">울산</option>
				<option value="108000">인천</option>
				<option value="109000">강원</option>
			</select>
			<select class="form-control" id="hf_edu">
				<option value="학력" selected>학력</option>
				<option value="0">학력무관</option>
				<option value="6">고등학교졸업이상</option>
				<option value="7">대학졸업(2,3년)이상</option>
				<option value="8">대학교졸업(4년)이상</option>
				<option value="9">석사졸업이상</option>
			</select>
			<select class="form-control" id="">
				<option value="경력" selected>경력</option>
				<option value="1">신입</option>
				<option value="2">경력</option>
				<option value="3">신입/경력</option>
				<option value="4">무관</option>
			</select>
			<select class="form-control" id="hf_jopType">
				<option value="근무형태" selected>근무형태</option>
				<option value="1">정규직</option>
				<option value="2">계약직</option>
				<option value="6">파견직</option>
				<option value="9">프리랜서</option>
			</select>
			<input id="search-txt" type="text" name="" placeholder="키워드를 입력하세요." >
			<button id="hListSearch" class="search-btn">
				<i class="fas fa-search"></i>
			</button>
		</div>
		<div class="list" id="hListBox">
			<!-- <div class="item">
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
			</div> -->
		</div>
		<div class="pow">Powered by <a href="http://www.saramin.co.kr" target="_blank">취업 사람인</a></div>
	</div>
	
	
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>	    
	
	<script type="text/javascript">
		
		var uri ="https://oapi.saramin.co.kr/job-search?";
		var key ="access-key=mg233WU8HnG8aF5jrYPTqeBpU7Tr4OpGQtN38PyKptDLgj4ciNwbm";
		var job_category = "&job_category=4"
	
		$(document).ready(function(){
			// "https://oapi.saramin.co.kr/job-search?access-key=XezjUx3DKk1B2Sf6Rqs3H0ReMjILTLin4778M8jV4CieFkbVa&ind_cd=3&start=1&count=50";
			var sNum = 1;
			var cNum = 10;

			// var uri ="https://oapi.saramin.co.kr/job-search?";
			// var key ="access-key=mg233WU8HnG8aF5jrYPTqeBpU7Tr4OpGQtN38PyKptDLgj4ciNwbm";
			// var job_category = "&job_category=4"
			var start = "&start=";
			var count = "&count=";
			var kewords = "&kewords=";
			var kewords2 = encodeURI("개발자");
		    var resultURL = uri + key + job_category + start + sNum + count + cNum;
					
		    hListView(resultURL);
		    
		    $(window).on("scroll", function() {
		    	var maxHeight = $(document).height();
				var currentScroll = $(window).scrollTop() + $(window).height();
				
		    	if (maxHeight <= currentScroll + 100) {			
		    		sNum++;
		    		resultURL = uri + key + job_category + start + sNum + count + cNum;
		    		hListView(resultURL);
		    	}
		    });
					
				
		});
			
	
		function hListView(resultURL){
			$.ajax({
				url: "hJsonList.do",
				type: "POST",
				data: {"resultURL" : resultURL},
				dataType: "json",
				success: function(data){
					$hListBox = $("#hListBox");
					// $hListBox.html("");

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
							$aTop = $("<a class='top' target='_sub' >").attr("href",decodeURIComponent(data[i].href));
							$desc = $("<ul id='desc' style='list-style-type: none;'>");
							$info = $("<p class='info'>")
							
							$name = $("<p class='company'>").text(decodeURIComponent(data[i].name));
							$title = $("<span class='hTitle'>").text(decodeURIComponent(data[i].title).replace(/[+]/gi," "));
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
							//$info.append($hScrap);
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
			});
 		}  // hListView END
 		
 		$("#hListSearch").on("click",function(){
 			// var uri ="https://oapi.saramin.co.kr/job-search?";
			// var key ="access-key=XezjUx3DKk1B2Sf6Rqs3H0ReMjILTLin4778M8jV4CieFkbVa";
			$hListBox = $("#hListBox");
			$hListBox.html("");
			var kewords = "&keword=";
			var start = "&start=1";
			var count = "&count=30";
			var searchTxt = $("#search-txt"); 
			// console.log(searchTxt.val())
			var kewords2 = encodeURI((searchTxt.val()));

       		var resultURL = uri + key + kewords + kewords2 + start + count;
       		//console.log(resultURL);
       		hListView(resultURL);
		    searchTxt.val('');
 		});
 	   
 		$("#hf_jopType").on("change",function(){
 			var filter_jobType = $('#hf_jopType option:selected').val();
 			// console.log(filter_jobType);
 			// var uri ="https://oapi.saramin.co.kr/job-search?";
			// var key ="access-key=XezjUx3DKk1B2Sf6Rqs3H0ReMjILTLin4778M8jV4CieFkbVa";
			$hListBox = $("#hListBox");
			$hListBox.html("");
			var start = "&start=1";	
			var count = "&count=30";
			var jobType = "&job_type=" + filter_jobType;
			
			var resultURL = uri + key + start + count + jobType;
			hListView(resultURL);
 		});
 	
 		$("#hf_loc").on("change",function(){
 			var filter_loc = $('#hf_loc option:selected').val();
 			// var uri ="https://oapi.saramin.co.kr/job-search?";
			// var key ="access-key=XezjUx3DKk1B2Sf6Rqs3H0ReMjILTLin4778M8jV4CieFkbVa";
			$hListBox = $("#hListBox");
			$hListBox.html("");
			var start = "&start=1";
			var count = "&count=30";
			var loc_mcd = "&loc_mcd=" + filter_loc;
			var resultURL = uri + key + start + count + loc_mcd;
			hListView(resultURL);
 		});
 		
 		$("#hf_edu").on("change",function(){
 			var filter_edu = $('#hf_edu option:selected').val();
 			// var uri ="https://oapi.saramin.co.kr/job-search?";
			// var key ="access-key=XezjUx3DKk1B2Sf6Rqs3H0ReMjILTLin4778M8jV4CieFkbVa";
			$hListBox = $("#hListBox");
			$hListBox.html("");
			var start = "&start=1";
			var count = "&count=30";
			var loc_edu = "&edu_lv=" + filter_edu;
			var resultURL = uri + key + start + count + loc_edu;
			hListView(resultURL);
 		});
 		
 		
 		
 		
 		
 		
 		
	</script>

</body>
</html>