<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertTransaction</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/bootstrap.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=efed415f965636c4e32491ab2edf6847&libraries=services"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
label {
	margin: 0;
}

.ss {
	font-size: 18px;
	margin-left: 5px;
	vertical-align: bottom;
}

.boardbox {
	width: 80%;
	max-width: 1024px;
	margin: 0 auto;
	padding: 5% 2%;
	text-align: center;
	position: relative;
	display: table;
	float: center;
	background: #fff;
}

.boxrow {
	position: relative;
	display: table;
	width: 100%;
	padding-bottom: 30px;
}

.boxrow-top {
	border-bottom-style: solid;
	border-color: #BDBDBD;
	height: 55px;
	border-width: 3px;
}

.subtext {
	font-size: 1.2em;
	text-transform: uppercase;
	text-align: left;
	width: 30%;
	font-size: 23px;
	font-weight: bold;
	line-height: 55px;
}

.pnaw_box {
	width: 100%;
	margin: 30px 0;
	border: 1px solid #eee;
}

.pnaw_box th {
	width: 25%;
	padding: 20px;
	border: 1px solid #eee;
	font-size: 17px;
	font-weight: normal;
	background: #fafafa;
}

.pnaw_box td {
	width: 75%;
	padding: 10px;
	border: 1px solid #eee;
	font-size: 13px;
	text-align: left;
}

.pnaw_box td input, select {
	height: 40px;
}

input, textarea, select {
	box-shadow: none;
	outline: none;
	box-shadow: none;
	border: 1px solid #eee;
	padding: 0 1em;
	appearance: none;
}

.joinbox {
	width: 100%;
	max-width: 1024px;
	margin: 0 auto;
	padding: 0 5px;
	text-align: center;
	position: relative;
	display: table;
}

.joinbox .ul01 li {
	padding: 1%;
	float: left;
	width: 50%;
}

.joinbox .ul01 li {
	padding: 1%;
	float: left;
	width: 50%;
	list-style: none;
}

.inputbox02 {
	width: 100%;
	height: 40px;
	font-size: 0.875em;
}

#titleImgArea {
	width: 350px;
	height: 200px;
	text-align: center;
	display: table-cell;
}

#titleImgArea:hover, #contentImgArea1:hover, #contentImgArea2:hover,
	#contentImgArea3:hover, #contentImgArea4:hover {
	cursor: pointer;
}

#contentImgArea1, #contentImgArea2, #contentImgArea3 {
	width: 120px;
	height: 100px;
	text-align: left;
	display: table-cell;
	vertical-align: middle;
}

.par {
	display: inline-block;
}

.po {
	text-algin: center;
	float: left;
	margin-right: 50px; }


.comm {
	vertical-align: middle;
}

input[type=text] {
	padding: 0.375rem 0.75rem;
	color: #495057;
	background-color: #fff;
}

#address {
	width: 80%;
}

