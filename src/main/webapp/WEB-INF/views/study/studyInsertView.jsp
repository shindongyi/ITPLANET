<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/js/select2.min.js"></script>
<link rel='stylesheet' href="<%= request.getContextPath() %>/css/bootstrap.css">
<link href="<%= request.getContextPath() %>/css/select2.min.css" rel="stylesheet"/>

<script>
	
	var ns = $.noConflict(true);
	ns(document).ready(function() {
   		 ns('.studyList').select2();
   		 ns('#local').select2();
	});
	
</script>
<title>스터디 모집</title>
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
			<h2 class="text-center">스터디 모집</h2>
			<br>
			<p></p>
			<form onsubmit="return check()" action="" method="post" name="writer">
				<div class="table table-responsive" style="border-radius:30px;">
					<table class="table table-striped" style="text-align: center;">
						<tr>
							<th style="vertical-align: middle;">제목</th>
							<td colspan="3"><input type="text" class="form-control" name="title" style="text-align: center;"></td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">모임장소</th>
							<td>
								<select id="local" class="local" name="local" style="width:300px;">
									<option value="1">서울 강서구</option>
								</select>
							</td>
							<th style="vertical-align: middle;">스터디 멤버</th>
							<td>
								<input type="text" placeholder="숫자만 입력하세요(최대모집인원 10)" class="form-control" name="human" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							</td>
						</tr>

						<tr>
							<th style="vertical-align: middle;">스터디 종류</th>
							<td>
								<select id="study1" class="studyList" name="study" style="width:300px;">
									<option value="1">자격증</option>
									<option value="2">공모전</option>
								</select>
							</td>
							<td colspan="2">
								<select id="study2" class="studyList" name="study" style="width: 300px;">
									<option value="1">정처기</option>
								</select>
							</td>
						</tr>

						<tr>
							<th style="vertical-align:top; border-bottom-left-radius: 30px;">글내용</th>
							<td colspan="3"><textarea rows="10" cols="50" name="content"
									class="form-control" style="border-radius:20px;"></textarea></td>
							
						</tr>
						<tr style="width:77px;">
							<td colspan="4" class="text-center">
								<input type="submit" value="작성완료"> &nbsp;
								<input type="button" value="취소">
							</td>
						</tr>

					</table>


				</div>
			</form>
		</div>
		<div class="col-md-3" style="max-width:20.85%;"></div>
	</div>
</body>
</html>