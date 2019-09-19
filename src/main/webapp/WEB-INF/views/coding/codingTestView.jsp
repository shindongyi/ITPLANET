<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	 <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta charset="utf-8">
	<title>코딩 테스트</title>
	<link rel="stylesheet" media="all" href="${ contextPath }/resources/css/coding.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/77f9f5360f.js"></script>
	
	<style>
		#editor {
		  position: absolute;
		  top: 0;
		  right: 0;
		  bottom: 0;
		  left: 0;
		}
		
		.fasd{
			font-size: 25px;
		    margin-right: 10px;
		    cursor: pointer;
		}
	</style>
</head>
<body class="skill-checks skill-checks-show"
      data-ns=""
      data-controller="skill_checks"
      data-action="show"
      data-defaultLocale="ko"
      data-locale="ko">

	<div class="main theme-dark">
	  
	<div class="challenge-topbar topbar-wrap">
	  <h6 class="nav-header">
	  	<i class="fas fa-angle-left fasd"></i>
	    <span class="level">코딩 테스트 Q.${ co.qNum }</span>
	  </h6>
	</div>
	
	<ul class="challenge-nav nav nav-tabs nav-tabs-dark task-tab" id="tab" role="tablist">
	    <li class="challenge-item nav-item" id="tour1">
	        <div class="info" style="color: white; margin-top: 5px;">
	          	<div class="title"> 문제1 </div>
	          	<div class="score">
	            	<span id="customer-score-algorithm-908">O</span>
	            	<span> / X </span>
	          	</div>
	        </div>
		</li>
	  
	</ul>
	
	
	<div class="challenge-content">
		<div class="main-section">
		  <div class="guide-section" id="tour2" style="width:700px;">
		    <div class="guide-section-description">
		    	
		    	<p style="font-size: 35px; color: wheat;">제목 : ${ co.qTitle }</p>
		      <h6 class="guide-section-title">문제 설명</h6>
		      	<div class="markdown solarized-dark">
		      		<p>${co.qContent }</p>
		
				<h5>제한 사항</h5>
		
				<ul>
					<c:if test="${ co.qLimitation != null }">
						<li>${ co.qLimitation }</li>
					</c:if>
					<c:if test="${ co.qLimitationTwo != null }">
						<li>${ co.qLimitationTwo }</li>
					</c:if>
					<c:if test="${ co.qLimitationThree != null }">
						<li>${ co.qLimitationThree }</li>
					</c:if>
					<c:if test="${ co.qLimitationFour != null }">
						<li>${ co.qLimitationFour }</li>
					</c:if>
					<c:if test="${ co.qLimitationFive != null }">
						<li>${ co.qLimitationFive }</li>
					</c:if>
					
				</ul>
		
				<h5>입출력 예</h5>
				<table class="table">
		        	<thead>
		        		<tr>
							<th>input</th>
							<th>return</th>
						</tr>
					</thead>
		        	<tbody>
		        		<c:if test="${ co.qExData != null }">
		        			<tr>
								<td>${ co.qExData }</td>
								<td>${ co.qExResult }</td>
							</tr>
		        		</c:if>
		        		<c:if test="${ co.qExDataTwo != null }">
		        			<tr>
								<td>${ co.qExDataTwo }</td>
								<td>${ co.qExResultTwo }</td>
							</tr>
		        		</c:if>
		        		<c:if test="${ co.qExDataThree != null }">
		        			<tr>
								<td>${ co.qExDataThree }</td>
								<td>${ co.qExResultThree }</td>
							</tr>
		        		</c:if>
		        		
					</tbody>
		      </table>
		     </div>
		    </div>
		  </div>
		  <div class="run-section">
		    <div id="tour3" class="code-section">
		      <div class="editor">
		        <ul class="nav nav-pills editor-nav-pills tap-form">
				    <li class="nav-item">
				      <a href="#" class="btn-tab nav-link active"
				         data-id="2760"
				         data-language="java">
				        Solution.java </a>
				    </li>
				</ul>
		        <br>
		          
				<div id="code" style="width:800px; height:200px;">class Solution {

	public int question(int a, int b) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question(1, 2);
		int result2 = sol.question(3, 4);
		
		System.out.println(result);
		System.out.println(result2);
	}
}</textarea>
		      </div>
		    </div>
		    <br><br>
		
		    <div class="output-section" id="tour6">
		      <div class="tab-header">
		        <div id="output-title" class="output-title">
		         	<span style="color:white;">실행 결과</span>
		        </div>
		      </div>
		      <div class="console tab-content">
		        <div id="output" class="console-output tab-pane fade in active show">
		          실행 결과가 여기에 표시됩니다.
		          <div id="outputResult">
		          	<pre class='console-content'></pre>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		</div>
		
		<div class="button-section">
		  <div class="testcase-button">
		  </div>
			
		  <div class="func-buttons">
		    <!-- <a id="tour8" class="btn btn-dark" style="color:white;" data-toggle="tooltip" data-placement="top" title="힌트를 보시려면 클릭 하시면 열립니다.">힌트보기</a> -->
		    <button name="button" type="submit" id="reset-code" class="btn btn-dark" data-toggle="tooltip" data-placement="top" title="에디터의 코드가 초기화됩니다. 초기화 버튼을 누르기 이전 코드 복원하려면 코드 에디터에 커서를 두고 Ctrl-Z를 눌러 보세요.">코드 초기화</button>
		    <div id="tour4">
		      <button name="button" type="submit" id="run-code" class="btn btn-dark" data-toggle="tooltip" data-placement="top" title="기본 테스트 케이스가 정상 동작하는지 확인합니다.">실행</button>
		    </div>
		    <div id="tour5">
		      <button name="button" type="submit" id="submit-code" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="코드를 완성하였으면 제출을 할 수 있습니다.">완성 후 제출</button>
		    </div>
		  </div>
		</div>
	
	</div>
	</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.6/ace.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.2.6/ext-language_tools.js"></script>
	
	<script>

		
		$(function(){
			$('[data-toggle="tooltip"]').tooltip();
			
			$('#code').each(function(){
				var $pre = $(this);
				var lang = $pre.data('brush');
				var theme = 'eclipse';
				
				ace.require("ace/ext/language_tools");
				var editor = ace.edit( $pre[0]);
				
				editor.setTheme('ace/theme/' + theme);
				editor.getSession().setMode('ace/mode/java');
				editor.setOptions({
				    enableBasicAutocompletion: true,
				    enableSnippets: true,
			        enableLiveAutocompletion: false

				});
				
				editor.$blockScrolling = Infinity;
				
				/* 코드 실행 */
				$('#run-code').click(function(){
					var lastLine = editor.getSession().getLength();
					editor.gotoLine(lastLine, lastLine,true);
					editor.removeLines();
					var editCode = editor.getValue();
					editor.insert("\n}");
					
					$('#codeCopy').val(editCode + $("#startCode").val());
					
					$.ajax({
						url:"compileCode.do",
						data: {code: $("#codeCopy").val()},
						type: "post",
						dataType: "json",
						success: function(data){
							$outputResult = $("#outputResult");
							$outputResult.html("");
							
							var $pre;
							
							if(data.length > 0){
								$pre = $("<pre class='console-content'>").text(decodeURIComponent(data.replace(/\+/g, " ")));
							}
							
							$outputResult.append($pre);
						}
					});
				});
				
				var firstTxt = editor.getValue();
				
				/* 코드 초기화 */
				$('#reset-code').click(function(){
					editor.setValue(firstTxt);
					editor.gotoLine(4, 4,true);
				});
				
				/* 제출하고 완료 */
				$("#submit-code").click(function(){
					alert($.trim($("textarea").val()));
				});
			});
		});
		
		
		/* 코딩 리스트로 돌아가기 */
		$('.fasd').click(function(){
			location.href = 'codingTestListView.do';
		});
		
		
	</script>

	
</body>
</html>