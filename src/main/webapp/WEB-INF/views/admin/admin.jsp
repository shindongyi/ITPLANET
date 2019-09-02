<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMINPAGE</title>
<style type="text/css">

</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/index.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
	@charset "UTF-8";
	
	body{
	      postion: relative; !important
	}
	section{
	   min-height: 900px;
	    postion: relative; !important 
	}
	
	footer{
	   postion: relative; !important
	}
	
	.buttonss{
		height: 30px;
		width: 60px;
	}
</style>
<body>
   
   <!-- 왼쪽사이드바 -->
   <div class=" w3-bar-block  w3-card" 
      style="width:150px; min-height: 700px; position:relative !important; z-index: 4; background:#003458; color: white;">
      <h5 class="w3-bar-item">Admin Page</h5>
      <hr>
      <button class="w3-bar-item w3-button sideTablink" 
         onclick="openLink(event, 'administrate')">회원목록</button>
      <button class="w3-bar-item w3-button sideTablink"
         onclick="openLink(event, 'qna')">글목록</button>
      <button class="w3-bar-item w3-button sideTablink"
         onclick="openLink(event, 'userWant')">블랙리스트</button>
	
   </div>
   
   <div
      style="position: relative !important; margin-left: 145px; bottom: 700px; z-index: 3;">
      <div class="w3-padding" style="margin-bottom: -30px; margin-top: 5px;">
         <h4>관리자님 반갑습니다</h4>
      </div>
      <!-- 관리자화면 메인 -->
      <hr style="top: 1px;">
      
      <!-- 사용자관리 -->
      <div id="administrate" class="w3-container sidetabs w3-animate-left"
         style="display: none; min-height: 200px">

         <h3 style="margin-top: -10px;">사용자 관리</h3>
         <div class="w3-bar w3-white w3-card">
            <button class="w3-bar-item w3-button usertablink" style="background:#003458; color: white;"
               onclick="user(event,'normalUser')">일반회원</button>
            <button class="w3-bar-item w3-button usertablink" style="background:#003458; color: white;"
               onclick="user(event,'blackList')">블랙리스트</button>
         </div>
         <div id="normalUser" class="w3-container w3-border user">
            <h5>일반회원</h5>
            <p>x명의 일반회원이있습니다</p>
            <!-- x에 인원수 표시하게할것 -->
            <div class="w3-container">
               <input class="w3-input w3-border w3-padding" type="text"
                  placeholder="아이디를 입력하세요" id="normalUser"
                  onkeyup="searchNormalUser()" style="width: 40%;">

               <table class="w3-table-all w3-margin-top" id="userSearchTable"
                  style="margin-bottom: 20px;">
                  <tr>
                     <th style="width: auto;">아이디</th>
                     <th style="width: auto;">이름</th>
                     <th style="width: auto;">닉네임</th>
                     <th style="width: auto;">회원유형</th>
                     <th style="width: auto;">생일</th>
                     <th style="width: auto;">성별</th>
                     <th style="width: auto;">이메일</th>
                     <th style="width: auto;">enroll_date</th>
                     <th style="width: auto;">modify_date</th>
                     <th style="width: auto;">회원등급</th>
                  </tr>
                  <tr>
                  	<td>wkddnjswo11</td>
                  	<td>장원재</td>
                  	<td>짱임니당12</td>
                  	<td>활동회원</td>
                  	<td>1995년12월27일</td>
                  	<td>남아</td>
                  	<td>wkddnjswo11@naver.com</td>
                  	<td>2019-08-30</td>
                  	<td>2019-08-30</td>
                  	<td>VIP</td>
                  </tr>
                  
               </table>
            </div>
         </div>
   
         <div id="blackList" class="w3-container w3-border user"
            style="display: none">
            <h5>블랙리스트</h5>
            <p>x명의 블랙리스트 회원이있습니다</p>
            <!-- x에 인원수 표시하게할것 -->
            <div class="w3-container">


               <input class="w3-input w3-border w3-padding" type="text"
                  placeholder="아이디를입력하세요" id="blackUserInput"
                  onkeyup="blackUserSearch()" style="width: 40%;">

               <table class="w3-table-all w3-margin-top" id="blackUserTable"
                  style="margin-bottom: 20px;">
                  <tr>
                     <th style="width: auto;">아이디</th>
                     <th style="width: auto;">블랙리스트사유</th>
                     <th style="width: auto;">블랙리스트 레벨</th>
                     <th style="width: auto;">회원 유형</th>
                     <th style="width: auto;">등록일자</th>
                     <th style="width: auto;">블랙풀기</th>
                  </tr>
                  <!--예시  -->
                  <tr>
                     <th>pabre</th>
                     <th>곤충홍보</th>
                     <th>3</th>
                     <th>일반회원</th>
                     <th>2019/08/03</th>
                     <td><input type="button" value="블랙해제"
                        class="w3-button w3-blue"></td>
                  </tr>

               </table>


            </div>

         </div>
      </div>


      <!--QnA  -->
      <div id="qna" class="w3-container sidetabs w3-animate-left"
         style="display: none; min-height: 200px">
         <h3 style="margin-top: -10px;">글목록 관리</h3>
         <!-- qna -->
         <div class="w3-container">

            <div class="w3-bar w3-white w3-card">
               <button class="w3-bar-item w3-button qnaTablink w3-blue" style="background:#003458; color: white;"
                  onclick="qnaHoTab(event,'sendQna')">공모전</button>
               <button class="w3-bar-item w3-button qnaTablink " style="background:#003458; color: white;"
                  onclick="qnaHoTab(event,'stuffQna')">채용공고</button>
               <button class="w3-bar-item w3-button qnaTablink " style="background:#003458; color: white;"
                  onclick="qnaHoTab(event,'reQna')">신고글</button>
               <button class="w3-bar-item w3-button qnaTablink " style="background:#003458; color: white;"
                  onclick="qnaHoTab(event,'otherQna')">기타</button>
            </div>

            <div id="sendQna" class="w3-container w3-border qnatab"
               style="padding-top: 20px; padding-bottom: 20px;">
               <!--  내용물(예시)  -->
               <div id="sendQna1">
                  <table class="w3-table-all w3-margin-top" id="gongmojeon"
                  style="margin-bottom: 20px; word-break:break-all;">
                  <tr>
                     
                     <th style="width: 80px;">글번호</th>
                     <th style="width: 120px;">제목</th>
                     <th style="width: auto;">내용</th>
                     <th style="width: 140px;">공모전 전화번호</th>
                     <th style="width: 120px;">작성자</th>
                     <th style="width: auto;"></th>
                     <th style="width: auto;"></th>
                  </tr>
                  <tr>
                  	<td>1</td>
                  	<td>코딩마스터</td>
                  	<td>소규모 프로그래밍 대회 개최하기
					프로그래밍 대회를 누구나 개최할 수 있고 참여할 수 있습니다.
					동아리, 단체, 학교 친구들끼리, 대학 교수님, 초,중,고등학교 선생님 등 
					누구나 자체적으로 소규모 대회를 운영.</td>
                  	<td>02-2645-1125</td>
                  	<td>산업통산부</td>
                  	<td><button class="buttonss">수락</button></td>
                  	<td><button class="buttonss">거부</button></td>
                  </tr>
               </table>
               </div>


            </div>
         </div>
         <div id="stuffQna" class="w3-container w3-border qnatab"
            style="padding-top: 20px; padding-bottom: 20px; display: none; width: 98%; margin-left: 15px;">
            <!--  내용물(예시)  -->
           
            <div id="gongmo">
               <table class="w3-table-all w3-margin-top" id="gongmojeon"
                  style="margin-bottom: 20px; word-break:break-all;">
                  <tr>
                     
                     <th style="width: 80px;">글번호</th>
                     <th style="width: 180px;">제목</th>
                     <th style="width: auto;">내용</th>
                     <th style="width: auto;">회사연락처</th>
                     <th style="width: auto;">작성자</th>
                     <th style="width: auto;"></th>
                     <th style="width: auto;"></th>
                  </tr>
                  <tr>
                  	<td>1</td>
                  	<td>카카오개발자채용</td>
                  	<td>더 나은 세상을 꿈꾸고 그것을 현실로 만드는 이를 위하여 카카오에서 앱 개발 플랫폼 서비스를 시작합니다.</td>
                  	<td>02-2645-1125</td>
                  	<td>카카오인사팀</td>
                  	<td><button class="buttonss">수락</button></td>
                  	<td><button class="buttonss">거부</button></td>
                  </tr>
               </table>
            </div>


         </div>
         <div id="reQna" class="w3-container w3-border qnatab"
            style="padding-top: 20px; padding-bottom: 20px; display: none; width: 98%; margin-left: 15px;">
            <!--  내용물(예시)  -->
            <button onclick="userQnaList('reQna1')"
               class="w3-button w3-block w3-white w3-card w3-left-align">질문환불</button>
            <div id="reQna1" class="w3-hide w3-container">
               <p>제목 :</p>
               <p>작성자 :</p>
               <p>닐짜 :</p>
               <textarea rows="" cols="">  질문 내용물 넣을곳</textarea>
               <textarea rows="" cols="">  답변 넣을곳</textarea>
            </div>


         </div>
         <div id="otherQna" class="w3-container w3-border qnatab"
            style="padding-top: 20px; padding-bottom: 20px; display: none; width: 98%; margin-left: 15px;">
            <!--  내용물(예시)  -->
            <button onclick="userQnaList('otherQna1')"
               class="w3-button w3-block w3-white w3-card w3-left-align">질문기타</button>
            <div id="otherQna1" class="w3-hide w3-container">
               <p>제목 :</p>
               <p>작성자 :</p>
               <p>닐짜 :</p>
               <textarea rows="" cols="">  질문 내용물 넣을곳</textarea>
               <textarea rows="" cols="">  답변 넣을곳</textarea>
            </div>



         </div>
      </div>
  </div>
   <script>
      /*세로 사이드바  */
      function openLink(evt, animName) {
         var i, x, tablinks;
         x = document.getElementsByClassName("sidetabs");
         for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
         }
         tablinks = document.getElementsByClassName("sideTablink");
         for (i = 0; i < x.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(
                  " w3-blue", "");
         }
         document.getElementById(animName).style.display = "block";
         evt.currentTarget.className += " w3-blue";
      }
      /* 통계바 */

      /* 사용자바 */
      function user(evt, users) {
         var i, x, tablinks;
         x = document.getElementsByClassName("user");
         for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
         }
         tablinks = document.getElementsByClassName("usertablink");
         for (i = 0; i < x.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(
                  " w3-blue", "");
         }
         document.getElementById(users).style.display = "block";
         evt.currentTarget.className += " w3-blue";
      }
      /* QnA 가로텝 */
      function qnaHoTab(evt, tab) {
         var i, x, tablinks;
         x = document.getElementsByClassName("qnatab");
         for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
         }
         tablinks = document.getElementsByClassName("qnaTablink");
         for (i = 0; i < x.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(
                  " w3-blue", "");
         }
         document.getElementById(tab).style.display = "block";
         evt.currentTarget.className += " w3-blue";
      }
      /* 사용자 qna */
      function userQnaList(id) {
         var x = document.getElementById(id);
         if (x.className.indexOf("w3-show") == -1) {
            x.className += " w3-show";
            x.previousElementSibling.className = x.previousElementSibling.className
                  .replace("w3-white", "w3-blue");
         } else {
            x.className = x.className.replace(" w3-show", "");
            x.previousElementSibling.className = x.previousElementSibling.className
                  .replace("w3-blue", "w3-white");
         }
      }

      
      /* 일반유저 리스트 */
      function searchNormalUser() {
         var input, filter, table, tr, td, i;
         input = document.getElementById("normalUser");
         filter = input.value.toUpperCase();
         table = document.getElementById("userSearchTable");
         tr = table.getElementsByTagName("tr");
         for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
               txtValue = td.textContent || td.innerText;
               if (txtValue.toUpperCase().indexOf(filter) > -1) {
                  tr[i].style.display = "";
               } else {
                  tr[i].style.display = "none";
               }
            }
         }
      }
      
      /* 블랙리스트 */
      function blackUserSearch() {
         var input, filter, table, tr, td, i;
         input = document.getElementById("blackUserInput");
         filter = input.value.toUpperCase();
         table = document.getElementById("blackUserTable");
         tr = table.getElementsByTagName("tr");
         for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
               txtValue = td.textContent || td.innerText;
               if (txtValue.toUpperCase().indexOf(filter) > -1) {
                  tr[i].style.display = "";
               } else {
                  tr[i].style.display = "none";
               }
            }
         }
      }
      /* 게시판 가로텝 */
      function boardTabsFunc(evt, boardCate) {
         var i, x, tablinks;
         x = document.getElementsByClassName("city");
         for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
         }
         tablinks = document.getElementsByClassName("boardTabs");
         for (i = 0; i < x.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(
                  " w3-blue", "");
         }
         document.getElementById(boardCate).style.display = "block";
         evt.currentTarget.className += " w3-blue";
      }

      
   </script>
</body>
</html>