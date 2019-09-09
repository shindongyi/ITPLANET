<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%
   Member member = (Member)session.getAttribute("loginUser");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertTransaction</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resource/css/bootstrap.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3018f5ee323efc24a6709172ea4c4b35&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
</style>
</head>
<body>

	<!-- header -->
	<%@ include file="/views/common/menubar1.jsp"%>

	<div class="boardbox">

		<div class="boxrow">
			<div class="boxrow-top">
				<h1 class="subtext">공모전 등록</h1>
			</div>
			<!--  enctype은 전송되는 데이터 형식을 설정한다. -->
			<form name='writeform' id='writeform'
				action='<%=request.getContextPath()%>/insert.st' method='post'
				ENCTYPE='multipart/form-data'>

				<table class="pnaw_box" summary="">
					<tbody>

						<tr>
							<th scope="row">공모전 이름</th>
							<td class="pnawtd"><input name="subject" value=""
								class="inputTypeText" style='width: 80%;' maxLength="125"
								type="text" msg="제목을 입력해주세요." valch="yes" /></td>
						</tr>
						<tr class="first">
							<th>공모전 접수기간</th>
							<td class="pnawtd"><input type="date" name="startDate">
								~ <input type="date" name="endDate"></td>
						</tr>

						<tr>
							<th scope="row">기관명</th>
							<td class="pnawtd"><input name="mem_name" value=""
								class="inputTypeText" maxLength="125" type="text"
								placeholder="주최"> <input name="mem_name" value=""
								class="inputTypeText" maxLength="125" type="text"
								placeholder="주관"> <input name="mem_name" value=""
								class="inputTypeText" maxLength="125" type="text"
								placeholder="후원/협찬"></td>
						</tr>

						<tr>
							<th scope="row">시상</th>
							<td class="pnawtd"><input name="mem_name" value=""
								class="inputTypeText" maxLength="125" type="text"
								placeholder="1등시상금"> <input name="mem_name" value=""
								class="inputTypeText" maxLength="125" type="text"
								placeholder="총시상금"> <input name="mem_name" value=""
								class="inputTypeText" maxLength="125" type="text"
								placeholder="특전"></td>
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
							<td class="write pnawtd"><textarea name='memo'
									style='width: 100%; height: 200px;'></textarea></td>
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
					<ul class="ul01">
						<li><input class="inputbox02 btn btn-outline-dark"
							type="button" value="등록" onclick="register();"></li>
						<li><input class="inputbox02 btn btn-outline-dark"
							type="button" value="취소" onclick="javascript:history.back()"></li>
					</ul>
				</div>
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" multiple="multiple"
						name="thumbnailImg1" onchange="LoadImg(this,1)"> <input
						type="file" id="thumbnailImg2" multiple="multiple"
						name="thumbnailImg2" onchange="LoadImg(this,2)"> <input
						type="file" id="thumbnailImg3" multiple="multiple"
						name="thumbnailImg3" onchange="LoadImg(this,3)"> <input
						type="file" id="thumbnailImg4" multiple="multiple"
						name="thumbnailImg4" onchange="LoadImg(this,4)"> <input
						type="file" id="thumbnailImg5" multiple="multiple"
						name="thumbnailImg5" onchange="LoadImg(this,5)">
				</div>
			</form>
		</div>
	</div>

	<!-- 푸터  -->
	<%@ include file="/views/common/footer.jsp"%>
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

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});

		function searchAddress() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("address").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function(results,
							status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {

							var result = results[0]; //첫번째 결과의 값을 활용

							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";
							map.relayout();
							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		}
	</script>
</body>
</html>