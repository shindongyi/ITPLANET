<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="today" value="<%=new Date()%>"/>
<fmt:formatDate var="todayFmt" value="${today}" pattern="yyyy-MM-dd"/>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITPLANET</title>
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900|Noto+Sans:400,400i,700,700i&display=swap&subset=korean" rel="stylesheet">
<!-- jQuery ui css -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 풀캘린더 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.css" />
<!-- 페이지 css -->
<link rel="stylesheet" href="${contextPath}/resources/css/license/licenseMainView-style.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/mypageCommon-style.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/loginView-style.css" type="text/css">
<!-- icon -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<!-- 풀캘린더 js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/locales/ko.js"></script>
<!-- jQuery ui -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<div id="wrap">
	<div id="primaryContent">
	<!-- start 상단 lcs_date_list -->
		<div id="lcs_date_list">
			<div id="calendar"></div>
			<div style="flex-direction: column; display: inline-block; position: absolute; left: 50%;">
		 	<div class="lcs_date nowList">
				<h2>접수 중인 시험 안내</h2>
				<hr>
				<div class="lcs">
					<c:forEach var="i" items="${firstList}" end="1">
						<span class="lcs_upper_title"><a href="${i.l_address}">${i.l_name} ${firstList[1].l_round}회차</a></span>
					</c:forEach>
					<c:if test="${fn:length(firstList) > '2'}">
						<span class="more" id="more1">more</span>
					</c:if>
				</div>
				<c:if test="${!empty firstList }">
				<div class="lcs_bt_wrap">
					<div class="lcs_title"><h3>제 ${firstList[0].l_round}회 ${firstList[0].l_name }</h3></div>
					<div class="lcs_startDate lcs_txt">접수 시작일 : ${firstList[0].start_date}</div>
					<div class="lcs_endDate lcs_txt">접수 마감일 : ${ firstList[0].end_date }</div>
					<c:choose>
						<c:when test='${firstList[0].results != null and firstList[0].results != "" }'>
							<div class="lcs_results lcs_txt">결과 발표일 : ${ firstList[0].results }</div>
						</c:when>
						<c:otherwise>
							<div class="lcs_results lcs_txt">결과 발표일 : 시험종료 즉시</div>
						</c:otherwise>
					</c:choose>
					<button class="lcs_btn lcs_txt" onclick="location.href='${firstList[0].l_address}'">접수하기</button>
				</div>
				</c:if>
				<c:if test="${empty firstList }">
					<i class="fas fa-exclamation-triangle" style="font-size: 120px; color: #f1f1f1a8; position: absolute; left: 35%; top: 40%;"></i>
					<div class="lcs_bt_wrap" style="bottom: 35%; left: 25%;">
						<p style="display: inline-block;">원서 접수중인 시험이 없습니다.</p>
					</div>
				</c:if>
			</div>
			<div id="lcsInfo" class="lcs_date">
					<h2>자격증 정보 안내</h2>
					<span class="deleteBtn">x</span>
				<hr>
				<div class="lcs_bt_wrap">
					<div class="lcs_title"><h3></h3></div>
					<div class="lcs_startDate lcs_txt"></div>
					<div class="lcs_endDate lcs_txt"></div>
					<div class="lcs_results lcs_txt"></div>
					<button class="scrapBtn lcs_scr lcs_txt" title="스크랩하기">스크랩하기</button>
					<button class="lcs_btn lcs_txt">접수하기</button>
				</div>
			</div>
			</div>
		</div>
		<hr>
		<div class="serchArea">
			<span id="search_box">
				<input type="text" id="searchBar" placeholder="S E A R C H">
				<span id="searchLbl">
					<span id="step_txt"></span>
				</span>
			</span>
			<c:if test="${loginUser ne null and loginUser.getGrade() eq '0'}">
			<button id="insertBtn">등록하기</button>
			</c:if>
		</div>
		<!-- end 상단 lcs_date_list -->
		<!-- start 하단 license_list_wrap -->
		<div id="license_list_wrap">
		<c:if test="${!empty allList }">
			<div id="license_list">
				<c:forEach var="i" items="${ allList }"> 
					<div class="license">
						<input type="hidden" class="lId" value="${i.l_id}">
						<div class="title">
							<p class="lcs_title">제 ${ i.l_round }회 ${ i.l_name }</p>
						</div>
						<div class="license_txtWrap">
						<div>1</div>
						<button class="setting"><span>...</span></button>
						<p class="lcs_txt">접수 시작일 : ${ i.start_date }</p>
						<p class="lcs_txt">접수 마감일 : ${ i.end_date }</p>
						<c:choose>
						<c:when test='${not empty i.results}'>
							<p class="lcs_txt">결과 발표일 : ${ i.results }</p>
						</c:when>
						<c:otherwise>
							<p class="lcs_txt">결과 발표일 : 상시발표</p>
						</c:otherwise>
					</c:choose>
						<div class="btnArea">
							<a href="${i.l_address }">사이트로 이동</a>
							<a class="scrapBtn" id="${i.l_id}" title="스크랩하기">스크랩하기</a>
						</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
		<c:if test="${empty allList }">
			<div id="license_list" style="height: 150px;">
				<i class="fas fa-exclamation-triangle" style="font-size: 120px; color: #fff; position: absolute; left: 45%; top: 20%;"></i>
				<div class="lcs_bt_wrap" style="bottom: 40%; left: 40%;">
					<p style="display: inline-block;">원서 접수중인 시험이 없습니다.</p>
				</div>
			</div>
		</c:if>
		</div>
		<!-- end 하단 license_list_wrap -->
		<!-- start layerPopup 자격증 등록 팝업-->
		<div id="layerPopup">
		<div class="insertLcsWrap on">
			<div class="insertLcs on">
				<h2 class="on">LICENSE INSERT</h2>
				<p class="on">자격증 정보를 등록하는 폼입니다.</p>
				<div class="formBox on">
					<div class="overHidden on">
						<div class="loginSection on">
							<fieldset class="on">
								<div class="flexForm tpad on">
									<div class="on">
										<label for="l_name">자격증 이름</label><input type="text" name="l_name" id="l_name" class="txtInp on">
									</div>
								</div>
								<div class="flexForm tpad on">
									<div>
										<label for="l_round">회차</label><input type="text" name="l_round" id="l_round" class="txtInp on" autocomplete="off">
									</div>
								</div>
								<div class="flexForm tpad on">
									<div class="on">
										<label for="start_date">접수 시작일</label><input type="date" name="start_date" id="start_date" class="txtInp on" value="${todayFmt}">
									</div>
								</div>
								<div class="flexForm tpad on">
									<div class="on">
										<label for="end_date">접수 마감일</label><input type="date" name="end_date" id="end_date" class="txtInp on" value="${todayFmt}">
									</div>
								</div>
								<div class="flexForm tpad on">
									<div class="on">
										<label for="results">결과 발표일</label><input type="date" name="results" id="results" class="txtInp on" value="${todayFmt}">
									</div>
								</div>
								<div class="flexForm tpad on">
									<div class="on">
										<label for="l_address">링크주소 입력</label><input type="text" name="l_address" id="l_address" class="txtInp on">
									</div>
								</div>
							</fieldset>
							<button class="loginBtn on" id="insertLcsBtn">등록하기</button>
							<button class="loginBtn on" id="updateLcsBtn">수정하기</button>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		<!-- end layerPopup 자격증 등록 팝업 -->
		<!-- 관리자 confirm 팝업 -->
		<div id="confirmPopup">
			<p>localhost:9012 내용:</p>
			<p>자격증 공고의 수정 또는 삭제를 원하시면 해당하는 버튼을 클릭해주세요.</p>
			<div>
				<button id="updateBtn" class="confirmBtn">수정</button>
				<button id="deleteBtn" class="confirmBtn">삭제</button>
				<button id="cancelBtn" class="confirmBtn">취소</button>
			</div>
		</div>
	</div>
	<!-- 페이지 상단 이동 버튼 -->
	<div id="goToTop">
	 <span>TOP</span>
	</div>
	<!-- end primaryContent -->
