<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	    <input type="hidden" name="qNum" value="${ co.qNum }">
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
		        <c:set var="typeValue" value="${ fn:split(co.qExData, ',') }"/>
		        
		        <!-- ,로 나눈 결과가 정수형일때  -->
		        <c:if test="${typeValue[0].matches('[0-9]+')}">
		        
		        	<!-- 매개변수 정수형, 1  -->
		        	<c:if test="${ fn:length(typeValue) == 1}">
		        		<!-- 결과값 int -->
		        		<c:if test="${ co.qExResult.matches('[0-9]+') }">
		        		<div id="code" style="width:800px; height:200px;">class Solution {

	public int question(int a) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question(${co.qExData});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question(${co.qExDataTwo});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		
		<c:if test="${ co.qExDataThree != null }">
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question(${co.qExDataThree});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		        		
		        		</c:if>
		        		<!-- 결과값 String -->
		        		<c:if test="${ !co.qExResult.matches('[0-9]+') }">
		        		<div id="code" style="width:800px; height:200px;">class Solution {

	public String question(int a) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String result = sol.question(${co.qExData});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String result = sol.question(${co.qExDataTwo});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		
		<c:if test="${ co.qExDataThree != null }">
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String result = sol.question(${co.qExDataThree});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		        		
		        		</c:if>
		        		
		        	</c:if>
		        	
		        	<!-- 매개변수 정수형,2 -->
		        	<c:if test="${ fn:length(typeValue) == 2}">
		        		<!-- 결과값 int -->
		        		<c:if test="${ co.qExResult.matches('[0-9]+') }">
		        		<div id="code" style="width:800px; height:200px;">class Solution {

	public int question(int a, int b) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question(${co.qExData});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question(${co.qExDataTwo});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		
		<c:if test="${ co.qExDataThree != null }">
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question(${co.qExDataThree});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		        		
		        		</c:if>
		        		<!-- 결과값 String -->
		        		<c:if test="${ !co.qExResult.matches('[0-9]+') }">
		        		<div id="code" style="width:800px; height:200px;">class Solution {

	public String question(int a, int b) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String result = sol.question(${co.qExData});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String result = sol.question(${co.qExDataTwo});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		
		<c:if test="${ co.qExDataThree != null }">
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String result = sol.question(${co.qExDataThree});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		        		
		        		</c:if>
		        	</c:if>
		        	
		        </c:if>
		        
		        <!-- ,로 나눈 결과가 정수형이 아닐때 (배열, 문자열)  -->
		        <c:if test="${!typeValue[0].matches('[0-9]+')}">
		        	<!-- 배열이 들어가있는 매개변수 -->
		        	<c:if test="${ fn:contains(co.qExData, ']') }">
		        		
		        		<!-- 매개변수가 배열 1 -->
		        		<c:if test="${ fn:endsWith(co.qExData, ']') }">
		        			<!-- 배열안의 값들의 타입 비교 정수-->
		        			<c:if test="${ fn:substring(co.qExData, 1,2).matches('[0-9]+') }">
								<!-- 결과값 int -->
				        		<c:if test="${ co.qExResult.matches('[0-9]+') }">
				        			<c:set var="arrData" value="${ fn:substring(co.qExData, 1, fn:indexOf(co.qExData,']'))}"/>
				        			<div id="code" style="width:800px; height:200px;">class Solution {

	public int question(int[] a) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData}};
		int result = sol.question(a);
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
		<c:set var="arrData2" value="${ fn:substring(co.qExDataTwo, 1, fn:indexOf(co.qExDataTwo,']'))}"/>
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData2}};
		int result = sol.question(a);
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
		<c:set var="arrData3" value="${ fn:substring(co.qExDataThree, 1, fn:indexOf(co.qExDataThree,']'))}"/>
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData3}};
		int result = sol.question(a);
		System.out.println(result);
	}
}</textarea>
		</c:if>
				        		</c:if>
				        		<!-- 결과값 String -->
				        		<c:if test="${ !co.qExResult.matches('[0-9]+') }">
				        			<c:set var="arrData" value="${ fn:substring(co.qExData, 1, fn:indexOf(co.qExData,']'))}"/>
				        			<div id="code" style="width:800px; height:200px;">class Solution {

	public String question(int[] a) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData}};
		String result = sol.question(a);
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
		<c:set var="arrData2" value="${ fn:substring(co.qExDataTwo, 1, fn:indexOf(co.qExDataTwo,']'))}"/>
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData2}};
		String result = sol.question(a);
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
		<c:set var="arrData3" value="${ fn:substring(co.qExDataThree, 1, fn:indexOf(co.qExDataThree,']'))}"/>
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData3}};
		String result = sol.question(a);
		System.out.println(result);
	}
}</textarea>
		</c:if>
				        		</c:if>
		        			</c:if>
		        			<!-- 배열안의 값들의 타입 비교 문자열-->
		        			<c:if test="${ !fn:substring(co.qExData, 1,2).matches('[0-9]+') }">
								<!-- 결과값 int -->
				        		<c:if test="${ co.qExResult.matches('[0-9]+') }">
				        		<c:set var="arrData" value="${ fn:substring(co.qExData, 1, fn:indexOf(co.qExData,']'))}"/>
	        						<div id="code" style="width:800px; height:200px;">class Solution {

	public int question(String[] a) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData}};
		int result = sol.question(a);
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
		<c:set var="arrData2" value="${ fn:substring(co.qExDataTwo, 1, fn:indexOf(co.qExDataTwo,']'))}"/>
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData2}};
		int result = sol.question(a);
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
		<c:set var="arrData3" value="${ fn:substring(co.qExDataThree, 1, fn:indexOf(co.qExDataThree,']'))}"/>
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData3}}
		int result = sol.question(a);
		System.out.println(result);
	}
}</textarea>
		</c:if>
				        		</c:if>
				        		<!-- 결과값 String -->
				        		<c:if test="${ !co.qExResult.matches('[0-9]+') }">
				        		<c:set var="arrData" value="${ fn:substring(co.qExData, 1, fn:indexOf(co.qExData,']'))}"/>
				        			<div id="code" style="width:800px; height:200px;">class Solution {

	public String question(String[] a) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData}};
		String result = sol.question(a);
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
		<c:set var="arrData2" value="${ fn:substring(co.qExDataTwo, 1, fn:indexOf(co.qExDataTwo,']'))}"/>
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData2}};
		String result = sol.question(a);
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
		<c:set var="arrData3" value="${ fn:substring(co.qExDataThree, 1, fn:indexOf(co.qExDataThree,']'))}"/>
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData3}};
		String result = sol.question(a);
		System.out.println(result);
	}
}</textarea>
		</c:if>
				        		</c:if>
		        			</c:if>
		        		</c:if>
		        		
		        		<!-- 매개변수 2 -->
		        		<c:if test="${ !fn:endsWith(co.qExData, ']') }">
		        			<c:set var="exDataLength" value="${ fn:length(co.qExData) }"/>
		        			
		        			<!--  배열이 int 형태 -->
		        			<c:if test="${ fn:substring(co.qExData, 1,2).matches('[0-9]+') }">
		        				<!-- 뒤 매개변수 타입 int -->
		        				<c:if test="${ fn:substring(co.qExData, exDataLength-1, exDataLength).matches('[0-9]+') }">
		        					<!-- 결과값 int -->
					        		<c:if test="${ co.qExResult.matches('[0-9]+') }">
					        		<c:set var="arrData" value="${ fn:substring(co.qExData, 1, fn:indexOf(co.qExData,']'))}"/>
					        		<div id="code" style="width:800px; height:200px;">class Solution {

	public int question(int[] a, int b) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int a[] = {${arrData}};
		int result = sol.question(a, ${ fn:substring(co.qExData, fn:indexOf(co.qExData,']') + 2, fn:length(co.qExData))});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
		<c:set var="arrData2" value="${ fn:substring(co.qExDataTwo, 1, fn:indexOf(co.qExDataTwo,']'))}"/>
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int a[] = {${arrData2}};
		int result = sol.question(a, ${ fn:substring(co.qExDataTwo, fn:indexOf(co.qExDataTwo,']') + 2, fn:length(co.qExDataTwo))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
		<c:set var="arrData3" value="${ fn:substring(co.qExDataThree, 1, fn:indexOf(co.qExDataThree,']'))}"/>
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int a[] = {${arrData3}};
		int result = sol.question(a, ${ fn:substring(co.qExDataThree, fn:indexOf(co.qExDataThree,']') + 2, fn:length(co.qExDataThree))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
					        		
					        		</c:if>
					        		<!-- 결과값 String -->
					        		<c:if test="${ !co.qExResult.matches('[0-9]+') }">
					        		<c:set var="arrData" value="${ fn:substring(co.qExData, 1, fn:indexOf(co.qExData,']'))}"/>
					        		<div id="code" style="width:800px; height:200px;">class Solution {

	public String question(int[] a, int b) {
		
	}
	
}</div>

				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData}};
		String result = sol.question(a, ${ fn:substring(co.qExData, fn:indexOf(co.qExData,']') + 2, fn:length(co.qExData))});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
		<c:set var="arrData2" value="${ fn:substring(co.qExDataTwo, 1, fn:indexOf(co.qExDataTwo,']'))}"/>
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData2}};
		String result = sol.question(a, ${ fn:substring(co.qExDataTwo, fn:indexOf(co.qExDataTwo,']') + 2, fn:length(co.qExDataTwo))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
		<c:set var="arrData3" value="${ fn:substring(co.qExDataThree, 1, fn:indexOf(co.qExDataThree,']'))}"/>
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData3}};
		String result = sol.question(a, ${ fn:substring(co.qExDataThree, fn:indexOf(co.qExDataThree,']') + 2, fn:length(co.qExDataThree))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
					        		
					        		</c:if>
		        				
		        				</c:if>
		        				
		        				<!-- 뒤 매개변수 타입 String -->
		        				<c:if test="${ !fn:substring(co.qExData, exDataLength-1, exDataLength).matches('[0-9]+') }">
		        					<!-- 결과값 int -->
					        		<c:if test="${ co.qExResult.matches('[0-9]+') }">
					        		<c:set var="arrData" value="${ fn:substring(co.qExData, 1, fn:indexOf(co.qExData,']'))}"/>
					        		<div id="code" style="width:800px; height:200px;">class Solution {

	public int question(int[] a, String b) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData}};
		int result = sol.question(a,${ fn:substring(co.qExData, fn:indexOf(co.qExData,']') + 2, fn:length(co.qExData))});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
		<c:set var="arrData2" value="${ fn:substring(co.qExDataTwo, 1, fn:indexOf(co.qExDataTwo,']'))}"/>
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData2}};
		int result = sol.question(a, ${ fn:substring(co.qExDataTwo, fn:indexOf(co.qExDataTwo,']') + 2, fn:length(co.qExDataTwo))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
		<c:set var="arrData3" value="${ fn:substring(co.qExDataThree, 1, fn:indexOf(co.qExDataThree,']'))}"/>
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData3}};
		int result = sol.question(a, ${ fn:substring(co.qExDataThree, fn:indexOf(co.qExDataThree,']') + 2, fn:length(co.qExDataThree))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
					        		
					        		</c:if>
					        		<!-- 결과값 String -->
					        		<c:if test="${ !co.qExResult.matches('[0-9]+') }">
					        		<c:set var="arrData" value="${ fn:substring(co.qExData, 1, fn:indexOf(co.qExData,']'))}"/>
					        		<div id="code" style="width:800px; height:200px;">class Solution {

	public String question(int[] a, String b) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData}};
		String result = sol.question(a, ${ fn:substring(co.qExData, fn:indexOf(co.qExData,']') + 2, fn:length(co.qExData))});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
		<c:set var="arrData2" value="${ fn:substring(co.qExDataTwo, 1, fn:indexOf(co.qExDataTwo,']'))}"/>
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData2}};
		String result = sol.question(a, ${ fn:substring(co.qExDataTwo, fn:indexOf(co.qExDataTwo,']') + 2, fn:length(co.qExDataTwo))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
		<c:set var="arrData3" value="${ fn:substring(co.qExDataThree, 1, fn:indexOf(co.qExDataThree,']'))}"/>
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int[] a = {${arrData3}};
		String result = sol.question(a, ${ fn:substring(co.qExDataThree, fn:indexOf(co.qExDataThree,']') + 2, fn:length(co.qExDataThree))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
					        		</c:if>
		        				</c:if>
		        			</c:if>
		        			
		        			<!-- 배열이 String 형태 -->
		        			<c:if test="${ !fn:substring(co.qExData, 1,2).matches('[0-9]+') }">
		        				<!-- 뒤 매개변수 타입 int -->
		        				<c:if test="${ fn:substring(co.qExData, exDataLength-1, exDataLength).matches('[0-9]+') }">
		        					<!-- 결과값 int -->
					        		<c:if test="${ co.qExResult.matches('[0-9]+') }">
					        		<c:set var="arrData" value="${ fn:substring(co.qExData, 1, fn:indexOf(co.qExData,']'))}"/>
					        		<div id="code" style="width:800px; height:200px;">class Solution {

	public int question(String[] a, int b) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a= {${arrData}};
		int result = sol.question(a, ${ fn:substring(co.qExData, fn:indexOf(co.qExData,']') + 2, fn:length(co.qExData))});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
		<c:set var="arrData2" value="${ fn:substring(co.qExDataTwo, 1, fn:indexOf(co.qExDataTwo,']'))}"/>
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData2}};
		int result = sol.question(a, ${ fn:substring(co.qExDataTwo, fn:indexOf(co.qExDataTwo,']') + 2, fn:length(co.qExDataTwo))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
		<c:set var="arrData3" value="${ fn:substring(co.qExDataThree, 1, fn:indexOf(co.qExDataThree,']'))}"/>
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData3}};
		int result = sol.question(a, ${ fn:substring(co.qExDataThree, fn:indexOf(co.qExDataThree,']') + 2, fn:length(co.qExDataThree))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
					        		</c:if>
					        		<!-- 결과값 String -->
					        		<c:if test="${ !co.qExResult.matches('[0-9]+') }">
					        		<c:set var="arrData" value="${ fn:substring(co.qExData, 1, fn:indexOf(co.qExData,']'))}"/>
					        		<div id="code" style="width:800px; height:200px;">class Solution {

	public String question(String[] a, int b) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData}};
		String result = sol.question(a, ${ fn:substring(co.qExData, fn:indexOf(co.qExData,']') + 2, fn:length(co.qExData))});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
		<c:set var="arrData2" value="${ fn:substring(co.qExDataTwo, 1, fn:indexOf(co.qExDataTwo,']'))}"/>
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData2}};
		String result = sol.question(a, ${ fn:substring(co.qExDataTwo, fn:indexOf(co.qExDataTwo,']') + 2, fn:length(co.qExDataTwo))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
		<c:set var="arrData3" value="${ fn:substring(co.qExDataThree, 1, fn:indexOf(co.qExDataThree,']'))}"/>
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData3}};
		String result = sol.question(a, ${ fn:substring(co.qExDataThree, fn:indexOf(co.qExDataThree,']') + 2, fn:length(co.qExDataThree))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
					        		</c:if>
		        				</c:if>
		        				
		        				<!-- 뒤 매개변수 타입 String -->
		        				<c:if test="${ !fn:substring(co.qExData, exDataLength-1, exDataLength).matches('[0-9]+') }">
		        					<!-- 결과값 int -->
					        		<c:if test="${ co.qExResult.matches('[0-9]+') }">
					        		<c:set var="arrData" value="${ fn:substring(co.qExData, 1, fn:indexOf(co.qExData,']'))}"/>
					        		<div id="code" style="width:800px; height:200px;">class Solution {

	public int question(String[] a, String b) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData}};
		int result = sol.question(a, ${ fn:substring(co.qExData, fn:indexOf(co.qExData,']') + 2, fn:length(co.qExData))});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
		<c:set var="arrData2" value="${ fn:substring(co.qExDataTwo, 1, fn:indexOf(co.qExDataTwo,']'))}"/>
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData2}};
		int result = sol.question(a, ${ fn:substring(co.qExDataTwo, fn:indexOf(co.qExDataTwo,']') + 2, fn:length(co.qExDataTwo))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
		<c:set var="arrData3" value="${ fn:substring(co.qExDataThree, 1, fn:indexOf(co.qExDataThree,']'))}"/>
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData3}};
		int result = sol.question(a, ${ fn:substring(co.qExDataThree, fn:indexOf(co.qExDataThree,']') + 2, fn:length(co.qExDataThree))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
					        		</c:if>
					        		<!-- 결과값 String -->
					        		<c:if test="${ !co.qExResult.matches('[0-9]+') }">
					        		<c:set var="arrData" value="${ fn:substring(co.qExData, 1, fn:indexOf(co.qExData,']'))}"/>
					        			<div id="code" style="width:800px; height:200px;">class Solution {

	public String question(String[] a, String b) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData}};
		String result = sol.question(a, ${ fn:substring(co.qExData, fn:indexOf(co.qExData,']') + 2, fn:length(co.qExData))});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
		<c:set var="arrData2" value="${ fn:substring(co.qExDataTwo, 1, fn:indexOf(co.qExDataTwo,']'))}"/>
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData2}};
		String result = sol.question(a, ${ fn:substring(co.qExDataTwo, fn:indexOf(co.qExDataTwo,']') + 2, fn:length(co.qExDataTwo))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
		<c:set var="arrData3" value="${ fn:substring(co.qExDataThree, 1, fn:indexOf(co.qExDataThree,']'))}"/>
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String[] a = {${arrData3}};
		String result = sol.question(a, ${ fn:substring(co.qExDataThree, fn:indexOf(co.qExDataThree,']') + 2, fn:length(co.qExDataThree))});
		System.out.println(result);
	}
}</textarea>
		</c:if>
					        		</c:if>
		        				</c:if>
		        			</c:if>
		        			
		        		</c:if>
		        	</c:if>
		        	
		        	<!-- 문자열이 들어가있는 매개변수 -->
		        	<c:if test="${ !fn:contains(co.qExData, ']') }">
		        		<c:set var="stringData" value="${ fn:split(co.qExData, ',') }"/>
		        		<!-- 매개변수 1 -->
		        		<c:if test="${ fn:length(stringData) == 1 }">
		        			<!-- 결과값 int -->
			        		<c:if test="${ co.qExResult.matches('[0-9]+') }">
			        		<div id="code" style="width:800px; height:200px;">class Solution {

	public int question(String a) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question("${co.qExData}");
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question("${co.qExDataTwo}");
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question("${co.qExDataThree}");
		System.out.println(result);
	}
}</textarea>
		</c:if>
			        		
			        		</c:if>
			        		<!-- 결과값 String -->
			        		<c:if test="${ !co.qExResult.matches('[0-9]+') }">
			        		<div id="code" style="width:800px; height:200px;">class Solution {

	public String question(String a) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String result = sol.question("${co.qExData}");
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String result = sol.question("${co.qExDataTwo}");
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String result = sol.question("${co.qExDataThree}");
		System.out.println(result);
	}
}</textarea>
		</c:if>
			        		
			        		</c:if>
		        		</c:if>
		        		
		        		<!-- 매개변수 2 -->
		        		<c:if test="${ fn:length(stringData) == 2 }">
		        			<!-- 결과값 int -->
			        		<c:if test="${ co.qExResult.matches('[0-9]+') }">
			        		<div id="code" style="width:800px; height:200px;">class Solution {

	public int question(String a, String b) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question(${co.qExData});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question(${co.qExDataTwo});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		int result = sol.question(${co.qExDataThree});
		System.out.println(result);
	}
}</textarea>
		</c:if>
			        		
			        		</c:if>
			        		<!-- 결과값 String -->
			        		<c:if test="${ !co.qExResult.matches('[0-9]+') }">
			        		<div id="code" style="width:800px; height:200px;">class Solution {

	public String question(String a, String b) {
		
	}
	
}</div>
				<textarea hidden id="codeCopy" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String result = sol.question(${co.qExData});
		System.out.println(result);
	}
}</textarea>
		<c:if test="${ co.qExDataTwo != null }">
			<textarea hidden id="codeCopy2" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode2" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String result = sol.question(${co.qExDataTwo});
		System.out.println(result);
	}
}</textarea>
		</c:if>
		<c:if test="${ co.qExDataThree != null }">
			<textarea hidden id="codeCopy3" name="code" style="display:none;"></textarea>
				<textarea hidden id="startCode3" name="code" style="display:none;">public static void main(String[] args){
		Solution sol = new Solution();
		
		String result = sol.question(${co.qExDataThree});
		System.out.println(result);
	}
}</textarea>
		</c:if>
			        		</c:if>
		        		</c:if>
		        	</c:if>
		        </c:if>
		          
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
					$('#codeCopy2').val(editCode + $("#startCode2").val());
					$('#codeCopy3').val(editCode + $("#startCode3").val());
					
					$.ajax({
						url:"compileCode.do",
						data: {code: $("#codeCopy").val()},
						type: "post",
						dataType: "json",
						success: function(data){
							$outputResult = $("#outputResult");
							$outputResult.html("");
							
							var $spanData;
							var $spanResult;
							var $pre;
							var $preResult;
							
							if(data.length > 0){
								$spanData = $("<span class='console-content'>").text("입력 : " + '${co.qExData}');
								$spanResult = $("<span class='console-content'>").text("  결과예상 : " + '${ co.qExResult}');
								$pre = $("<pre class='console-content'>").text("결과 : " + decodeURIComponent(data.replace(/\+/g, " ")));
								
								<c:if test="${ co.qExResult.matches('[0-9]+') }">
									if(decodeURIComponent(data.replace(/\+/g, " ")) == ${co.qExResult}){
										$preResult = $("<pre name='testResult' class='console-content' style='color:#00e7ff;'>").text("통과입니다.");
									}else{
										$preResult = $("<pre name='testResult' class='console-content' style='color:red;'>").text("불통과입니다.");
									}
								</c:if>
								<c:if test="${ !co.qExResult.matches('[0-9]+') }">
									var qExResult = "${co.qExResult}";
									if(decodeURIComponent(data.replace(/\+/g, " ")).indexOf(qExResult) > -1){
										$preResult = $("<pre name='testResult' class='console-content' style='color:#00e7ff;'>").text("통과입니다.");
									}else{
										$preResult = $("<pre name='testResult' class='console-content' style='color:red;'>").text("불통과입니다.");
									}
								</c:if>
								/* if(decodeURIComponent(data.replace(/\+/g, " ")) == "${co.qExResult}" || decodeURIComponent(data.replace(/\+/g, " ")) == ${co.qExResult}){
									$preResult = $("<pre name='testResult' class='console-content' style='color:#00e7ff;'>").text("통과입니다.");
								}else{
									$preResult = $("<pre name='testResult' class='console-content' style='color:red;'>").text("불통과입니다.");
								} */
							}
							$outputResult.append($spanData);
							$outputResult.append($spanResult);
							$outputResult.append($pre);
							$outputResult.append($preResult);
							
							if(${co.qExDataTwo != null}){
								$.ajax({
									url: 'compileCode.do',
									data: {code: $('#codeCopy2').val()},
									type: "post",
									dataType: "json",
									success: function(data){
										$outputResult = $("#outputResult");
										
										var $spanData;
										var $spanResult;
										var $pre;
										var $preResult;
										
										if(data.length > 0){
											<c:if test="${ co.qExDataTwo != null}">
												$spanData = $("<span class='console-content'>").text("입력 : " + '${co.qExDataTwo}');
												$spanResult = $("<span class='console-content'>").text("  결과예상 : " + '${ co.qExResultTwo}');
												<c:if test="${ co.qExResult.matches('[0-9]+') }">
													if(decodeURIComponent(data.replace(/\+/g, " ")) == ${co.qExResultTwo}){
														$preResult = $("<pre name='testResult' class='console-content' style='color:#00e7ff;'>").text("통과입니다.");
													}else{
														$preResult = $("<pre name='testResult' class='console-content' style='color:red;'>").text("불통과입니다.");
													}
												</c:if>
												<c:if test="${ !co.qExResult.matches('[0-9]+') }">
													var qExResultTwo = "${co.qExResultTwo}";
													if(decodeURIComponent(data.replace(/\+/g, " ")).indexOf(qExResultTwo) > -1){
														$preResult = $("<pre name='testResult' class='console-content' style='color:#00e7ff;'>").text("통과입니다.");
													}else{
														$preResult = $("<pre name='testResult' class='console-content' style='color:red;'>").text("불통과입니다.");
													}
												</c:if>
												/* if(decodeURIComponent(data.replace(/\+/g, " ")) == "${co.qExResultTwo}" || decodeURIComponent(data.replace(/\+/g, " ")) == ${co.qExResultTwo}){
													$preResult = $("<pre name='testResult' class='console-content' style='color:#00e7ff;'>").text("통과입니다.");
												}else{
													$preResult = $("<pre name='testResult' class='console-content' style='color:red;'>").text("불통과입니다.");
												} */
											</c:if>
											$pre = $("<pre class='console-content'>").text(decodeURIComponent(data.replace(/\+/g, " ")));
										}
										$outputResult.append($spanData);
										$outputResult.append($spanResult);
										$outputResult.append($pre);
										$outputResult.append($preResult);
										
										if(${co.qExDataThree != null}){
											$.ajax({
												url: 'compileCode.do',
												data: {code: $('#codeCopy3').val()},
												type: "post",
												dataType: "json",
												success: function(data){
													$outputResult = $("#outputResult");
													
													var $spanData;
													var $spanResult;
													var $pre;
													var $preResult;
													
													if(data.length > 0){
														<c:if test="${ co.qExDataThree != null}">
															$spanData = $("<span class='console-content'>").text("입력 : " + '${co.qExDataThree}');
															$spanResult = $("<span class='console-content'>").text("  결과예상 : " + '${ co.qExResultThree}');
															<c:if test="${ co.qExResult.matches('[0-9]+') }">
																if(decodeURIComponent(data.replace(/\+/g, " ")) == ${co.qExResultThree}){
																	$preResult = $("<pre name='testResult' class='console-content' style='color:#00e7ff;'>").text("통과입니다.");
																}else{
																	$preResult = $("<pre name='testResult' class='console-content' style='color:red;'>").text("불통과입니다.");
																}
															</c:if>
															<c:if test="${ !co.qExResult.matches('[0-9]+') }">
																var qExResultThree = "${co.qExResultThree}";
																if(decodeURIComponent(data.replace(/\+/g, " ")).indexOf(qExResultThree) > -1){
																	$preResult = $("<pre name='testResult' class='console-content' style='color:#00e7ff;'>").text("통과입니다.");
																}else{
																	$preResult = $("<pre name='testResult' class='console-content' style='color:red;'>").text("불통과입니다.");
																}
															</c:if>
															/* if(decodeURIComponent(data.replace(/\+/g, " ")) == "${co.qExResultThree}" || decodeURIComponent(data.replace(/\+/g, " ")) == ${co.qExResultThree}){
																$preResult = $("<pre name='testResult' class='console-content' style='color:#00e7ff;'>").text("통과입니다.");
															}else{
																$preResult = $("<pre name='testResult' class='console-content' style='color:red;'>").text("불통과입니다.");
															} */
														</c:if>
														$pre = $("<pre class='console-content'>").text(decodeURIComponent(data.replace(/\+/g, " ")));
													}
													$outputResult.append($spanData);
													$outputResult.append($spanResult);
													$outputResult.append($pre);
													$outputResult.append($preResult);
												}
											});
										}
									}
								});
							}
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
					var testResult = $('pre[name=testResult]').text();
					console.log(testResult);
					if(testResult != ""){
						if(testResult.indexOf("불통과") != -1){
							var bool = confirm("테스트에 통과하지 못하였습니다. 계속 도전하시려면 확인을 눌러주세요.");
							
							if(!bool){
								location.href='codingTestListView.do';
							}
						}else{
							alert("테스트에 통과하셨습니다. 축하합니다.");
							location.href='codingTestSuccess.do?qNum='+ ${ co.qNum};
						}
					}else{
						alert("제출전에 코드 실행을 필수로 하셔야됩니다.");
					}
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