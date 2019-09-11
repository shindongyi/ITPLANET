<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="today" value="<%=new Date()%>"/>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITPLANET</title>
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900|Noto+Sans:400,400i,700,700i&display=swap&subset=korean" rel="stylesheet">
<!-- 풀캘린더 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.css" />
<!-- 페이지 css -->
<link rel="stylesheet" href="${contextPath}/resources/css/license/licenseMainView-style.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/mypageCommon-style.css" type="text/css">
<!-- icon -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<!-- <script src='https://momentjs.com/downloads/moment.min.js'></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/locales/ko.js"></script>
<script>
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
      eventClick: function(e){
    	  var eventId = e.event.id
    	  console.log("event : " + eventId);
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
      },
     /*  eventMouseEnter: function(e){
    	  $('#popLayer').show();
      },
      eventMouseLeave: function(e){
    	  $('#popLayer').css('display', 'none');
      }, */
      locale: 'ko'
/*       dateClick: function() {
    	  confirm('스크랩 하시겠습니까?');
      } */
    });
    calendar.render();
	  var titleNum;
	  var start_dateSubstr;
	  $(function(){
		 readList(); 
	  });
	  function readList(){
		  <c:forEach var ="i" items="${allList}">
	    	titleNum = $('.fc-center').text().substr(-3, 3).match(/\d+/) *1;
	    	start_dateSubstr = '${i.start_date}'.substr(5,2) *1;
			  console.log(typeof titleNum +  " / " + titleNum);
			  console.log(typeof start_dateSubstr + " / " + start_dateSubstr);
	    	calendar.addEvent({'id':'${i.l_id}','title':'${i.l_name} ${i.l_round}회차','start':'${i.start_date}','end':'${ i.end_date}','color':'#f1f1f1'});
	    	var aaa = calendar.getEventById(28);
	    	console.log(aaa);
		  </c:forEach>	  
	  }
  }); 