</div>
<!-- end wrap -->
<script>
/* Fullcalendar 관련 start */
var l_nameArr = []; // autocomplete에 쓸 배열
var l_addressArr = []; // autocomplete에 쓸 배열
var eventId; // eventId
var eventTitle;
var eventRound;
var eventStart;
var eventEnd;
var eventResults;
var eventAddress;
var grade;
var loginUser;

$(function(){
	ckUser(); // 유저가 관리자인지 회원인지 체크
	$("#goToTop").click(function() { // 상단 이동 버튼 관련
        $('html').animate({scrollTop : 0}, 600);
    });
});
function ckUser(){
	if("${loginUser}" != null && "${loginUser}" != "" && "${loginUser.getGrade()}" == 0){
		$('.setting').show();
		$('#insertBtn').show();
	}
}

/* FullCalender start */
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid', 'list' ],
      header: {
    	  left: 'prev',
    	  center: 'title',
    	  right: 'next'
      },
      editable: true,
      droppable: true,
      drop: function(info){
    	  if(checkbox.check){
    		  info.draggedEl.parentNode.removeChild(info.draggedEl);
    	  }
      },
      eventLimit: true,
      views: {
    	  dayGrid: {
    		  eventLimit: 3
    	  }
      },
      // 이벤트 추가
      eventClick: function(e){
    	  eventId = e.event.id;
   		  
   		  // 이벤트 클릭 시 우측에 상세 정보 띄우기
    	  var $lcsInfo = $('#lcsInfo');
    	  <c:forEach var="i" items="${calendarList}">
    	  	if("${i.l_id}" == eventId){
    	  		$('#lcsInfo .scrapBtn').attr('id', '${i.l_id}');
    	  		$('#lcsInfo h3').text('${i.l_name} ${i.l_round}회차');
    	  		$('#lcsInfo .lcs_startDate').text('접수 시작일 : ${i.start_date}');
    	  		$('#lcsInfo .lcs_endDate').text('접수 마감일 : ${i.end_date}');
    	  		if("${i.results}" != null && "${i.results}" != ""){
    	  				$('#lcsInfo .lcs_results').text('결과 발표일 : ${i.results}');
    	  		} else {
    	  				$('#lcsInfo .lcs_results').text('결과 발표일 : 상시발표');
    	  		}
    	  		$('#lcsInfo .lcs_btn').attr('onclick', 'location.href="${i.l_address}"');
    	  	}
    	  </c:forEach>
    	  $lcsInfo.show();
    	  
    	  if("${loginUser}" != null && "${loginUser}" != "" && "${loginUser.getGrade()}" == 0){
 			confirmPopup();
 			}
      },
      locale: 'ko'
    });
    calendar.render();
	  $(function(){
		 readList(); 
	  });
	  function readList(){
		  <c:forEach var ="i" items="${calendarList}">
		  		// autocomplete에 쓸 배열에 자격증 이름, link주소 담음
			  if(!l_nameArr.includes("${i.l_name}")){
		    	l_nameArr.push("${i.l_name}");
		      }
		  	  if(!l_addressArr.includes("${i.l_address}")){
		  		l_addressArr.push("${i.l_address}");
		  	  }
	    	calendar.addEvent({'id':'${i.l_id}','title':'${i.l_name} ${i.l_round}회차','start':'${i.start_date}','end':'${i.end_date}','color':'#f1f1f1a8'});
		  </c:forEach>	  
	  }
  }); 
