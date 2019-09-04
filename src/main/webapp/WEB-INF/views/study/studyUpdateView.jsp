<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script src="${ contextPath }/resources/js/select2.min.js"></script>
<link rel='stylesheet' href="${ contextPath }/resources/css/bootstrap.css">
<link href="${ contextPath }/resources/css/select2.min.css" rel="stylesheet"/>
<script>
	var ns = $.noConflict(true);
	ns(document).ready(function() {
   		 ns('.studyList').select2();
   		 ns('#local').select2();
});
</script>
<title>스터디 수정</title>
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 20px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit], input[type=button] {
  background-color: #003458;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 20px;
  cursor: pointer;
  float: none;
}

input[type=submit]:hover, input[type=button]:hover{
  background-color: white;
  color: black;
  box-shadow: 0 0 9px 3px #003458;
  border-radius:20px;
}

textarea {
  width: 100%;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  background-color: #f8f8f8;
  font-size: 16px;
  resize: none;
}

th{
  color: white;
  background-color: #003458;
}

td{
  background-color: white;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>

<div class="row align-content-center">
		<div class="col-md-3" style="max-width:20.85%;"></div>
		<div class="col-md-7">
		<br>
			<h2 class="text-center">스터디 수정</h2>
			<br>
			<p></p>
			<form onsubmit="return check()" action="updateStudy.do" method="post" name="writer">
				<div class="table table-responsive" style="border-radius:30px;">
					<table class="table table-striped" style="text-align: center;">
						<tr>
							<th style="vertical-align: middle;">제목</th>
							<td colspan="3">
								<input type="text" class="form-control" name="sTitle" style="text-align: center;" value="${ study.sTitle }">
								<input type="hidden" name="sId" value="${ study.sId }">
							</td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">모임장소</th>
							<td>
								<select id="local" class="local" name="sLocation" style="width:300px;">
									<c:forEach items="${ list }" var="lo">
										<c:if test="${ study.sLocation == lo.lCode}">
											<option value="${ lo.lCode }" selected="selected">${ lo.lName }</option>
										</c:if>
										<c:if test="${ study.sLocation != lo.lCode }">
											<option value="${ lo.lCode }">${ lo.lName }</option>
										</c:if>
									</c:forEach>
								</select>
							</td>
							<th style="vertical-align: middle;">스터디 멤버</th>
							<td>
								<input type="text" placeholder="숫자만 입력하세요(최대모집인원 10)" class="form-control" name="sMember" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${ study.sMember }">
							</td>
						</tr>

						<tr>
							<th style="vertical-align: middle;">스터디 종류</th>
							<td>
								<select id="study1" class="studyList" name="sCategory" style="width:300px;">
									<c:if test="${ study.sCategory eq '자격증' }">
										<option value="자격증" selected="selected">자격증</option>
										<option value="공모전">공모전</option>
									</c:if>
									<c:if test="${ study.sCategory eq '공모전' }">
										<option value="자격증">자격증</option>
										<option value="공모전" selected="selected">공모전</option>
									</c:if>
								</select>
							</td>
							<td colspan="2">
								<select id="study2" class="studyList" name="sCaName" style="width: 300px;">
									<option value="정처기">정처기</option>
								</select>
							</td>
						</tr>

						<tr>
							<th style="vertical-align:top; border-bottom-left-radius: 30px;">글내용</th>
							<td colspan="3"><textarea rows="10" cols="50" name="sContent"
									class="form-control" style="border-radius:20px;">${ study.sContent }</textarea></td>
						</tr>
						<tr style="width:77px;">
							<td colspan="4" class="text-center">
								<input type="submit" value="수정완료"> &nbsp;
								<input type="button" value="취소" onclick="cancelBtn();">
							</td>
						</tr>

					</table>


				</div>
			</form>
		</div>
		<div class="col-md-3" style="max-width:20.85%;"></div>
	</div>
	
	<%-- 멤버가 있을때 해당 멤버보다 적게 다시 설정하는건 막아놓기  --%>
	<script>
		function cancelBtn(){
			var bool = confirm("수정을 취소하시겠습니까? 취소하시면 이전페이지로 돌아갑니다.");
			if(bool){
				location.href='javascript:history.go(-1)';
			}
		}
		
		function check(f){
			var f = document.writer;
			if(f.sTitle.value == ""){
				f.sTitle.focus();
				alert('제목을 입력하세요.');
				return false;
			}else if(f.sMember.value == ""){
				f.sMember.focus();
				alert('모집인원을 입력하세요.');
				return false;
			}else if(f.sContent.value == ""){
				f.sContent.focus();
				alert('내용을 입력하세요.');
				return false;
			}else if(f.sMember.value >10){
				f.sMember.value = "";
				f.sMember.focus();
				alert('모집인원은 최대 10명입니다.');
				return false;
			}else{
				alert('게시물수정이 완료되었습니다.');
				f.submit();
				return true;
			}
		}
	</script>

</body>
</html>