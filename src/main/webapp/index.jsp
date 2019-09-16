<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITPlanet</title>

<!--메뉴바 관련 CSS -->
<link rel='stylesheet' href="${ contextPath }/resources/css/mainView/common.css">

<!-- 푸터위에 공모전, 스터디, 채용공고, 코딩테스트 4개 같이 있는부분 CSS -->
<link rel='stylesheet' href="${ contextPath }/resources/css/mainView/asdf.css">
<!-- 푸터 위.. 끝 -->

<link rel="stylesheet" type="text/css"
	href="https://dispatch.cdnser.be/asset/slick-1.8.0/slick/slick.css" />
<!-- 뉴스1 -->
<link rel="stylesheet" type="text/css"
	href="https://dispatch.cdnser.be/asset/slick-1.8.0/slick/slick-theme.css" />
<!-- 뉴스 슬라이드 버튼 -->
<script type="text/javascript"
	src="https://dispatch.cdnser.be/asset/js/jquery-3.2.1.min.js"></script>
<!-- 뉴스2 -->
<script type="text/javascript"
	src="https://dispatch.cdnser.be/asset/slick-1.8.0/slick/slick.min.js"></script>

<style>
/* 메뉴바 CSS */
.subLyr {
	display: block;
	max-height: 280px;
}

.debsss {
	margin-top: 5px;
	font-weight: bold;
	font-size: 15px;
	display: block;
	position: relative;
	line-height: 30px;
	padding: 0 30px;
}

a:not ([href] ):not ([tabindex] ):hover, a:not ([href] ):not ([tabindex]
	 ):focus {
	color: white;
	text-decoration: none;
}

.header {
	transition: All 0.2s ease;
}

.temp.debs>li:hover {
	cursor: pointer;
}

.menubar_li a {
	display: block;
	position: relative;
	padding: 0 20px;
	font-size: 14px;
	line-height: 43px;
	color: #fff;
	z-index: 2;
	cursor: pointer;
	text-decoration: none;
}

dd {
	position: relative;
	float: left;
	margin-inline-start: 1px;
}

.menubar_li {
	padding: 0 50px;
	/* /메뉴바 CSS */
}
/* ------------------------------------------------- */
/* Banner Images :: Carousel */
/* ------------------------------------------------- */
.banner-img0, .banner-img4, .banner-img1, .banner-img2, .banner-img3 {
	position: relative;
	min-height: 300px;
	background-size: cover;
	background-repeat: no-repeat;
	background: #757575;
}

#banner-desc0, #banner-desc4, #banner-desc3, #banner-desc2,
	#banner-desc1 {
	display: -webkit-box;
	position: absolute;
	bottom: 1.4em;
	color: #fff;
	font-size: 1.7em;
	font-weight: 600;
	left: 0;
	right: 0;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	max-width: 70%;
}	

.slick-active #banner-desc0, .slick-active #banner-desc4, .slick-active #banner-desc3,
	.slick-active #banner-desc2, .slick-active #banner-desc1 {
	display: -webkit-box;
}

/* ------------------------------------------------- */
/* banner-carousel.slick / 베너 양쪽 버튼CSS */
/* ------------------------------------------------- */
.slick-arrow {
	z-index: 999;
}

.slick-next {
	right: 1rem;
}

.slick-prev {
	left: 1rem;
}

.slick-list {
	/* padding: 0 8.333% 0 8.333%!important; */
	
}

/* News 관련 CSS 다른곳에 넣어서 링크 걸면 이상하게 깨짐 그래서 여기다가 박음 */
.banner-carousel-wrapper {
	width: 100%;
	position: relative;
	overflow: hidden;
}

.banner-carousel-wrapper {
	background: rgba(0, 0, 0, 1);
}

.banner-carousel {
	max-width: 900px;
	margin: 0px auto;
	position: static;
}

.banner-carousel.slick-dotted.slick-slider {
	margin-bottom: 0;
}

.banner-carousel .overlay {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	opacity: 0.8;
	transition: .5s ease;
	background-color: #000;
}

.banner-carousel .slick-slide {
	position: relative;
}

.banner-carousel .slick-active .overlay {
	opacity: 0;
}

.banner-carousel.slick-initialized.slick-slider .slick-list.draggable {
	overflow: visible;
}

.banner-img1, .banner-img2, .banner-img3, .banner-img4, .banner-img0 {
	background: #757575;
	position: relative;
}

.banner-carousel div.line-clamp.line-clamp-2-md {
	/* display:none; */
	
}