/* Fullcalendar end */
 
 // ... 클릭시 전역변수 eventId에 해당 자격증 아이디 넣기
 $(document).on('click', '.setting', function(){
	 eventId = $(this).closest('.license').find('.lId').val();
	 confirmPopup();
 });
 
 // 수정/삭제/취소 confirm창 관련
 function confirmPopup(){
     /* $('html').animate({scrollTop : 0}, 600); */
	 <c:forEach var="i" items="${calendarList}">
	  	if("${i.l_id}" == eventId){
	  		<fmt:formatDate var="start_date" value="${i.start_date}" pattern="yyyy-MM-dd"/>
	  		<fmt:formatDate var="end_date" value="${i.end_date}" pattern="yyyy-MM-dd"/>
 		  	<fmt:formatDate var="results" value="${i.results}" pattern="yyyy-MM-dd"/>
	  		eventStart = "${start_date}";
	  		eventEnd = "${end_date}";
	  		eventResults = "${results}";
	  		eventAddress = "${i.l_address}";
	      	eventTitle = "${i.l_name}";
	    	eventRound = "${i.l_round}";
	  	}
	  </c:forEach>
	  
	  // 관리자일 경우 공고 삭제 이벤트
	  $('#confirmPopup').show();
	  $('#deleteBtn').on('click', function(){
    	  if(confirm("자격증 공고를 삭제하시겠습니까?")){
    		  $.ajax({
    	    		 url: "deleteLcs.do",
    	    		 data:{eventId:eventId},
    	    		 type: "get",
    	    		 success:function(data){
    	    			 if(data == "success"){
    	    				 alert('공고가 정상적으로 삭제되었습니다.');
    	    				 location.href= "lcsView.do";
    	    			 } else{
    	    				 alert('공고 삭제에 실패하였습니다. 잠시 후 다시 시도해주세요.');
    	    			 }
    	    		 }
    	    	  });  
    	  }
		  $('#confirmPopup').hide();
	  });
		  
	 // 취소 버튼 클릭시 
	$('#cancelBtn').on('click', function(){
		$('#confirmPopup').hide();
	});
	 
	 // 수정버튼 클릭시
	$('#updateBtn').on('click', function(e){
		$('#confirmPopup').hide();
		$('.insertLcs h2').text('LICENSE UPDATE');
		$('.insertLcs p').text('자격증 정보를 수정하는 폼입니다.');
		$('#insertLcsBtn').hide();
		$('#updateLcsBtn').show();
		
		$('#l_name').val(eventTitle);
		$('#l_round').val(eventRound);
		$('#start_date').val(eventStart);
		$('#end_date').val(eventEnd);
		$('#results').val(eventResults);
		$('#l_address').val(eventAddress);
		
		$('#layerPopup').show();
	});
}
 
