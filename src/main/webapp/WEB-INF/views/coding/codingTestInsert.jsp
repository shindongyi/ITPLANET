<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코딩 테스트 작성</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/coding/codingTestInsert.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/menubar.jsp" %>
	
	<h2 style="text-align:center">코딩테스트 글 작성하기</h2>
	<div class="container">
		
		<form id="contact-form" class="contact-form col-lg-12 mx-lg-auto" method="post" action="codingInsert.do">					
			        <div class="form-row">
		                <div class="form-group col-md-12">
		                    <label for="cname">제목</label>
		                    <input type="text" class="form-control" id="cname" name="qTitle" >
		                </div>                    
		                
		                <div class="form-group col-md-12">
		                	<label for="amessage">문제 설명</label>
		                    <textarea class="form-control" id="amessage" name="qContent" rows="6" style="resize:none;"></textarea>
		                </div>
		                <div class="form-group col-md-12" id="limit">
		                    <label for="bmessage">제한 사항</label>
		                    <button type="button" class="col-md-1 pull-right btn btn-default" id="btnRem">-</button>
		                    <button type="button" class="col-md-1 pull-right btn " id="btnAdd">+</button>
		                    <input type="text" class="form-control col-md-6 " id="bmessage" name="limitList">
		                </div>
		                <div class="form-group col-md-12 example">
		                	<label for="list_table">입출력 예시</label>
		                    <table class="exampleInsert" id="list_table">
		                    	<colgroup>
									<col style="width:200px;">
									<col style="width:200px;">
									<col style="width:200px;">
								</colgroup>
								<thead>
									<tr>
										<th>입력값</th>
										<th>리턴값</th>
										<th>Action</th>
									</tr>
								</thead>
		                    </table>
		                    
		                    <hr>
							
							<table  id="append_table">
							<colgroup>
							    <col style="width:200px;">
								<col style="width:200px;">
								<col style="width:200px;">
							</colgroup>
							
							<thead>
							   <tr>
							      <th>입력값</th>
							      <th>리턴값</th>
							      <th>Action</th>
							   </tr>
							</thead>
							
							<tbody>
							   <tr>
							      <td><input type="text" class="form-control" id="add_no"></td>
							      <td><input type="text" class="form-control" id="add_name"></td>
							      <td><button type="button" id="append_row" class="btn btn-block py-2">데이터 추가</button></td>
							   </tr>
							</tbody>
							
							</table>
		                </div>
		                
		                <div class="form-group col-md-6 pull-right">
		                	<button type="reset" class="btn col-md-5 py3" id="reBtn">초기화</button>
		                    <button type="submit" class="btn col-md-6 py-3 pull-right">코딩테스트 글 작성</button>
		                    
		                </div>                       
		            </div><!--//form-row-->
		        </form>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>	 
	<script type="text/javascript">
		$('#append_row').on("click", function () {
			var examCount = $("#list_table tr").length;
			if(examCount > 3){
				alert("입출력 예시는 3개 까지 가능합니다.");
				return false;
			}
			
			$('#list_table').append(
				$('<tr name="exam">').append(
					$('<td>').append($('#add_no').val()),
					$('<td>').append($('#add_name').val()),
					$('<td>').append(
						// property와 attribute의 차이!!
						$('<a>').prop('href', '#list_table').addClass('delete-link').append('Delete')
						// <a href="#" class="delete-link">Delete</a>
					),
					$('<input type="hidden" name="exData">').val(""),
					$('<input type="hidden" name="exData">').val($('#add_no').val()),
					$('<input type="hidden" name="exResult">').val(""),
					$('<input type="hidden" name="exResult">').val($('#add_name').val())
				)
			);
			
			$('#add_no').val("");
			$('#add_name').val("");
		});
		
		$('#list_table').on("click", ".delete-link", function () {
		  /*
		  <tr>
		    <td>3</td>
		    <td>seok</td>
		    <td>901217</td>
		    <td>
		      <a href="#" class="delete-link">Delete</a>
		    </td>
		  </tr>
		  */
		  // this == a의 부모의 부모는 tr태그
		  $(this).parent().parent().remove();
		});
		
	
		$('#btnAdd').on("click",function(){
			var limitCount = $("input[name=limitList]").length;
			if(limitCount > 4){
				alert("제한 사항은 5개 까지 가능합니다.");
				return false;
			}
			$('#limit').append('<input type="text" class="form-control col-md-6 " id="bmessage" name="limitList"><br>');
		
		});
		$('#btnRem').on("click",function(){
			$('input[name=limitList]:last').remove();
		});
		
		$("#reBtn").on("click",function(){
			var limitCount = $("input[name=limitList]").length;
			var examCount = $("#list_table tr").length;
			
			for(var i = limitCount; i > 1; i-- ){
				$('input[name=limitList]:last').remove();	
			}
			
			for(var j = examCount; j > 1; j--){
				$('#list_table tr:last').remove();
			}
		});
	
	</script>
</body>
</html>