.banner-carousel .slick-active div.line-clamp.line-clamp-2-md {
	display: -webkit-box;
}

.banner-img0 {
	background-image: linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://www.blockmedia.co.kr/wp-content/uploads/2018/08/%EB%B8%94%EB%A1%9D%EC%B2%B4%EC%9D%B8-2-1200x640.jpg");
	background-image: -webkit-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://www.blockmedia.co.kr/wp-content/uploads/2018/08/%EB%B8%94%EB%A1%9D%EC%B2%B4%EC%9D%B8-2-1200x640.jpg");
	background-image: -o-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://www.blockmedia.co.kr/wp-content/uploads/2018/08/%EB%B8%94%EB%A1%9D%EC%B2%B4%EC%9D%B8-2-1200x640.jpg");
	background-image: -moz-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://www.blockmedia.co.kr/wp-content/uploads/2018/08/%EB%B8%94%EB%A1%9D%EC%B2%B4%EC%9D%B8-2-1200x640.jpg");
}

.banner-img1 {
	
	
	
	background-image: linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/1P88/image/QP_7oaorQ5z40tyuQ6qVMs4cKyw.jpg");
	background-image: -webkit-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/1P88/image/QP_7oaorQ5z40tyuQ6qVMs4cKyw.jpg");
	background-image: -o-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/1P88/image/QP_7oaorQ5z40tyuQ6qVMs4cKyw.jpg");
	background-image: -moz-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/1P88/image/QP_7oaorQ5z40tyuQ6qVMs4cKyw.jpg");
}

.banner-img2 {
	background-image: linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("http://thegear.mygoodnews.com/imgdata/thegear_co_kr/201603/2016031341072233.jpg");
	background-image: -webkit-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("http://thegear.mygoodnews.com/imgdata/thegear_co_kr/201603/2016031341072233.jpg");
	background-image: -o-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("http://thegear.mygoodnews.com/imgdata/thegear_co_kr/201603/2016031341072233.jpg");
	background-image: -moz-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("http://thegear.mygoodnews.com/imgdata/thegear_co_kr/201603/2016031341072233.jpg");
}

.banner-img3 {
	background-image: linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://file.okky.kr/images/1531961894271.jpg");
	background-image: -webkit-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://file.okky.kr/images/1531961894271.jpg");
	background-image: -o-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://file.okky.kr/images/1531961894271.jpg");
	background-image: -moz-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://file.okky.kr/images/1531961894271.jpg");
}

.banner-img4 {
	background-image: linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/ERG/image/aJ-9bekGziAyqXHKWLlN-motqTQ.jpg");
	background-image: -webkit-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/ERG/image/aJ-9bekGziAyqXHKWLlN-motqTQ.jpg");
	background-image: -o-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/ERG/image/aJ-9bekGziAyqXHKWLlN-motqTQ.jpg");
	background-image: -moz-linear-gradient(rgba(0, 0, 0, 0.00) 60%,
		rgba(0, 0, 0, 0.64) 100%),
		url("https://t1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/ERG/image/aJ-9bekGziAyqXHKWLlN-motqTQ.jpg");
}

.banner-img0, .banner-img1, .banner-img2, .banner-img3, .banner-img4 {
	background-repeat: no-repeat;
	position: relative;
	background-size: cover;
	min-height: 550px;
	background-position: center center;
}

.dpCarouselDot {
	position: absolute;
	bottom: 10px;
	display: block;
	left: 0px;
	width: 100%;
	padding: 0;
	margin: 0px auto;
	list-style: none;
	text-align: center;
}

.dpCarouselDot.slick-dots li.slick-active button:before {
	opacity: .75;
	color: #fff;
}

