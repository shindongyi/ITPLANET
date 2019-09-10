<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ contextPath }/resources/css/mainView/activity.css">

<title>Insert title here</title>
</head>
<body>
<c:import url="../common/menubar.jsp"/>
<section class="title" style="top: -170px; transform: none;">
    <div class="wrap">
      <p class="badges"><span>기획/아이디어</span><span>IT/소프트웨어/게임</span></p>
      <figure style="background-image: url('https://cf-cpi.campuspick.com/activity/1567243894878261_thumb.jpg');"></figure>
      <div class="content">
        <h1>제 4회 BU:STAR 챌린지 게임공모전</h1>
        <p class="company">부산정보산업진흥원</p>
        <p class="info"><span class="viewcount">119</span></p>
      </div>
    </div>
  </section>
  
  <section class="tab" style="top: 0px; transform: none;">
    <div class="wrap">
      <a href="/contest/view?id=6119" class="active"><span class="text">소개</span></a>
      <a href="/contest/view?id=6119&amp;menu=team" data-menu="team"><span class="text">팀원 모집</span><span class="teamcount count">0</span></a>
      <a href="/contest/view?id=6119&amp;menu=comment" data-menu="comment"><span class="text">댓글</span><span class="commentcount count">0</span></a>
    </div>
  </section>
  
  <div id="container" data-target="1" data-target-path="contest" data-id="6119" data-menu="" style="padding-top: 0px;"><div class="section"><h2>접수 기간</h2><p class="dday">D-68</p><p class="indent">11월 1일(금) ~ 11월 11일(월)</p></div><div class="section"><h2>기관</h2><h3>주최</h3><p class="indent">부산정보산업진흥원</p><h3>주관</h3><p class="indent">부산정보산업진흥원</p><h3>후원/협찬</h3><p class="indent">부산광영시, 한국콘텐츠진흥원</p></div><div class="section"><h2>시상</h2><h3>1등시상금</h3><p class="indent">5,000,000원</p><h3>총시상금</h3><p class="indent">1천만원이하</p><h3>특전</h3><p class="indent">작품전시, 기타</p></div><div class="poster"><img src="https://cf-cpi.campuspick.com/activity/1567243894878261.jpg"></div><div class="section"><article class="description">[제 4회 Bu:Star 챌린지 게임공모전]<br>● 게임개발에 관심이있지만 기회가 없었다!!<br>○ 게임관련 동아리or학과에 종사하고있다!!<br>● 게임을 관련해서 창업을 하고싶다!!<br><br>*시상금 총 1000만원!!*<br>(수상 혜택)<br>-부산글로벌게임센터 게임스테이션 입주지원<br>-2020 BIC 페스티벌 특별존 전시 기회 제공<br>-부산콘텐츠아카데미 게임개발 관련 강좌 우선수강기회 제공<br>-현업 게임 전문가와 함께하는 킥오프 원크숍 참가기회 및 정기멘토링 지원<br><br>@@자세한건 사진클릭 Go@@</article></div><div class="bottombar"><a class="scrap"><span>스크랩</span></a><a class="share"><span>공유</span></a></div></div>


<!-- 푸터  -->
<c:import url="../common/footer.jsp"/>
<!-- /푸터 -->
</body>
</html>