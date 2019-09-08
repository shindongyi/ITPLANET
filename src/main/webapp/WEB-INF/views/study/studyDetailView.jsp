<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel='stylesheet' href="${ contextPath }/resources/css/bootstrap.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>

<style>

	#replySelectTable tr td {padding:10px 0;border-bottom:1px solid #ededed;width:916px;}
	
	form *{
		font-size : 20px;
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
	
	th{
  		color: white;
 		background-color: #003458;
	}
	
	#detailTable td{line-height:50px;}
	
	#commentDiv {
    	position: relative;
	    width: 1100px;
	    height: auto;
	    /* border: 1px solid #b6b6b6; */
	    left: 50%;
	    margin-left: -545px;
	    /* margin-left: 230px; */
	    margin-bottom: 80px;
	    padding: 20px 60px;
	    border-bottom: 2px solid black;
	    font-family: 'Noto Sans KR', sans-serif;
	  }
	
	#commentDiv>div{
		position: relative;
		width: 1000px;
		height: auto;
		margin-left: auto;
		margin-right: auto;
	}
	
	#commentDiv ul {
		list-style: none;
	}
	
	.commentList {
		overflow: auto;
		padding-right: 5px;
		height: 400px;
	}
	
	.commentList li {
		margin: 20px 0;
	}
	
	.comment-reply .comment-item {
		margin-top: 6px;
	    background: #efefef;
	    overflow: visible;
	    border-radius: 4px;
	    padding: 8px 12px;
	    position: relative;
	}
	
	.comment-reply .comment-item:before {
		content: '';
	    position: absolute;
	    left: 17px;
	    top: -4px;
	    width: 8px;
	    height: 8px;
	    background: #efefef;
	    transform: rotate(45deg);
	}
	
	.name {
		font-size: 14px;
		font-weight: 400;
	}
	
	.createDate {
		font-size: 13px;
		font-weight: 400;
		margin-left: 20px;
		margin-right: 50px;
	}
	
	.text {
		margin-top: 0px;
		font-weight: 300;
	}
	
	.comment-form {
		border-top: 0;
		padding: 0;
		width: 100%;
	}
	.inner{
		margin-top : 20px;
		padding-bottom : 55px;
	}
	.inner>.input-text {
		width: 100%;
	}
	
	.input-text {
		left: 0;
		right: 64px;
		font-size: 14px;
		font-weight: 300;
		width: 94%;
		position: absolute;
		height: 35px;
		display: inline-block;
		vertical-align: middle;
	}
	
	.input-text input {
		line-height: 16px;
		border: 1px solid #acacac;
		box-sizing: border-box;
		padding: 2px 8px;
		border-radius: 2px;
	}
	
	.inner {
		position: relative;
	    height: 32px;
	    width: 100%;
	}
	
	.commentAddBtn {
		position: absolute;
	    height: 100%;
	    right: 0;
	    width: 56px;
	    color: white;
	    background: #003458;
	    border-radius: 20px;
	    height: 34px;
	    cursor: pointer;
	}
	
	.commentAddBtn:hover{
		background-color: white;
	 	 color: black;
	 	 box-shadow: 0 0 9px 3px #003458;
	 	 border-radius:20px;
	}
	
	.replyBtn, .coDelBtn, .coUpdateBtn {
		margin: 0 2px;
		height: auto;
		width: auto;
		font-size:12px;
		font-weight: 300;
		cursor: pointer;
	}
	