.dpCarouselDot.slick-dots li button:before {
	font-family: 'slick';
	font-size: 6px;
	line-height: 20px;
	position: absolute;
	top: 0;
	left: 0;
	width: 20px;
	height: 20px;
	content: '•';
	text-align: center;
	opacity: .25;
	color: #fff;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

@media only screen and (max-width:1366px) {
	.banner-img0, .banner-img1, .banner-img2, .banner-img3, .banner-img4 {
		min-height: 400px;
	}
	.banner-carousel {
		max-width: 640px;
	}
}

@media only screen and (max-width:40em) {
	.banner-img0, .banner-img1, .banner-img2, .banner-img3, .banner-img4 {
		min-height: 300px;
	}
}
/* 끝  News 관련 CSS 다른곳에 넣어서 링크 걸면 이상하게 깨짐 그래서 여기다가 박음 끝  */
</style>
</head>
<body>
<!-- ======================================================= header (메뉴바)부분  ========================================================================== -->
<div id="header" class="header" style="outline: none;">
	<!-- 오른쪽 맨 위 상단에 로그인, 회원가입, 등등 버튼있는 부분입니다... -->
	<div class="contain">
		<dl class="hd_my">
			<dt class="ir">마이메뉴</dt>
			
			<c:if test="${ empty sessionScope.loginUser }">
			<dd id="header_loginbtn">
				<a href='loginView.do'>로그인</a>
			</dd>
			<dd id="header_joinbtn">
				<a href='joinView.do'>회원가입</a>
			</dd>
<%-- 				<h3 align="right">
					<c:out value="로그인 계정 없음"/>
				</h3> --%>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser && loginUser.userName != '관리자'}">
			<dd>
				<a style="font-size:12px;"> ${ loginUser.userName }님 환영합니다.</a>
			</dd>
			<dd class="arw">
				<a href='mypage.do'>마이페이지</a>
			</dd>
			<dd>
				<a href='logout.do'>로그아웃</a>
			</dd>			
			</c:if>
			
			<!-- 관리자 로그인시 -->
			<c:if test="${loginUser.userName == '관리자' }">
			<dd>
				<a style="font-size:12px;"> ${ loginUser.userName }님 환영합니다.</a>
			</dd>
			<dd class="arw">
				<a href='mypage.do'>마이페이지</a>
			</dd>
			<dd>
				<a href='logout.do'>로그아웃</a>
			</dd>
			<dd>
				<a href='admin.do'>관리자</a>
			</dd>
			</c:if>

			<%-- <%} %> --%>

			<dd class="arw">
				<!-- <a href="">고객센터<em class="ir">메뉴보기</em></a> -->
				<div class="lys" style="display: none;"></div>
			</dd>
		</dl>


		<!-- 상단 로고입니다 (로고 이미지 임시) -->
		<div class="hd_top">
			<h1 class="sd">
				<a href="<%=request.getContextPath()%>/index.jsp"><img
					style="margin-top: -20px; width: 270px; height:98px;"
					src="<%=request.getContextPath()%>/resources/images/mainlogo.jpg"
					alt="IT PLANET"></a>
			</h1>
		</div>
	</div>


	<!-- 메뉴바  -->
	<div class="hd_gnb">

		<h3 class="ir">카테고리메뉴</h3>
		<ul id="menubar">

			<!-- 공모전 -->
			<li class="menubar_li"><a href="competitionView.do">공모전</a></li>
			
			<!-- 자격증 -->
			<li class="menubar_li"><a href="lcsView.do">자격증</a></li>

			<!-- 채용공고 -->
			<li class="menubar_li"><a onclick="javascript:location.href='hList.do'">채용공고</a></li>

			<!-- 스터디 -->
			<li class="menubar_li"><a onclick="javascript:location.href='studyListView.do';">스터디</a></li>

			<!-- 코딩테스트 -->
			<li class="menubar_li"><a onclick="javascript:location.href='codingTestListView.do'">코딩테스트</a>
		</ul>
	</div>
</div>
<!-- =======================================================  끝 header (메뉴바)부분 끝 ========================================================================== -->

<!-- 메뉴바 관련 JS -->
<script type="text/javascript">
	$('.menubar_li').hover(function() {
		$(this).children('.subLyr').css({
			'display' : 'block',
			'height' : '280px'
		});
	}, function() {
		$(this).children('.subLyr').css({
			'display' : 'none',
			'height' : '280px'
		});
	});

	/*맨 오른쪽 상단 메뉴바 슬라이드 옵션*/
	$('.arw').hover(function() {
		$(this).find('.lys').css({
			'display' : 'block',
			'max-height' : '260px'
		});
	}, function() {
		$(this).find('.lys').css({
			'display' : 'none',
			'max-height' : ''
		});
	});
</script>

<script>
	var lastScrollTop = 0, delta = 15;
	$(window).scroll(function(event) {
		var st = $(this).scrollTop();
		if (Math.abs(lastScrollTop - st) <= delta)
			return;
		if ((st > lastScrollTop) && (lastScrollTop > 0)) {
			$(".header").css({
				"top" : "-110px"
			});
		} else {
			$(".header").css({
				"top" : "0"
			});
		}
		lastScrollTop = st;
	});
</script>
<!--  끝 메뉴바 관련 JS 끝 -->
<div style="margin-top:150px"></div>
	<!-- <br clear="all"> 메뉴바랑 슬라이드랑 띄는--> 

<!-- News 부분 -->