#cAddBtn {
	vertical-align: middle;
    width: 120px;
    margin: 0 10px;
}
</style>
</head>
<body>

	<!-- header -->
	<c:import url="../common/menubar.jsp"/>

	<div class="boardbox">

		<div class="boxrow">
			<div class="boxrow-top">
				<h1 class="subtext">공모전 등록</h1>
			</div>
			<!--  enctype은 전송되는 데이터 형식을 설정한다. -->
			<form name='writeform' id='writeform'
				action='${ contextPath }/competitionInsert.do' method='post'
				enctype="Multipart/form-data">

				<table class="pnaw_box" summary="">
					<tbody>

						<tr>
							<th scope="row">공모전 이름</th>
							<td class="pnawtd"><input name="cTitle"
								class="inputTypeText" style='width: 80%;' maxLength="125"
								type="text" placeholder="공모전 이름을 입력하세요." /></td>
						</tr>
						<tr class="first">
							<th>공모전 접수기간</th>
							<td class="pnawtd"><input type="date" name="startDate">
								~ <input type="date" name="endDate"></td>
						</tr>

						<tr>
							<th scope="row">공모전 주소</th>
							<td class="pnawtd"><input name="cAddress" id="address"	class="inputTypeText" style="width:80%;" type="text"
								placeholder="공모전 주소">
								<input type="button" id="cAddBtn" onclick="searchAddress()" value="주소 검색">
								<div id="map" style="width:600px;height:300px;margin-top:10px;display:none"></div>
							</td>
						</tr>

						<tr>
							<th scope="row">공모전 전화번호</th>
							<td class="pnawtd"><input name="cPhone"
								class="inputTypeText" style="width: 80%;" type="text"
								placeholder="전화번호"></td>
						</tr>

						<tr>
							<th scope="row">메인 이미지</th>
							<td>
								<div id="titleImgArea">
									<img id="titleImg" name="titleImg" width="600" height="600"
										tabindex="0">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">상세내용</th>
							<td class="write pnawtd"><textarea name='cContent'
									style='width: 100%; height: 200px; resize:none;'></textarea></td>
						</tr>
						<tr>
							<th>사진 첨부</th>
							<td>
								<div class="par">
									<div id="contentImgArea1" class="po">
										<img id="contentImg1" name="contentImg1" width="120"
											height="100">
									</div>

									<div id="contentImgArea2" class="po">
										<img id="contentImg2" name="contentImg2" width="120"
											height="100">
									</div>

									<div id="contentImgArea3" class="po">
										<img id="contentImg3" name="contentImg3" width="120"
											height="100">
									</div>
									<div id="contentImgArea4" class="po">
										<img id="contentImg4" name="contentImg4" width="120"
											height="100">
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>

				<div class="joinbox" style="max-width: 100%;">
					<input class="inputbox02 btn btn-outline-dark"
							type="button" style="width: 40%;" value="등록" onclick="register();">
						<input class="inputbox02 btn btn-outline-dark"
							type="button" style="width: 40%;" value="취소" onclick="javascript:history.back()">
				</div>
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple"
						name="titleImg" onchange="LoadImg(this,1)"> <input
						type="file" id="thumbnailImg2" multiple="multiple"
						name="contentImg1" onchange="LoadImg(this,2)"> <input
						type="file" id="thumbnailImg3" multiple="multiple"
						name="contentImg2" onchange="LoadImg(this,3)"> <input
						type="file" id="thumbnailImg4" multiple="multiple"
						name="contentImg3" onchange="LoadImg(this,4)"> <input
						type="file" id="thumbnailImg5" multiple="multiple"
						name="contentImg4" onchange="LoadImg(this,5)">
				</div>
			</form>
		</div>
	</div>

	<!-- 푸터  -->
	<c:import url="../common/footer.jsp"/>
	<!-- /푸터 -->

	<script>
		$(function() {
			$("#fileArea").hide();

			$("#titleImgArea").click(function() {
				$("#thumbnailImg1").click();
			});
			$("#contentImgArea1").click(function() {
				$("#thumbnailImg2").click();
			});
			$("#contentImgArea2").click(function() {
				$("#thumbnailImg3").click();
			});
			$("#contentImgArea3").click(function() {
				$("#thumbnailImg4").click();
			});
			$("#contentImgArea4").click(function() {
				$("#thumbnailImg5").click();
			});

		});
		// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					switch (num) {
					case 1:
						$("#titleImg").attr("src", e.target.result);
						break;
					case 2:
						$("#contentImg1").attr("src", e.target.result);
						break;
					case 3:
						$("#contentImg2").attr("src", e.target.result);
						break;
					case 4:
						$("#contentImg3").attr("src", e.target.result);
						break;
					case 5:
						$("#contentImg4").attr("src", e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}

		// 등록 버튼이 눌렷을때
		function register() {
			var form = $('#writeform');
			var isall = true;
			console.log('실행');
			console.log($('#cates').val());

			// 의류 값이 없을 경우 포커스
			if ($('#cates').val() == '') {
				alert('가게종류를 선택해주세요.');
				var offset = $('#chk1').offset();
				$("html").animate({
					scrollTop : offset.top
				}, 400);
				isall = false;
				return false;
			}
			if ($('#address').val() == '') {
				alert('주소를 입력해주세요.');
				var offset = $('#chk1').offset();
				$("html").animate({
					scrollTop : offset.top
				}, 400);
				isall = false;
				return false;
			}

			// text 박스 구분
			form.find('input[type=text]').each(function() {
				var obj = $(this);
				console.log(obj);

				if (obj.attr('valch') == 'yes') {
					if (obj.val() == '') {
						alert(obj.attr('msg'));
						obj.focus();
						isall = false;
						return false;
					}
				}
			});

			console.log($('#titleImg'));
			var img = $('#titleImg')[0];
			if (img.src == '') {
				alert('메인 이미지를 넣어주세요.');
				$('#titleImg').focus();
				return false;
			}

			if (isall) {
				answer = confirm("작성한 글을 등록 하시겠습니까?");
				console.log("point값 : " + $("#point").val());
				if (answer == true) {
					form.submit();
				}
			}
		}

		var mapContainer = document.getElementById('map'); // 지도를 표시할 div
		var	mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 4
		// 지도의 확대 레벨
		};

		//지도를 미리 생성
		var map = new kakao.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new kakao.maps.services.Geocoder();
		
		//마커를 미리 생성
		 var marker = new kakao.maps.Marker({
			position : new kakao.maps.LatLng(37.537187, 127.005476),
			map : map
		});
		
		

		function searchAddress() {
			new daum.Postcode({
				oncomplete: function(data) {
					var addr = data.roadAddress; // 최종 주소 변수

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("address").value = addr;
					// 주소로 상세 정보를 검색
					// geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);  
					geocoder.addressSearch(data.address, function(results,status) {
						// 정상적으로 검색이 완료됐으면
						if (status === kakao.maps.services.Status.OK) {

							var result = results[0]; //첫번째 결과의 값을 활용

							// 해당 주소에 대한 좌표를 받아서
							var coords = new kakao.maps.LatLng(result.y, result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";
							map.relayout();	
							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords);
						}
					});
				}
			}).open();
		}
	
	</script>
</body>
</html>