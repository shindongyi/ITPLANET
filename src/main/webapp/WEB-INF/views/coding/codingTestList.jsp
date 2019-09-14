<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코딩테스트 목록</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${ contextPath }/resources/css/coding/codingTestList.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
   
   <div class="header">
   
   </div>

   <div class="main ">

      <div class="banner-images__slider">
         <!-- Swiper -->
         <div class="swiper-container">
            <div class="swiper-wrapper">
               <div class="swiper-slide">
                  <a class="slider-item"
                     href="https://programmers.co.kr/learn/courses/10088?utm_source=programmers&amp;utm_medium=banner&amp;utm_campaign=course10088"
                     style="background: #37474F url(https://grepp-cloudfront.s3.ap-northeast-2.amazonaws.com/programmers_imgs/learn/course10088/programmers-banner-10088.jpg) no-repeat center; background-size: cover;"></a>
               </div>

               <div class="swiper-slide">
                  <a class="slider-item"
                     href="https://programmers.co.kr/events/7day-sql?utm_source=programmers&amp;utm_medium=learn_7daySQL&amp;utm_campaign=7daySQL"
                     style="background: #37474F url(https://grepp-cloudfront.s3.ap-northeast-2.amazonaws.com/programmers_imgs/events/sql-event/img-banner-sql.jpg) no-repeat center; background-size: cover;"></a>
               </div>

            </div>

            <div class="swiper-button-prev">
               <svg class="ic-24 ic-white">
                  <usexlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#ic-keyboard-arrow-left" /></svg>
            </div>
            <div class="swiper-button-next">
               <svg class="ic-24 ic-white">
                  <usexlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#ic-keyboard-arrow-right" /></svg>
            </div>
            <div class="swiper-pagination"></div>
         </div>
      </div>


      <div class="challenges__tabs--wrap">
         <ul class="nav nav-tabs justify-content-center nav-challenges-tabs"
            role="tablist">
            <li class="nav-item"><a class="nav-link active"
               href="/learn/challenges?tab=practice_kit">코딩테스트 고득점 Kit</a></li>
            <li class="nav-item"><a class="nav-link "
               href="/learn/challenges?tab=all_challenges">모든 문제</a></li>
         </ul>
      </div>

      <div class="container tab-content" id="tab_challenge">
         <div class="tab-pane fade active show" id="tab_practice_kit">
            <div class="alert alert-info alert-practice-kit">
               <h4>코딩테스트 고득점 Kit</h4>
               <h6>
                  코딩테스트에는 어떤 알고리즘/자료구조가 출제될까요?<br /> 사람들은 어떤 문제를 어려워할까요?<br /> 국내에서
                  코딩테스트를 가장 많이 운영해온 프로그래머스 팀이 코딩테스트 결과를 분석해서 만든 <b>고득점 Kit</b>.
                  코딩테스트에 자주 나오는 유형, 사람들이 많이 틀리는 유형을 간추렸습니다.
               </h6>
            </div>

            <section class="challenge__preparation">
               <ul class="preparations-list">
                  <li class="col-item">
                     <div class="card card-preparation">
                        <a href="/learn/courses/30/parts/12077">
                           <div class="card-body ">
                              <div class="ic-label-group">
                                 <svg class="ic-24">
                                    <use
                                       xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#ic-arrow-top-right" /></svg>
                              </div>
                              <h4 class="card-title">해시</h4>
                              <p class="card-text">해시는 Key-value쌍으로 데이터를 저장하는 자료구조입니다.</p>

                              <ul class="card-label-group">
                                 <li>
                                    <h6>출제 빈도</h6>
                                    <h5 class="high">
                                       높음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-up" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>평균 점수</h6>
                                    <h5 class="low">
                                       보통
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-maintain" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>문제 세트</h6>
                                    <h5>0 / 4</h5>
                                 </li>
                              </ul>
                           </div>
                        </a>
                     </div>
                  </li>

                  <li class="col-item">
                     <div class="card card-preparation">
                        <a href="/learn/courses/30/parts/12081">
                           <div class="card-body ">
                              <div class="ic-label-group">
                                 <svg class="ic-24">
                                    <use
                                       xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#ic-arrow-top-right" /></svg>
                              </div>
                              <h4 class="card-title">스택/큐</h4>
                              <p class="card-text">LIFO, FIFO, push &amp; pop! 스택과 큐를
                                 이용해서 문제를 풀어보세요.</p>

                              <ul class="card-label-group">
                                 <li>
                                    <h6>출제 빈도</h6>
                                    <h5 class="high">
                                       보통
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-maintain" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>평균 점수</h6>
                                    <h5 class="low">
                                       높음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-up" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>문제 세트</h6>
                                    <h5>0 / 6</h5>
                                 </li>
                              </ul>
                           </div>
                        </a>
                     </div>
                  </li>

                  <li class="col-item">
                     <div class="card card-preparation">
                        <a href="/learn/courses/30/parts/12117">
                           <div class="card-body ">
                              <div class="ic-label-group">
                                 <svg class="ic-24">
                                    <use
                                       xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#ic-arrow-top-right" /></svg>
                              </div>
                              <h4 class="card-title">힙(Heap)</h4>
                              <p class="card-text">힙은 특정한 규칙을 가지는 트리로, 힙을 이용해서 우선순위 큐를
                                 구현할 수 있습니다.</p>

                              <ul class="card-label-group">
                                 <li>
                                    <h6>출제 빈도</h6>
                                    <h5 class="high">
                                       보통
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-maintain" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>평균 점수</h6>
                                    <h5 class="low">
                                       높음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-up" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>문제 세트</h6>
                                    <h5>0 / 4</h5>
                                 </li>
                              </ul>
                           </div>
                        </a>
                     </div>
                  </li>

                  <li class="col-item">
                     <div class="card card-preparation">
                        <a href="/learn/courses/30/parts/12198">
                           <div class="card-body ">
                              <div class="ic-label-group">
                                 <svg class="ic-24">
                                    <use
                                       xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#ic-arrow-top-right" /></svg>
                              </div>
                              <h4 class="card-title">정렬</h4>
                              <p class="card-text">정렬을 이용해서 문제를 효율적으로 풀어보세요.</p>

                              <ul class="card-label-group">
                                 <li>
                                    <h6>출제 빈도</h6>
                                    <h5 class="high">
                                       높음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-up" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>평균 점수</h6>
                                    <h5 class="low">
                                       높음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-up" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>문제 세트</h6>
                                    <h5>0 / 3</h5>
                                 </li>
                              </ul>
                           </div>
                        </a>
                     </div>
                  </li>

                  <li class="col-item">
                     <div class="card card-preparation">
                        <a href="/learn/courses/30/parts/12230">
                           <div class="card-body ">
                              <div class="ic-label-group">
                                 <svg class="ic-24">
                                    <use
                                       xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#ic-arrow-top-right" /></svg>
                              </div>
                              <h4 class="card-title">완전탐색</h4>
                              <p class="card-text">무식해 보여도 사실은 최고의 방법일 때가 있지요.</p>

                              <ul class="card-label-group">
                                 <li>
                                    <h6>출제 빈도</h6>
                                    <h5 class="high">
                                       높음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-up" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>평균 점수</h6>
                                    <h5 class="low">
                                       낮음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-down" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>문제 세트</h6>
                                    <h5>0 / 4</h5>
                                 </li>
                              </ul>
                           </div>
                        </a>
                     </div>
                  </li>

                  <li class="col-item">
                     <div class="card card-preparation">
                        <a href="/learn/courses/30/parts/12244">
                           <div class="card-body ">
                              <div class="ic-label-group">
                                 <svg class="ic-24">
                                    <use
                                       xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#ic-arrow-top-right" /></svg>
                              </div>
                              <h4 class="card-title">탐욕법(Greedy)</h4>
                              <p class="card-text">부분적인 최적해가 전체적인 최적해가 되는 마법!</p>

                              <ul class="card-label-group">
                                 <li>
                                    <h6>출제 빈도</h6>
                                    <h5 class="high">
                                       낮음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-down" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>평균 점수</h6>
                                    <h5 class="low">
                                       낮음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-down" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>문제 세트</h6>
                                    <h5>0 / 7</h5>
                                 </li>
                              </ul>
                           </div>
                        </a>
                     </div>
                  </li>

                  <li class="col-item">
                     <div class="card card-preparation">
                        <a href="/learn/courses/30/parts/12263">
                           <div class="card-body ">
                              <div class="ic-label-group">
                                 <svg class="ic-24">
                                    <use
                                       xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#ic-arrow-top-right" /></svg>
                              </div>
                              <h4 class="card-title">동적계획법(Dynamic Programming)</h4>
                              <p class="card-text">불필요한 계산을 줄이고, 효율적으로 최적해를 찾아야만 풀리는
                                 문제들입니다.</p>

                              <ul class="card-label-group">
                                 <li>
                                    <h6>출제 빈도</h6>
                                    <h5 class="high">
                                       낮음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-down" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>평균 점수</h6>
                                    <h5 class="low">
                                       낮음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-down" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>문제 세트</h6>
                                    <h5>0 / 7</h5>
                                 </li>
                              </ul>
                           </div>
                        </a>
                     </div>
                  </li>

                  <li class="col-item">
                     <div class="card card-preparation">
                        <a href="/learn/courses/30/parts/12421">
                           <div class="card-body ">
                              <div class="ic-label-group">
                                 <svg class="ic-24">
                                    <use
                                       xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#ic-arrow-top-right" /></svg>
                              </div>
                              <h4 class="card-title">깊이/너비 우선 탐색(DFS/BFS)</h4>
                              <p class="card-text">깊이/너비 우선 탐색을 사용해 원하는 답을 찾아보세요.</p>

                              <ul class="card-label-group">
                                 <li>
                                    <h6>출제 빈도</h6>
                                    <h5 class="high">
                                       높음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-up" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>평균 점수</h6>
                                    <h5 class="low">
                                       낮음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-down" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>문제 세트</h6>
                                    <h5>0 / 4</h5>
                                 </li>
                              </ul>
                           </div>
                        </a>
                     </div>
                  </li>

                  <li class="col-item">
                     <div class="card card-preparation">
                        <a href="/learn/courses/30/parts/12486">
                           <div class="card-body ">
                              <div class="ic-label-group">
                                 <svg class="ic-24">
                                    <use
                                       xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#ic-arrow-top-right" /></svg>
                              </div>
                              <h4 class="card-title">이분탐색</h4>
                              <p class="card-text">이분탐색 기법을 이용해 효율적으로 값을 찾아보세요</p>

                              <ul class="card-label-group">
                                 <li>
                                    <h6>출제 빈도</h6>
                                    <h5 class="high">
                                       낮음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-down" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>평균 점수</h6>
                                    <h5 class="low">
                                       낮음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-down" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>문제 세트</h6>
                                    <h5>0 / 3</h5>
                                 </li>
                              </ul>
                           </div>
                        </a>
                     </div>
                  </li>

                  <li class="col-item">
                     <div class="card card-preparation">
                        <a href="/learn/courses/30/parts/14393">
                           <div class="card-body ">
                              <div class="ic-label-group">
                                 <svg class="ic-24">
                                    <use
                                       xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#ic-arrow-top-right" /></svg>
                              </div>
                              <h4 class="card-title">그래프</h4>
                              <p class="card-text">엣지를 지나 그래프의 노드를 탐험해봅시다.</p>

                              <ul class="card-label-group">
                                 <li>
                                    <h6>출제 빈도</h6>
                                    <h5 class="high">
                                       낮음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-down" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>평균 점수</h6>
                                    <h5 class="low">
                                       낮음
                                       <svg class="ic-inline">
                                          <use
                                             xlink:href="/assets/svg-defs-722cfac96ebe5384169c05342935090bc24e7347387ee900b2ec60186f7c4117.svg#inline-trending-down" /></svg>
                                    </h5>
                                 </li>
                                 <li>
                                    <h6>문제 세트</h6>
                                    <h5>0 / 4</h5>
                                 </li>
                              </ul>
                           </div>
                        </a>
                     </div>
                  </li>

               </ul>
            </section>
         </div>

      </div>

   </div>




</body>
</html>