<div class="content-wrapper" style="margin-bottom: 10px;">
	<!-- banner :: carousel-->
	<div class="banner-carousel-wrapper">
		<div class="banner-carousel">

			<a href="https://www.blockmedia.co.kr/archives/41160">
				<div class="banner-img0 banner-img">
					<div id="banner-desc0"
						class="line-clamp line-clamp-2-md line-clamp-2">한국 대학생들&#44; &#39;블록체인&#39;에 흠뻑 빠져&#46;&#46;&#46; 블록체인 활용한 연구에 개발까지</div> 
						<!-- &#34; : "표시임  -->
				</div>
				<div class="overlay"></div>
			</a> <a href="https://1boon.kakao.com/appstory/180413_2">
				<div class="banner-img1 banner-img">
					<div id="banner-desc1"
						class="line-clamp line-clamp-2-md line-clamp-2">&#91;기자대담&#93; 올해부터 시작되는 코딩 교육&#44; 왜 해야 할까&#63;</div>
				</div>
				<div class="overlay"></div>
			</a> <a href="http://thegear.mygoodnews.com/11255">
				<div class="banner-img2 banner-img">
					<div id="banner-desc2"
						class="line-clamp line-clamp-2-md line-clamp-2">초보 사원에게 가장 많은
						 연봉 주는 IT 업체는?</div>
				</div>
				<div class="overlay"></div>
			</a> <a href="http://okjsp.pe.kr:8080/article/484307">
				<div class="banner-img3 banner-img">
					<div id="banner-desc3"
						class="line-clamp line-clamp-2-md line-clamp-2">&#91;KH정보교육원&#93; 이공계 전문 기술 연수 사업-자바 FRAMEWOKR 기반 웹 응용SW 개발자 양성과정 모집</div>
				</div>
				<div class="overlay"></div>
			</a> <a href="https://brunch.co.kr/@neo3xdh/22">
				<div class="banner-img4 banner-img">
					<div id="banner-desc4"
						class="line-clamp line-clamp-2-md line-clamp-2">&#34;IT업계 지원자를 위한 5가지 조언&#34;</div>
				</div>
				<div class="overlay"></div>
			</a>

		</div>
	</div>
</div>

<!-- News 부분 끝 -->

<!-- 뉴스JS -->
<script type='text/javascript'>
	$(document).ready(function() {
		$('.banner-carousel').slick({
			autoPlay : true,
			centerMode : false,
			autoplaySpeed : 3000,
			slidesToShow : 1,
			slidesToScroll : 1,
			arrows : false,
			dots : true,
			mobileFirst : true,
			responsive : [ {
				breakpoint : 640,
				settings : {
					variableHeight : true,
					variableWidth : false,
					centerMode : false,
					slidesToShow : 1,
					slidesToScroll : 1,
					arrows : true,
					dots : true,
					dotsClass : 'dpCarouselDot slick-dots'
				}
			} ]
		});
	});
</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  지 금 딱  이 모 임 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