/* 자격증 본문 start */
// 검색칸 포커스 / 블러에 따른 css
$('#searchBar').on('focus', function(){
	$(this).attr('placeholder', '');
	$('#search_box').css('box-shadow','0px 3px 10px -8px');
});
$('#searchBar').on('blur', function(){
	$('#search_box').css('box-shadow','');
	$(this).attr('placeholder', 'S E A R C H');
});

// 무한스크롤 ajax
$(document).ready(function(){
	var page = 1;
	$(document).scroll(function(){
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();
		
		var keyword = "${keyword}";
		var sort = "${sort}";
		
		ckUser();
		
		if(maxHeight <= currentScroll + 100) {
			page++;
			$.ajax({
				url:"getListMore.do",
				data:{page:page, keyword:keyword, sort:sort},
				dataType: "json",
				success:function(data){
					$licenseList = $('#license_list');
					for(var i in data){
						var day1 = new Date(data[i].end_date);
						var day2 = new Date();
						if(day1 >= day2){
							var $div = $("<div>").attr('class', 'license');
							var $button = $("<button>").attr('class', 'setting').attr('title', '스크랩하기');
							var $span = $('<span>').text("...");	
							
							$button.append($span);
							
							var $div2 = $("<div>").attr('class', 'title');
							var $p = $('<p>').attr('class', 'lcs_title').text('제 ' + data[i].l_round + '회 ' + decodeURIComponent(data[i].l_name.replace(/\+/g, " ")));
							
							var $innerDiv =  $("<div>").attr('class', 'license_txtWrap');
							var l_id = data[i].l_id;
							var $input = $('<input type="hidden" class="lId">').val(l_id);
							var $p3 = $("<p>").attr('class', 'lcs_txt').text("접수 시작일 : " + data[i].start_date);
							var $p4 = $("<p>").attr('class', 'lcs_txt').text("접수 마감일 : " + data[i].end_date);
							if(typeof data[i].results !== 'undefined'){
								var $p5 = $("<p>").attr('class', 'lcs_txt').text("결과 발표일 : " + data[i].results);
							} else {
								var $p5 = $("<p>").attr('class', 'lcs_txt').text("결과 발표일 : 상시발표");
							}
							var $div3 = $("<div>").attr('class', 'btnArea');
							var $a = $("<a>").attr('href', data[i].l_address).text("사이트로 이동");
							var $a2 = $("<a>").attr('class', 'scrapBtn').attr('id', data[i].l_id).text("스크랩하기");

							$div2.append($p);
							
							$div3.append($a);
							$div3.append($a2);
							
							$innerDiv.append('<div>' + page + '<div>');
							$innerDiv.append($input);
							$innerDiv.append($p3);
							$innerDiv.append($p4);
							$innerDiv.append($p5);
							$innerDiv.append($div3);
							
							$div.append($div2);
							$div.append($button);
							$div.append($innerDiv);
							
							$licenseList.append($div);
						}
					}
				}
			})
		}
	})
});

// 스크랩 확인
$(document).on('click', '.scrapBtn', function(e){
	var loginUser = "${loginUser}";
	var dateCk = false; // 마감된 공고이면 false 
	if($(this).prop("tagName") != 'A'){ // 스크랩을 상단에서 할 경우(접수 마감된 공고 클릭 분류하기 위해)
		console.log("eventId : " + eventId);
		<c:forEach var="i" items="${totalList}">
			if("${i.l_id}" == eventId){
				dateCk = true;
			}
		</c:forEach>
	} else {
		dateCk = true;
		eventId = $(this).closest('.license').find('.lId').val();
		console.log("eventId : " + eventId);
	}
	if(loginUser != null && loginUser!=""){
		if(!dateCk){
			if(confirm('이미 접수가 마감된 공고입니다. 스크랩하시겠습니까?')){
				scrap();
			}
		} else if(confirm("스크랩 하시겠습니까?")){
			scrap();
		}
	} else{
		if(confirm("스크랩은 로그인 하신 회원만 가능합니다. 로그인하시겠습니까?")){
			location.href="loginView.do";
		}
	}
});
console.log("123 : " + "${fn:length(totalList)}");
// 스크랩 하기
function scrap(){
	$.ajax({
		url:"scrapLcs.do",
		type:"post",
		data:{lId:eventId},
		success: function(data){
			if(data == "success"){
				alert("스크랩 완료");
			} else if (data == "fail"){
				alert("스크랩에 실패했습니다.");
			} else {
				alert("이미 스크랩 된 공고입니다.")
			}
		}
	});
}