</script>
	<div id="wrap">
		<div id="primaryContent">
			<div id="lcs_date_list">
				<div id="calendar"></div>
				<div id="popLayer"></div>
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
					<div class="lcs_bt_wrap">
						<div class="lcs_title"><h3>${firstList[1].l_name } ${firstList[1].l_round}회차</h3></div>
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
				</div>
			<%-- 	<div class="lcs_date soonList">
					<h2>접수 예정 시험 안내</h2>
					<hr>
				<div class="lcs">
						<c:forEach var="i" items="${secondList}" end="1">
							<span class="lcs_upper_title"><a href="${i.l_address}">${i.l_name}</a></span>
						</c:forEach>
						<c:if test="${fn:length(secondList) > '2'}">
							<span class="more" id="more2">more</span>
						</c:if>
					</div>
					<div class="lcs_bt_wrap">
						<div class="lcs_title"><h3>${secondList[0].l_name}</h3></div>
						<div class="lcs_startDate lcs_txt">접수 시작일 : ${secondList[0].start_date}</div>
						<div class="lcs_endDate lcs_txt">접수 마감일 : ${ secondList[0].end_date }</div>
						<c:choose>
							<c:when test='${secondList[0].results != null and secondList[0].results != "" }'>
								<div class="lcs_results lcs_txt">결과 발표일 : ${ secondList[0].results }</div>
							</c:when>
							<c:otherwise>
								<div class="lcs_results lcs_txt">결과 발표일 : 시험종료 즉시</div>
							</c:otherwise>
						</c:choose>
						<button class="lcs_btn lcs_txt" onclick="location.href='${secondList[0].l_address}'">살펴보기</button>
					</div>
				</div>  --%>
			</div>
			<div class="serchArea">
				<span id="search_box">
					<input type="text" id="searchBar" placeholder="S E A R C H">
					<span id="searchLbl">
						<span id="step_txt"></span>
					</span>
				<!-- <button id="after"><i class="fas fa-search"></i></button> -->
				</span>
			</div>
			<!-- end lcs_date_list -->
			<div id="license_list_wrap">
				<div id="license_list">
					<c:forEach var="i" items="${ allList }"> 
						<div class="license">
							<input type="hidden" class="lId" value="${i.l_id}">
							<%-- <img src="${contextPath}/resources/luplodeFiles/${i.latList[0].change_name}" alt="${ i.latList[0].change_name }"> --%>
							<%-- <div class="hoverDiv>
								<a href="${i.l_address }">해당 사이트로 이동하기</a>
							</div> --%>
							<button class="scrapBtn" id="${i.l_id}" title="스크랩하기"><span>...</span></button>
							<div class="license_txtWrap">
							<%-- <img src="https://www.codingfactory.net/wp-content/uploads/css-reference-background-image-01.png" alt="${ i.latList[0].change_name }"> --%>
							<div>1</div>
							<p class="lcs_title">${ i.l_name }</p>
							<p class="lcs_round">${ i.l_round }회차</p>
							<hr>
							<p class="lcs_txt">접수 시작일 : ${ i.start_date }</p>
							<p class="lcs_txt">접수 마감일 : ${ i.end_date }</p>
							<p class="lcs_txt">결과 발표일 : ${ i.results }</p>
							<a href="${i.l_address }">사이트로 이동</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<script>
					/* $('.license').hover(function(){
						$(this).children().eq(1).show();
					}, function(){
						$(this).children().eq(1).hide();
					}); */
					
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
							
							if(maxHeight <= currentScroll + 100) {
								page++;
								console.log("page : " + page);
								$.ajax({
									url:"getListMore.do",
									data:{page:page, keyword:keyword, sort:sort},
									dataType: "json",
									success:function(data){
										$licenseList = $('#license_list');
										
										for(var i in data){
											var $div = $("<div>").attr('class', 'license');
											var $button = $("<button>").attr('class', 'scrapBtn').attr('title', '스크랩하기').attr('id', data[i].l_id);
											var $span = $('<span>').text("...");	
											
											$button.append($span);
											
											var $innerDiv =  $("<div>").attr('class', 'license_txtWrap');
											var a = data[i].l_id;
											console.log(a);
											var $input = $('<input type="hidden" class="lId">').val(a);
											var $p1 = $("<p>").attr('class', 'lcs_title').text(decodeURIComponent(data[i].l_name.replace(/\+/g, " ")));
											var $p2 = $("<p>").attr('class', 'lcs_round').text(data[i].l_round + "회차");
											var $hr = $("<hr>");
											var $p3 = $("<p>").attr('class', 'lcs_txt').text("접수 시작일 : " + data[i].start_date);
											var $p4 = $("<p>").attr('class', 'lcs_txt').text("접수 마감일 : " + data[i].end_date);
											var $p5 = $("<p>").attr('class', 'lcs_txt').text("결과 발표일 : " + data[i].results);
											var $a = $("<a>").attr('href', data[i].l_address).text("사이트로 이동");
											
											$innerDiv.append('<div>' + page + '<div>');
											$innerDiv.append($input);
											$innerDiv.append($p1);
											$innerDiv.append($p2);
											$innerDiv.append($hr);
											$innerDiv.append($p3);
											$innerDiv.append($p4);
											$innerDiv.append($p5);
											$innerDiv.append($a);
											
											$div.append($button);
											$div.append($innerDiv);
											
											$licenseList.append($div);
										}
									}
								})
							}
						})
					});
					
					// 스크랩 확인
					$(document).on('click', '.scrapBtn', function(e){
						var loginUser = "${loginUser}";
						if(loginUser != null && loginUser!="" && confirm("스크랩 하시겠습니까?")){
							scrap();
						} else{
							if(confirm("스크랩은 로그인 하신 회원만 가능합니다. 로그인하시겠습니까?")){
								location.href="loginView.do";
							}
						}
					});
					
					// 스크랩 하기
					function scrap(){
						var lId = e.currentTarget.id; 
						$.ajax({
							url:"scrapLcs.do",
							type:"post",
							data:{lId:lId},
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
					};
					
					
					// 검색
					$('#searchBar').on('keypress', function(key){
						var keyword = $('#searchBar').val();
						var sort = null;
						if(key.keyCode==13) {
							location.href = "lcsView.do?keyword="+keyword+"&sort="+sort;
						}
					}); 
					
					$('.more').on('click', function(){
						var more;
						if($(this).id == "more1"){
							more = "first";
						} else{
							more = "second";
						}
							location.href = "lcsView.do?more="+more;
					});
				</script>
				<!-- end license_list -->
			</div>
			<!-- end license_list_wrap -->
		</div>
		<!-- end primaryContent -->
	</div>
	<!-- end wrap -->
	<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>