<section class="section_now_event">
            <div class="title_area" style="margin-top: 2%; margin-bottom: 2%; text-align: center;">
                <h1 class="title">지금 딱! <span class="text_normal">이 공모전</span></h1>
            </div>
            <div class="content_wrap wide_max_width_area">
                <div class="area_top">
                    <ul class="event_list" id="mainCompNow">
                      <li>
                            <article class="event_area event_card">
                                <a href="/cs/a/45537?url=%2Fevent%2F183913" target="_blank" title="KT S/W Developer Conference 2019" data-c="hotissue1">
                                    <!-- 이미지 -->
                                    <div class="event_thumbnail">
                                        <img src="https://cfile1.onoffmix.com/images/event/183913/s">
                                    </div>

                                    <div class="event_info_area">
                                        <!-- 타이틀 -->
                                        <div class="title_area">
                                            <h5 class="title ellipsis">
                                            KT S/W Developer Conference 2019</h5>
                                        </div>
                                        <!-- 정보 -->
                                        <div class="event_info">
                                            <div class="type_info">
                                                <span class="payment_type free">
                                                    무료    
                                                </span>
                                            </div>
                                            <div class="date">8.27 (화)</div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </li>
                                                                            <li>
                            <article class="event_area event_card">
                                <a href="/cs/a/46552?url=%2Fevent%2F190606" target="_blank" title="●[선착순 무료] MD가 직접 알려주는 이베이, 아마존, 도매꾹 등 대형유통사&amp;해외 글로벌 마켓 진출 노하우" data-c="hotissue2">
                                    <!-- 이미지 -->
                                    <div class="event_thumbnail">
                                        <img src="https://cfile1.onoffmix.com/images/event/190606/s">
                                    </div>

                                    <div class="event_info_area">
                                        <!-- 타이틀 -->
                                        <div class="title_area">
                                            <h5 class="title ellipsis">
                                            ●[선착순 무료] MD가 직접 알려주는 이베이, 아마존, 도매꾹 등...</h5>
                                        </div>
                                        <!-- 정보 -->
                                        <div class="event_info">
                                            <div class="type_info">
                                                <span class="payment_type free">
                                                    무료    
                                                </span>
                                            </div>
                                            <div class="date">8.29 (목) ~ 8.30 (금)</div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </li>
                                                                            <li>
                            <article class="event_area event_card">
                                <a href="/cs/a/46628?url=%2Fevent%2F191431" target="_blank" title="멀티캠퍼스 4차산업혁명 선도인력양성 교육(19년 하반기)" data-c="hotissue3">
                                    <!-- 이미지 -->
                                    <div class="event_thumbnail">
                                        <img src="https://cfile1.onoffmix.com/images/event/191431/s">
                                    </div>

                                    <div class="event_info_area">
                                        <!-- 타이틀 -->
                                        <div class="title_area">
                                            <h5 class="title ellipsis">
                                            멀티캠퍼스 4차산업혁명 선도인력양성 교육(19년 하반기)</h5>
                                        </div>
                                        <!-- 정보 -->
                                        <div class="event_info">
                                            <div class="type_info">
                                                <span class="payment_type free">
                                                    무료    
                                                </span>
                                            </div>
                                            <div class="date">10.18 (금) ~ 4.21 (화)</div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </li>
                                                                            <li>
                            <article class="event_area event_card">
                                <a href="/cs/a/46261?url=%2Fevent%2F189924" target="_blank" title="NCS 인증, 경영자격증 발급 휴넷 MBA" data-c="hotissue4">
                                    <!-- 이미지 -->
                                    <div class="event_thumbnail">
                                        <img src="https://cfile1.onoffmix.com/images/event/189924/s">
                                    </div>

                                    <div class="event_info_area">
                                        <!-- 타이틀 -->
                                        <div class="title_area">
                                            <h5 class="title ellipsis">
                                            NCS 인증, 경영자격증 발급 휴넷 MBA</h5>
                                        </div>
                                        <!-- 정보 -->
                                        <div class="event_info">
                                            <div class="type_info">
                                                <span class="payment_type free">
                                                    무료    
                                                </span>
                                            </div>
                                            <div class="date">8.28 (수)</div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </li>
                                                                            <li>
                            <article class="event_area event_card">
                                <a href="/cs/a/46485?url=%2Fevent%2F189932" target="_blank" title="투자 집중형 ENNOvation TANK 시즌Ⅱ 참여 기업 모집" data-c="hotissue5">
                                    <!-- 이미지 -->
                                    <div class="event_thumbnail">
                                        <img src="https://cfile1.onoffmix.com/images/event/189932/s">
                                    </div>

                                    <div class="event_info_area">
                                        <!-- 타이틀 -->
                                        <div class="title_area">
                                            <h5 class="title ellipsis">
                                            투자 집중형 ENNOvation TANK 시즌Ⅱ 참여 기업 모집</h5>
                                        </div>
                                        <!-- 정보 -->
                                        <div class="event_info">
                                            <div class="type_info">
                                                <span class="payment_type free">
                                                    무료    
                                                </span>
                                            </div>
                                            <div class="date">9.12 (목) ~ 2.29 (토)</div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </li>
                                                                            <li>
                            <article class="event_area event_card">
                                <a href="/cs/a/46040?url=%2Fevent%2F189155" target="_blank" title="2019년 노사상생플러스(+)교육 하반기 교육생 모집" data-c="hotissue6">
                                    <!-- 이미지 -->
                                    <div class="event_thumbnail">
                                        <img src="https://cfile1.onoffmix.com/images/event/189155/s">
                                    </div>

                                    <div class="event_info_area">
                                        <!-- 타이틀 -->
                                        <div class="title_area">
                                            <h5 class="title ellipsis">
                                            2019년 노사상생플러스(+)교육 하반기 교육생 모집</h5>
                                        </div>
                                        <!-- 정보 -->
                                        <div class="event_info">
                                            <div class="type_info">
                                                <span class="payment_type free">
                                                    무료    
                                                </span>
                                            </div>
                                            <div class="date">8.27 (화) ~ 12.3 (화)</div>
                                        </div>
                                    </div>
                                </a>
                            </article>
                        </li>
                    </ul>

                    <!-- 최소1구좌, 최대3구좌 -->
                    <div class="banner_now_top owl-carousel owl-loaded owl-drag">
                       <div class="owl-stage-outer">
                       	<div id="topCompe" class="owl-stage" style="transition: all 0s ease 0s; width: 3150px; transform: translate3d(-900px, 0px, 0px);">
                        	
                        </div>
                       </div>
                </div>
                
            </div>
            </div>
        </section>