// 검색
$('#searchBar').on('keypress', function(key){
	var keyword = $('#searchBar').val();
	var sort = null;
	if(key.keyCode==13) {
		location.href = "lcsView.do?keyword="+keyword+"&sort="+sort;
	}
}); 

// more 클릭시 해당 리스트만 자격증 리스트에 뿌리기
$('.more').on('click', function(){
	var more;
	if($(this).id == "more1"){
		more = "first";
	} else{
		more = "second";
	}
		location.href = "lcsView.do?more="+more;
});
/* 자격증 본문 end */

// 상단 x 클릭시 해당 div hide
$('.deleteBtn').on('click', function(){
	$(this).closest('#lcsInfo').hide();
});

// 자격증 수정
$('#insertBtn').on('click', function(){
	$('.insertLcs h2').text('LICENSE INSERT');
	$('.insertLcs p').text('자격증 정보를 등록하는 폼입니다.');
	$('#insertLcsBtn').show();
	$('#updateLcsBtn').hide();
	
	$('#l_name').val('');
	$('#l_round').val('');
	$('#start_date').val("${todayFmt}");
	$('#end_date').val("${todayFmt}");
	$('#results').val("${todayFmt}");
	$('#l_address').val('');
	
	$('#layerPopup').show();
});

// 팝업 보이면 스크롤 비활성화
$(document).on('click', $('#insertBtn'), function(){
	if($('#layerPopup').is(':visible')){
		$('#wrap').on('scroll touchmove mousewheel', function(event) {
			  event.preventDefault();
			  event.stopPropagation();
			  return false;
			});
	} else {
		$('#wrap').off('scroll touchmove mousewheel');
	}
});

// on class가 안달린 부분 클릭시 팝업 hide
$('#layerPopup').click(function(e){
	if(!$(e.target).is(".on")){
		$('#layerPopup').hide();
	}
});

// esc누르면 팝업 hide
$(document).keyup(function(e){
	if(e.keyCode == 27){
		$('#layerPopup').hide();
	}
});

// autocomplete
$(function(){
    $( "#l_name" ).autocomplete({
      source: l_nameArr
    });
    $( "#l_address" ).autocomplete({
        source: l_addressArr
    });
});

// 자격증 수정
$('#updateLcsBtn').on('click', function(){
	var l_name = $('#l_name').val();
	var l_round = $('#l_round').val();
	var start_date = $('#start_date').val();
	var end_date = $('#end_date').val();
	var results = $('#results').val();
	var l_address = $('#l_address').val();
	var l_id = eventId;
	
	$.ajax({
		url:"updateLcs.do",
		data:{l_name:l_name, l_round:l_round, start_date:start_date, end_date:end_date, results:results, l_address:l_address, l_id:l_id},
		method: "post",
		success: function(data){
			if(data == "success"){
				alert('수정이 완료되었습니다.');
				location.href = "lcsView.do";
			} else {
				alert('수정에 실패했습니다. 잠시후 다시 시도해주세요.');
			}
		}
	});
});

// 자격증 등록
$('#insertLcsBtn').on('click', function(){
	var l_name = $('#l_name').val();
	var l_round = $('#l_round').val();
	var start_date = $('#start_date').val();
	var end_date = $('#end_date').val();
	var results = $('#results').val();
	var l_address = $('#l_address').val();
	var l_id = eventId;
	
	console.log("l_name : " + l_name);
	
	$.ajax({
		url:"insertLcs.do",
		data:{l_name:l_name, l_round:l_round, start_date:start_date, end_date:end_date, results:results, l_address:l_address, l_id:l_id},
		method: "post",
		success: function(data){
			if(data == "success"){
				alert('등록이 완료되었습니다.');
				location.href = "lcsView.do";
			} else {
				alert('등록에 실패했습니다. 잠시후 다시 시도해주세요.');
			}
		}
	});
});

</script>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>