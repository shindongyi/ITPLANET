<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${ contextPath }/resources/css/mainView/activity.css">

<title>Insert title here</title>
<style>
	#updateComp, input[type=button] {
  	background-color: #003458;
  	color: white;
  	padding: 12px 20px;
  	border: none;
  	border-radius: 20px;
  	cursor: pointer;
  	float: none;
	}

	#updateComp:hover, input[type=button]:hover{
  	background-color: white;
 	 color: black;
 	 box-shadow: 0 0 9px 3px #003458;
 	 border-radius:20px;
	}
	
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
		width: 89%;
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
	    width: 100px;
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
</style>
</head>
<body>
<c:import url="../common/menubar.jsp"/>
	<form action="updateCompetitionView.do?cId=${ competition.cId }" name="cWrite" id="cWrite">
	<div id="introduce">
		<section class="title" style="top: -170px; transform: none;">
	    <div class="wrap">
	    	<input type="hidden" name="cId" value="${ competition.cId }">
	      <p class="badges"><span>공모전</span></p>
	      <figure style="background-image: url('${ contextPath }/resources/compeloadFiles/${ cAttachment.changeName }');"></figure>
	      <div class="content">
	        <h1>${ competition.cTitle }</h1>
	        <p class="company">${ competition.cWriter }</p>
	        <p class="info"><span class="viewcount">${ competition.cCount }</span></p>
	        <c:if test="${ competition.cWriter == loginUser.nickName }">
	        	<p class="company"><input type="submit" id="updateComp" value="수정하기"><input type="button" onclick="deleteComp();" value="삭제하기"></p> 
	        </c:if>
	      </div>
	    </div>
	  </section>
	  
	  <section class="tab" style="top: 0px; transform: none;">
	    <div class="wrap">
	      <a id="introP" class="active" href="javascript:introSelect();"><span class="text">소개</span></a>
	      <a id="replyP" href="javascript:replySelect();"><span class="text">댓글</span></a>
	    </div>
	  </section>
	  
	  <div id="container" style="padding-top: 0px;">
	  	<div class="section">
	  		<h2>공모전 기간</h2>
			
	  		<p class="dday">${ competition.cStartDate } ~ ${ competition.cDueDate }</p>
	  	</div>
	  	<div class="section">
	  		<h2>상세내용</h2>
	  		<textarea rows="5" cols="120" readonly="readonly" style="resize: none; border: none;">${ competition.cContent }</textarea>
	  	</div>
	  	<div class="poster">
	  		<img src="${ contextPath }/resources/compeloadFiles/${ cAttachment.changeName }">
	  	</div>
	  	<div class="bottombar">
	  		<a class="scrap">
	  			<span>스크랩</span>
	  		</a>
	  	</div>
	  </div>
	  <div id="replyPage" style="display:none;">
	  	<div id="commentDiv">
	      <hr>
	
	      <div>
	        <ul class="commentList">
	         </ul>
	        <div class="inner" id="deliveryAng">
	          <label class="input-text">
	            <input type="text" class="input-text" id="add-comment" name="comment" placeholder="댓글을 남겨주세요">
	          </label>
	          <input type="button" class="commentAddBtn" id="repleSubmit" value="등록">
	        </div>
	      </div>
	
	    </div>
	  </div>
  </div>
  </form>
  <script>
  	function deleteComp(){
  		var bool = confirm("정말로 삭제하시겠습니까?");
		if(bool){
			$('#cWrite').attr("action", "delectCompetition.do?cId=${competition.cId}");
			$('#cWrite').submit();
		}
  	}
  	
  	function introSelect(){
  		$('#container').show();
  		$('#replyPage').hide();
  		
  		$('#introP').attr('class', 'active');
  		$('#replyP').removeAttr('class');
  	}
  	
  	function replySelect(){
  		$('#container').hide();
  		$('#replyPage').show();
  		$('#add-comment').focus();
  		
  		$('#introP').removeAttr('class');
  		$('#replyP').attr('class', 'active');
  	}
  	
  	$(function(){
  		getReplyList();
  		
  		setInterval(function(){
  			getReplyList();
  		}, 10000);
  	});
  	
  	$("#repleSubmit").on("click", function(){
  		var crContent = $("#add-comment").val();
  		var cId = ${ competition.cId };
  		
  		$.ajax({
  			url: "addCompetitionReple.do",
  			data: {crContent: crContent, cId: cId},
  			type: "post",
  			success: function(data){
  				if(data == "success"){
  					getReplyList();
  					$("#add-comment").val("");
  				}
  			}
  		});
  	});
  	
  	function getReplyList(){
  		var cId = ${ competition.cId };
  		
  		$.ajax({
  			url: "competitionReplyList.do",
  			data: {cId:cId},
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
						$spanName = $("<span class='name'>").text(decodeURIComponent(data[i].userId.replace(/\+/g," ")));
						$spanModifyDate = $("<span class='createDate'>").text(data[i].crModifyDate);
						$pContent = $("<p class='text'>").text(decodeURIComponent(data[i].crContent.replace(/\+/g, " ")));
						
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
  
 

<!-- 푸터  -->
<c:import url="../common/footer.jsp"/>
<!-- /푸터 -->
</body>
</html>