</style>
<title>스터디 상세</title>
</head>
<body>
<div class="row align-content-center">
		<div class="col-md-3" style="max-width:20.85%;"></div>
		<div class="col-md-7" style="margin-bottom: 50px;">
		<br>
			<h2 class="text-center">스터디 상세</h2>
			<br><br>
			<p></p>
			<form action="studyUpdateView.do" method="get" name="SWriter" id="SWriter">
				<div class="table table-responsive tdiv" style="border-radius:20px;">
					<table class="table" style="text-align: center;" id="detailTable">
						<tr>
							<th style="width:150px;">제목</th>
							<td colspan="3">
								${ study.sTitle }
							</td>
						</tr>
						<tr>
							<th>스터디 종류</th>
							<td style="width:500px;">
								${ study.sCategory } - ${ study.sCaName }
							</td>
							<th style="width:200px;">작성자</th>
							<td align="center" style="width:194px;">
								${ study.nickName }
							</td>
						</tr>

						<tr>
							<th>스터디멤버<br>현황</th>
							<td id="studyMem1">
								<c:forEach items="${fn:split(chatMember,',')}" var="cm" varStatus="status">
									<c:if test="${ !status.last }">
										${ cm },
									</c:if>
									<c:if test="${ status.last }">
										${ cm }
									</c:if>
								</c:forEach>
							</td>
							<td>
								[ <c:forEach items="${fn:split(chatMember,',') }" var="cm" varStatus="status">
									<c:if test="${ status.last }">
										 ${status.index + 1 }
									</c:if>
								</c:forEach> / ${ study.sMember } ]
								<input type="hidden" name="sMember" value="${ study.sMember }">
							</td>
							<td id="studyMem">
								<c:if test="${ loginUser.nickName ne study.nickName }">
									<c:set var="check" value="1"/>
									<c:forEach items="${fn:split(chatMember,',') }" var="cm" varStatus="status">
										<c:if test="${ cm eq loginUser.nickName }">
											<c:set var="check" value="2"/>
										</c:if>
									</c:forEach>
									
									<c:if test="${ check eq 2 }">
										<input type="button" value="스터디 취소" onclick="javascript:location.href='studyCancel.do?sId=${study.sId}'">
									</c:if>
									<c:if test="${ check eq 1 }">
										<input type="button" value="스터디 신청" onclick="javascript:location.href='studyAdd.do?sId=${study.sId}'">
									</c:if>
								</c:if>
								
							</td>
 						</tr>
 						<tr>
 							<th>모임장소</th>
 							<td colspan="3">${ study.lName }<input type="hidden" name="sLocation" value="${ study.sLocation }"></td>
 						</tr>

						<tr style="background: white;">
							<th style="border-bottom-left-radius:20px;">글내용</th>
							<td colspan="3">
								<textarea rows="10" cols="50" name="content" class="form-control" readonly style="border-radius:20px; resize: none;">${ study.sContent }</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="text-center" align="right">
								<c:if test="${ loginUser.userId.equals( study.sWriter) }">
									<input type="button" value="수정" onclick="SWriter.submit();">
									<input type="button" value="삭제" onclick="deleteBtn();">
								</c:if>
								<input type="button" value="목록" onclick="javascript:location.href='studyListView.do'">
							</td>
						</tr>

					</table>
				</div>
			</form>
			
			<div id="commentDiv">
      <h2 style="margin-left: -60px; padding-bottom : 10px;">상품문의</h2>
      <hr>

      <div>
        <ul class="commentList">
        <%for(int i = 0 ;i < 5; i++){ %>
          <li class="comment-item">
            <div class="area-txt">
              <span class="name">김수민</span>
              <span class="createDate">2019-07-18</span>
              <button class="replyBtn">답글</button>
              <p class="text">어떤 택배로 발송되나요?</p>
            </div>
            <ul class="comment-reply">
              <li>
                <div class="comment-item">
                  <div class="area-user">
                    <strong class="name">임규짱</strong>
                    <span class="createDate">2019-07-18</span>
                    <button class="coUpdateBtn">수정</button>
                    <button class="coDelBtn">삭제</button>
                  </div>
                  <p class="text">
                    <b>김수민님</b>
                    우체국 택배로 보내드립니다~^^
                  </p>
                </div>
              </li>
            </ul>
          </li>
          <%} %>
         </ul>
        <!-- <form class="comment-form"> -->
        <div class="inner" id="deliveryAng">
          <label class="input-text">
            <input type="text" class="input-text" id="add-comment" name="comment" placeholder="댓글을 남겨주세요">
          </label>
          <button class="commentAddBtn" id="repleSubmit">등록</button>
        </div>
      <!-- </form> -->
      </div>

      <br>
    </div>
			
		</div>
		
		<div class="col-md-3" style="max-width:20.85%;"></div>
	</div>
	
	<script>
		function deleteBtn(){
			var bool = confirm("정말로 삭제하시겠습니까?");
			if(bool){
				$('#SWriter').attr("action", "deleteStudy.do?sId=${study.sId}");
				$('#SWriter').submit();
			}
		}
		
		$(function(){
			getReplyList();
			
			setInterval(function(){
				getReplyList();
			}, 10000);
		});
		
		$("#repleSubmit").on("click", function(){
			var srContent = $("#add-comment").val();
			var sId = ${ study.sId};
			
			$.ajax({
				url: "addStudyReple.do",
				data: {srContent:srContent, sId:sId},
				type:"post",
				success: function(data){
					if(data == "success"){
						getReplyList();
						$("#add-comment").val("");
					}
				}
			});
		});
		
		function getReplyList(){
			var sId = ${ study.sId };
			
			$.ajax({
				url: "studyRepleList.do",
				data: {sId:sId},
				dataType: "json",
				success: function(data){
					$ulBody = $(".commentList");
					$ulBody.html("");
					
					var $li;
					var $div;
					var $spanName;
					var $spanModifyDate;
					var $pContent;
					
					if(data.length > 0){
						for(var i in data){
							$li = $("<li class='comment-item'>")
							$div = $("<div class='area-txt' style='border-bottom:2px solid #003458;'>");
							$spanName = $("<span class='name'>").text(decodeURIComponent(data[i].srWriter.replace(/\+/g," ")));
							$spanModifyDate = $("<span class='createDate'>").text(data[i].srModifyDate);
							$pContent = $("<p class='text'>").text(decodeURIComponent(data[i].srContent.replace(/\+/g, " ")));
							
							$li.append($div);
							$li.append($spanName);
							$li.append($spanModifyDate);
							$li.append($pContent);
							$ulBody.append($li);
						}
					}else{
						$li = $("<li class='comment-item'>")
						$div = $("<div class='area-txt' style='border-bottom:2px solid #003458;'>");
						$pContent = $("<p class='text'>").text("등록된 댓글이 없습니다.");
						
						$li.append($div);
						$li.append($pContent);
						$ulBody.append($li);
					}
				}
			});
		}
	</script>
</body>
</html>