<!-- 333333333333333333333333333333333333 공모전 / 스터디 / 채용공고 / 코딩테스트 4개 같이 있는 부분  CSS파일명 : asdf.css  @@@@@@@@@@@@@@@@@@@@@@@@33333333333333333333333333 -->
<div id="container" data-campus-id="0">

	<hr>
	<div class="section" data-category1="1">
		<h2>공모전</h2>

		<div class="lists">
			<div id="mainComp" class="list" data-category2="0">
				
			</div>
		</div>
		<div class="loading" style="display: none;"></div>
	</div>
	<div class="section" data-category1="2">
		<h2>스터디</h2>

		<div class="lists">
			<div id="mainStudy" class="list" data-category2="0">
				
			</div>
		</div>
		<div class="loading" style="display: none;"></div>
	</div>
	<div class="section" data-category1="3">
		<h2>채용 공고</h2>

		<div class="lists">
			<div class="list" data-category2="0" id="hireData">
				<!-- <a class="item" href="/study/view?id=10162"><h3>Mos 모스 자격증
						공부 하시는분 계신가요?</h3>
					<p class="info">
						<span>오늘 07:15</span><span class="viewcount">16</span><span
							class="commentcount">0</span>
					</p></a><a class="item" href="/study/view?id=10143"><h3>[cpa]문정역
						인근 독서실에서 같이 공부 하실분 계신가요</h3>
					<p class="info">
						<span>08/20</span><span class="viewcount">87</span><span
							class="commentcount">1</span>
					</p></a><a class="item" href="/study/view?id=10133"><h3>컴활 2급 실기
						같이 공부해요!!</h3>
					<p class="info">
						<span>08/20</span><span class="viewcount">101</span><span
							class="commentcount">4</span>
					</p></a><a class="more" href="/study/list?category1=3&amp;category2=0">채용 공고 더 보기</a> -->
			</div>
		</div>
		<div class="loading" style="display: none;"></div>
	</div>
	<div class="section" data-category1="4">
		<h2>자격증</h2>

		<div class="lists">
			<div id="mainLicense" class="list" data-category2="0">

			</div>
		</div>
		<div class="loading" style="display: none;"></div>
	</div>
</div>

<script type="text/javascript">
	var uri ="https://oapi.saramin.co.kr/job-search?";
	var key ="access-key=mg233WU8HnG8aF5jrYPTqeBpU7Tr4OpGQtN38PyKptDLgj4ciNwbm";
	var job_category = "&job_category=4"
	var start = "&start=1";
	var count = "&count=3";

	$(document).ready(function(){
		
		var resultURL = uri + key + job_category+ start + count;
		$.ajax({
			url: "hJsonList.do",
			type: "POST",
			data: {"resultURL" : resultURL},
			dataType: "json",
			success: function(data){
				$hireData = $("#hireData");
				var $aItem;
				var $title;
				var $info;
				var $span1;
				var $span2;
				var $span3;
				var $link;
				
				
				if(data.length > 0){
					for(var i in data){
					$aItem = $("<a class='item' target='_sub' >").attr("href",decodeURIComponent(data[i].href));
					$title = $("<h3>").text(decodeURIComponent(data[i].title).replace(/[+]/gi," "));
					$info = $("<p class='info'>");
					$span1 = $("<span>").text(decodeURIComponent(data[i].industry));
					$span2 = $("<span class='viewcount'>").text((decodeURIComponent(data[i].location)).replace(/[+&gt;+]/gi," "));
					$span3 = $("<span class='commentcount'>").text(decodeURIComponent(data[i].jobType));
					
					$info.append($span1);
					$info.append($span2);
					$info.append($span3);
					$aItem.append($title);
					$aItem.append($info);
					
					$hireData.append($aItem);
					}
				}
				$link = $("<a class='more' href='hList.do'>").text("채용 공고 더 보기");
				$hireData.append($link);
			}
			
		});
		
	});
</script>

