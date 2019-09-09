<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	 <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta charset="utf-8">
	<title>코딩 테스트</title>
	<link rel="stylesheet" media="all" href="${ contextPath }/resources/css/coding.css" />
	<link href="${ contextPath }/resources/codemirror/lib/codemirror.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="${ contextPath }/resources/codemirror/lib/codemirror.js"></script>
	<script type="text/javascript" src="${ contextPath }/resources/codemirror/mode/clike.js"></script>
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
	    <span class="level">스킬 체크 테스트 Level.1</span>
	  </h6>
	</div>
	
	<ul class="challenge-nav nav nav-tabs nav-tabs-dark task-tab" id="tab" role="tablist">
	    <li class="challenge-item nav-item" id="tour1">
	        <div class="info" style="color: white; margin-top: 5px;">
	          	<div class="title"> 문제1 </div>
	          	<div class="score">
	            	<span id="customer-score-algorithm-908">0</span>
	            	<span> / (50.0) </span>
	          	</div>
	        </div>
		</li>
	  
	</ul>
	
	
	<div class="challenge-content">
		<div class="main-section">
		  <div class="guide-section" id="tour2" style="width:700px;">
		    <div class="guide-section-description">
		      <h6 class="guide-section-title">문제 설명</h6>
		      	<div class="markdown solarized-dark"><p>String형 배열 seoul의 element중 <q>Kim</q>의 위치 x를 찾아, <q>김서방은 x에 있다</q>는 String을 반환하는 함수, solution을 완성하세요. seoul에 <q>Kim</q>은 오직 한 번만 나타나며 잘못된 값이 입력되는 경우는 없습니다.</p>
		
				<h5>제한 사항</h5>
		
				<ul>
					<li>seoul은 길이 1 이상, 1000 이하인 배열입니다.</li>
					<li>seoul의 원소는 길이 1 이상,  20 이하인 문자열입니다.</li>
					<li><q>Kim</q>은 반드시 seoul 안에 포함되어 있습니다.</li>
				</ul>
		
				<h5>입출력 예</h5>
				<table class="table">
		        	<thead>
		        		<tr>
							<th>seoul</th>
							<th>return</th>
						</tr>
					</thead>
		        	<tbody>
		        		<tr>
							<td>[<q>Jane</q>, <q>Kim</q>]</td>
							<td><q>김서방은 1에 있다</q></td>
						</tr>
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
		          <textarea id="code" name="code" onkeydown="if(event.keyCode===9){var v=this.value,s=this.selectionStart,e=this.selectionEnd;this.value=v.substring(0, s)+'\t'+v.substring(e);this.selectionStart=this.selectionEnd=s+1;return false;}">public class Solution {

	public static void main(String[] args) {
		
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
		          <div>
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
		    <a id="tour8" class="btn btn-dark" style="color:white;" data-toggle="tooltip" data-placement="top" title="힌트를 보시려면 클릭 하시면 열립니다.">힌트보기</a>
		    <button name="button" type="submit" id="reset-code" class="btn btn-dark" data-toggle="tooltip" data-placement="top" title="에디터의 코드가 초기화됩니다. 초기화 버튼을 누르기 이전 코드 복원하려면 코드 에디터에 커서를 두고 Ctrl-Z를 눌러 보세요.">코드 초기화</button>
		    <div id="tour4">
		      <button id="startBtn" name="button" type="submit" id="run-code" class="btn btn-dark" data-toggle="tooltip" data-placement="top" title="기본 테스트 케이스가 정상 동작하는지 확인합니다.">실행</button>
		    </div>
		    <div id="tour5">
		      <button name="button" type="submit" id="submit-code" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="코드를 완성하였으면 제출을 할 수 있습니다.">완성 후 제출</button>
		    </div>
		  </div>
		</div>
	
	</div>
	</div>
	<script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		  
		  var code = $("#code")[0];
		  var editor = CodeMirror.fromTextArea(code, {
			  mode: "text/x-java",
			 lineNumbers : true
		  }).setSize("780", "300");
		  
		  $("#startBtn").on("click", function(){
			 alert(editor.lineCount()); 
		  });
		  
		});
		
		$("#submit-code").click(function(){
			alert($.trim($("textarea").val()));
		});
		
	</script>

	
</body>
</html>