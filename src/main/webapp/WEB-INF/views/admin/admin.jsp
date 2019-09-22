<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMINPAGE</title>
<style type="text/css">
</style>
<script type="text/javascript"
	src="${ contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<style>
@charset "UTF-8";

body {
	postion: relative;
	background: url('${ contextPath }/resources/images/it.jpg') no-repeat;	
	background-size: 100%;
	overflow: hidden;
}

section {
	min-height: 900px;
	postion: relative;
	!
	important
}

footer {
	postion: relative;
	!
	important
}

.buttonss {
	height: 30px;
	width: 60px;
}

#userSearchTable{
	font-size: 14px;
}

#blackUserTable{
	font-size: 12px;
}
#gongmojeon{
	font-size: 12px;
}

#blacklistt{
	font-size: 12px;
}

#normalUser{
	overflow: scroll;
	height:500px;
}

#blackList{
	overflow: scroll;
	height:500px;
}



</style>
<body>
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>

	<!-- 왼쪽사이드바 -->
	<div class=" w3-bar-block  w3-card"
		style="width: 150px; min-height: 685px; position: relative !important; z-index: 4; background: #003458; color: white;">
		<h5 class="w3-bar-item">Admin Page</h5>
		<hr>
		<button class="w3-bar-item w3-button sideTablink"
			onclick="openLink(event, 'administrate')">회원목록</button>
		<button class="w3-bar-item w3-button sideTablink"
			onclick="openLink(event, 'qna')">글목록</button>
		

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
			<hr>
			<h3 style="margin-top: -10px;">사용자 관리</h3>
			<p>${list.size() }명의 회원이있습니다 (일반회원 + 블랙리스트)</p>
			<hr>
			<div class="w3-bar w3-white w3-card">
				<button class="w3-bar-item w3-button usertablink"
					style="background: #003458; color: white;"
					onclick="user(event,'normalUser')">일반회원</button>
				<button class="w3-bar-item w3-button usertablink"
					style="background: #003458; color: white;"
					onclick="user(event,'blackList')">블랙리스트</button>
			</div>
			<div id="normalUser" class="w3-container w3-border user" >
				<h5>일반회원</h5>
				<div class="w3-container">	
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
							<th style="width: auto;">가입일자</th>
							<th style="width: auto;">개인정보수정일자</th>
							<th style="width: auto;">블랙리스트</th>
						</tr>
						<c:forEach var="m" items="${ list }">
						<c:if test="${m.grade == 1}">
								<tr>
									<td>${ m.userId }</td>
									<td>${ m.userName }</td>
									<td>${ m.nickName }</td>
									<c:if test="${m.status eq 'Y' }">
									<td>활동회원</td>
									</c:if>
									<c:if test="${m.status eq 'N' }">
									<td>휴먼회원</td>
									</c:if>
									<td>${ m.birthDay }</td>
									<td>${ m.gender }자</td>
									<td>${ m.email }</td>
									<td>${ m.enrollDate }</td>
									<td>${ m.modifyDate }</td><td>							
							<input type="button" value="블랙시키기"
								class="w3-button w3-red" onclick="javascript:location.href='black.do?blkId=${m.userId}'">
							</td>
								</tr>
						</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
			
			<div id="blackList" class="w3-container w3-border user"
				style="display: none">
				<h5>블랙리스트</h5>
				
				<!-- x에 인원수 표시하게할것 -->
				<div class="w3-container">
					

					<table class="w3-table-all w3-margin-top" id="blackUserTable"
						style="margin-bottom: 20px;">
						<tr>
							<th style="width: auto;">아이디</th>
							<th style="width: auto;">이름</th>
							<th style="width: auto;">닉네임</th>
							<th style="width: auto;">회원유형</th>
							<th style="width: auto;">생일</th>
							<th style="width: auto;">성별</th>
							<th style="width: auto;">이메일</th>
							<th style="width: auto;">가입일자</th>
							<th style="width: auto;">개인정보수정일자</th>
							<th style="width: auto;">블랙리스트</th>
						</tr>
						<!--예시  -->
						
						<c:forEach var="b" items="${ list }">
						<c:if test="${b.grade == 2}">
						<tr>
							<td>${ b.userId }</td>
									<td>${ b.userName }</td>
									<td>${ b.nickName }</td>
									<c:if test="${b.status eq 'Y' }">
									<td>활동회원</td>
									</c:if>
									<c:if test="${b.status eq 'N' }">
									<td>휴먼회원</td>
									</c:if>
									<td>${ b.birthDay }</td>
									<td>${ b.gender }자</td>
									<td>${ b.email }</td>
									<td>${ b.enrollDate }</td>
									<td>${ b.modifyDate }</td>
							<td>							
							<input type="button" value="블랙해제"
								class="w3-button w3-blue" onclick="javascript:location.href='blackOff.do?blkTargetId=${b.userId}'">
							</td>
						</tr>
						</c:if>
						</c:forEach>
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
					<button class="w3-bar-item w3-button qnaTablink w3-blue"
						style="background: #003458; color: white;"
						onclick="qnaHoTab(event,'sendQna')">공모전</button>
					<button class="w3-bar-item w3-button qnaTablink "
						style="background: #003458; color: white;"
						onclick="qnaHoTab(event,'stuffQna')">신고글</button>
					
				</div>

				<div id="sendQna" class="w3-container w3-border qnatab"
					style="padding-top: 20px; padding-bottom: 20px;">
					<!--  내용물(예시)  -->
					<div id="sendQna1">
						<table class="w3-table-all w3-margin-top" id="gongmojeon"
							style="margin-bottom: 20px; word-break: break-all;">
								<tr>
									<th style="width: auto;">글번호</th>
									<th style="width: auto;">제목</th>
									<th style="width: 180px;">내용</th>
									<th style="width: auto;">전화번호</th>
									<th style="width: auto;">주소</th>
									<th style="width: auto;">시작일</th>
									<th style="width: auto;">마감일</th>
									<th style="width: auto;">작성일</th>
									<th style="width: auto;">수정일</th>
									<th style="width: auto;">작성자</th>
									<th style="width: 70px;">수락</th>
									<th style="width: auto;"></th>
								</tr>
								
								<c:forEach var="c" items="${ clist }">
								<tr>
									<td>${ c.cId}</td>
									<td>${ c.cTitle}</td>
									<td>${ c.cContent}</td>
									<td>${ c.cPhone}</td>
									<td>${ c.cAddress}</td>
									<td>${ c.cStartDate}</td>
									<td>${ c.cDueDate}</td>
									<td>${ c.cCreateDate}</td>
									<td>${ c.cModifyDate}</td>
									<td>${ c.cWriter}</td>
									<td><input type="button" value="수락" class="w3-button w3-blue" onclick="javascript:location.href='gongmoYes.do?gongNum=${ c.cId}'" ></td>
									<td><input type="button" value="거부" class="w3-button w3-red" onclick="javascript:location.href='gongmoNo.do?gongNum2=${ c.cId}'" ></td>
							   </tr>
							   </c:forEach>
						</table>
					</div>


				</div>
			</div>
			<div id="stuffQna" class="w3-container w3-border qnatab"
				style="padding-top: 20px; padding-bottom: 20px; display: none; width: 98%; margin-left: 15px;">
				<!--  내용물(예시)  -->

				<div id="blacklistt">
					<table class="w3-table-all w3-margin-top" id="blacklist"
						style="margin-bottom: 20px; word-break: break-all;">
						<tr>

							<th style="width: auto;">글번호</th>
							<th style="width: auto;">신고제목</th>
							<th style="width: auto;">신고내용</th>
							<th style="width: auto;">글 작성자</th>
							<th style="width: auto;">신고 대상자</th>
							<th style="width: auto;">신고유형</th>
							<th style="width: auto;">작성일</th>
							<th style="width: auto;">수정일</th>
							<th style="width: 70px;">수락버튼</th>
							<th style="width: 70px;"></th>
						</tr>
						
						<c:forEach var="b" items="${ blist }">
						<tr>
							<td>${ b.blkId}</td>
							<td>${ b.blkTitle }</td>
							<td>${ b.blkContent }</td>
							<td>${ b.blkWriter }</td>
							<td>${ b.blkTargetId }</td>
							<td>${ b.blkType}</td>
							<td>${ b.blkCreateDate}</td>
							<td>${ b.blkModifyDate }</td>
							<td><input type="button" value="수락" class="w3-button w3-blue" onclick="javascript:location.href='shingoYes.do?singoNum=${ b.blkId}'" ></td>
							<td><input type="button" value="거부" class="w3-button w3-red" onclick="javascript:location.href='shingoNo.do?singoNum2=${ b.blkId}'" ></td>
						</tr>
						</c:forEach>
					</table>
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
	<!-- 푸터  -->
	 <%@ include file="/WEB-INF/views/common/footer.jsp" %>	    
	<!-- /푸터 -->
</body>
</html>