<!-- 333333333333333333333333333333333333 끝 /CSS 공모전 / 스터디 / 채용공고 / 코딩테스트 4개 같이 있는 부분 CSS파일명 : asdf.css @@@@@@@@@@@@@@@@@@@@@@@@33333333333333333333333333 -->
<script>
	$(document).ready(function(){
		$.ajax({
			url:"mainStudy.do",
			dataType: "json",
			success: function(data){
				$mainStudy = $("#mainStudy");
				$mainStudy.html("");
				
				var $a;
				var $h3;
				var $p;
				var $span1;
				var $span2;
				var $span3;
				var $aMore;
				var logUser = '${loginUser}';
					
				if(data.length > 0){
					if(logUser != ''){
						for(var i in data){
							$a = $("<a class='item'>").attr('href',  'studyDetail.do?sId='+ data[i].sId);
							$h3 = $("<h3>").text(decodeURIComponent(data[i].sTitle.replace(/\+/g," ")));
							$p = $("<p class='info'>");
							$span1 = $("<span>").text(data[i].createDate);
							$span2 = $("<span class='viewcount'>").text("조회수 : " + data[i].sCount);
							$span3 = $("<span class='commentcount'>").text(decodeURIComponent(data[i].sCategory.replace(/\+/g," ")) + " - " + decodeURIComponent(data[i].sCaName.replace(/\+/g," ")));
							
							$p.append($span1);
							$p.append($span2);
							$p.append($span3);
							$a.append($h3);
							$a.append($p);
							$mainStudy.append($a);
						}
						$aMore = $("<a class='more' href='studyListView.do'>").text("스터디 더 보기");
						$mainStudy.append($aMore);
					}else{
						for(var i in data){
							$a = $("<a class='item'>");
							$h3 = $("<h3>").text(decodeURIComponent(data[i].sTitle.replace(/\+/g," ")));
							$p = $("<p class='info'>");
							$span1 = $("<span>").text(data[i].createDate);
							$span2 = $("<span class='viewcount'>").text("조회수 : " + data[i].sCount);
							$span3 = $("<span class='commentcount'>").text(decodeURIComponent(data[i].sCategory.replace(/\+/g," ")) + " - " + decodeURIComponent(data[i].sCaName.replace(/\+/g," ")));
							
							$p.append($span1);
							$p.append($span2);
							$p.append($span3);
							$a.append($h3);
							$a.append($p);
							$mainStudy.append($a);
						}
						$aMore = $("<a class='more' href='studyListView.do'>").text("스터디 더 보기");
						$mainStudy.append($aMore);
					}
				}else{
					$h3 = $("<h3>").text("등록된 스터디가 없습니다.");
					
					$mainStudy.append($h3);
				}
				
			}
		});
		
		$.ajax({
			url:"mainComp.do",
			dataType: "json",
			success: function(data){
				$mainComp = $("#mainComp");
				$mainComp.html("");
				
				var $aComp;
				var $h3Comp;
				var $pComp;
				var $span1Comp;
				var $span2Comp;
				var $aMoreComp;
				
				if(data.length > 0){
					for(var i in data){
						$aComp = $("<a class='item'>").attr('href', 'competitionDetail.do?cId='+ data[i].cId);
						$h3Comp = $("<h3>").text(decodeURIComponent(data[i].cTitle.replace(/\+/g," ")));
						$pComp = $("<p class='info'>");
						$span1Comp = $("<span>").text(data[i].cStartDate + " ~ " + data[i].cDueDate);
						$span2Comp = $("<span class='viewcount'>").text("조회수 : " + data[i].cCount);
						
						$pComp.append($span1Comp);
						$pComp.append($span2Comp);
						$aComp.append($h3Comp);
						$aComp.append($pComp);
						$mainComp.append($aComp);
					}
					$aMoreComp = $("<a class='more' href='competitionView.do'>").text("공모전 더 보기");
					$mainComp.append($aMoreComp);
				}else{
					$h3Comp = $("<h3>").text("등록된 공모전이 없습니다.");
					$mainComp.append($h3Comp);
				}
			}
			
		});
		
		$.ajax({
			url:"mainLicense.do",
			dataType:"json",
			success:function(data){
				$mainLicense = $("#mainLicense");
				$mainLicense.html("");
				
				var $a;
				var $h3;
				var $p;
				var $span1;
				var $span2;
				var $aMore;
				
				if(data.length > 0){
					for(var i in data){
						$a = $("<a class='item'>").attr('href', 'lcsView.do');
						$h3 = $("<h3>").text(decodeURIComponent(data[i].l_name.replace(/\+/g," ")));
						$p = $("<p class='info'>");
						$span1 = $("<span>").text(data[i].start_date + " - " + data[i].end_date);
						$span2 = $("<span class='viewcount'>").text(decodeURIComponent(data[i].l_address.replace(/\+/g," ")));
						
						$p.append($span1);
						$p.append($span2);
						$a.append($h3);
						$a.append($p);
						$mainLicense.append($a);
					}
					
					$aMore = $("<a class='more' href='lcsView.do'>").text("자격증 더 보기");
					$mainLicense.append($aMore);
				}else{
					$h3 = $("<h3>").text("등록된 자격증이 없습니다.");
					$mainLicense.append($h3);
				}
				
			}
		});
		
		$.ajax({
			url: "mainCompNow.do",
			dataType: "json",
			success: function(data){
				$topCompe = $('#topCompe');
				$topCompe.html("");
				
				$mainCompNow = $('#mainCompNow');
				$mainCompNo2.html("");
				
	        	var $topdiv=$('<div class="owl-item active center" style="width: 450px;">');
	        	var $topa = $('<a href="/cs/a/46258?url=%2Fevent%2F189742" target="_blank" title="4개항만공사 창업 아이디어 발굴 해커톤" data-c="559c659b1">');
	        	var $topImg = $('<img src="https://cfile1.onoffmix.com/attach/UgEBMzkp9AqNOP4HWxfLovJZYTmIKhld" alt="4개항만공사 창업 아이디어 발굴 해커톤">');
	        	var $topdiv2=$('<div class="owl-item active center" style="width: 450px;">');
	        	var $topa2 = $('<a href="/cs/a/46258?url=%2Fevent%2F189742" target="_blank" title="4개항만공사 창업 아이디어 발굴 해커톤" data-c="559c659b1">');
	        	var $topImg2 = $('<img src="https://cfile1.onoffmix.com/attach/UgEBMzkp9AqNOP4HWxfLovJZYTmIKhld" alt="4개항만공사 창업 아이디어 발굴 해커톤">');
	        	
	        	$topa.append($topImg);
	        	$topdiv.append($topa);
	        	$topa2.append($topImg2);
	        	$topdiv2.append($topa2);
	        	$topCompe.append($topdiv);
	        	$topCompe.append($topdiv2);
	        	
	        	var $topdiv3 = $('<div class="owl-item active center" style="width: 450px;">');
	        	var $topa3;
	        	var $topImg3;
	        	
	        	if(data.topComp.length > 0){
	        		
	        		$topa3 = $('<a>').attr('title', decodeURIComponent(data.topComp[0].cTitle.replace(/\+/g," ")));
	        		for(var i in data.cattachment){
	        			if(data.cattachment[i].cId == data.topComp[0].cId){
	        				$topImg3 = $('<img>').attr('src', '${ contextPath }/resources/compeloadFiles/' + data.cattachment[i].changeName).attr('title', decodeURIComponent(data.topComp[0].cTitle.replace(/\+/g," ")));
	        			}
	        		}
	        		$topa3.append($topImg3);
	        		$topdiv3.append($topa3);
	        		$topCompe.append($topdiv3);
	        	}
	        	
	        	var $li;
	        	var $article;
	        	var $a;
	        	var $divImg;
	        	var $img;
	        	var $divContent;
	        	var $divTitle;
	        	var $h5Title;
	        	var $divInfo;
	        	var $divDate;
	        	var $spanDate;
	        	
	        	if(data.competition.length > 0){
	        		for(var i in data.competition){
	        			$li = $('<li>');
	        			$article = $('<article class="event_area event_card">');
	        			$a = $('<a>').attr('href', 'competitionDetail.do?cId='+ data.competition[i].cId);
	        			$divImg = $('<div class="event_thumbnail">');
	        			for(var j in data.cattachment){
		        			if(data.cattachment[j].cId == data.competition[i].cId){
		        				$img = $('<img>').attr('src', '${ contextPath }/resources/compeloadFiles/' + data.cattachment[i].changeName);
		        			}
		        		}
	        			$divContent = $('<div class="event_info_area">');
	        			$divTitle = $('<div class="title_area">');
	        			$h5Title = $('<h5 class="title ellipsis">').text(decodeURIComponent(data.competition[i].cTitle.replace(/\+/g," ")));
	        			$divInfo = $('<div class="event_info">');
	        			$divDate = $('<div class="type_info">');
	        			$spanDate = $('<span class="payment_type free">').text()
	        		}
	        	}
			}
		});
	});
</script>


<!-- 푸터  -->
 <%@ include file="/WEB-INF/views/common/footer.jsp" %>	    
<!-- /푸터 -->
</body>
</html>