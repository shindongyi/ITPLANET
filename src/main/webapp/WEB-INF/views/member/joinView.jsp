<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/member/joinView-style.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/member/mypageCommon-style.css" type="text/css">
<style>
</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<div id="wrap">
	<div id="contentWrap">
		<form id="join_form" method="post" action="minsert.do">
			<h2>SIGN UP</h2>
			<p class="tPad">ITPLANET에 오신 것을 환영합니다.</p>
			<div id="join_content">
				<div class="row_group">
					<div class="join_row">
						<div class="box">
							<h3 class="join_title"><label for="userId">아이디</label><span class="red_mark">*</span></h3>
							<input type="text" id="userId" name="userId" class="int" maxlength="20">
						</div>
						<div class="error_box" id="idMsg" style="display: none;"></div>
					</div>
					<div class="join_row">
						<div class="box">
							<h3 class="join_title"><label for="userPwd">비밀번호</label><span class="red_mark">*</span></h3>
							<input type="password" id="userPwd" name="userPwd" class="int" maxlength="20">
						</div>
						<div class="error_box" id="userPwdMsg" style="display: none;"></div>
					</div>
					<div class="join_row">
						<div class="box">
							<h3 class="join_title"><label for="userPwd2">비밀번호 확인</label><span class="red_mark">*</span></h3>
							<input type="password" id="userPwd2" name="userPwd2" class="int" maxlength="20">
						</div>
						<div class="error_box" id="userPwd2Msg" style="display: none;"></div>
					</div>
				</div>
				<div class="row_group">
					<div class="join_row">
						<div class="box">
							<h3 class="join_title"><label for="userName">이름</label><span class="red_mark">*</span></h3>
							<input type="text" id="userName" name="userName" class="int">
						</div>
						<div class="error_box" id="userNameMsg" style="display: none;"></div>
					</div>
					<div class="join_row">
						<div class="box">
							<h3 class="join_title"><label for="nickName">닉네임</label><span class="red_mark">*</span></h3>
							<input type="text" id="nickName" name="nickName" class="int">
						</div>
						<div class="error_box" id="nickNameMsg" style="display: none;"></div>
					</div>
					<div class="join_row join_birth">
						<div class="birth_wrap">
							<h3 class="join_title"><label>생년월일</label><span class="red_mark">*</span></h3>
							<div class="inner_birth_wrap">
							<div class="birth_yy">
								<input type="text" id="birth_yy" name="birth_yy" class="int" maxlength="4">
							</div>
							<div class="birth_mm">
								<select id="birth_mm" name="birth_mm" class="sel">
								<option disabled selected>월</option>
								<c:forEach var="i" begin="1" end="12"> 
									<option>${ i }</option>
								</c:forEach>
								</select>
							</div>
							<div class="birth_dd">
								<input type="text" id="birth_dd" name="birth_dd" class="int" maxlength="2">
							</div>
							</div>
						</div>
						<div class="error_box" id="birthMsg" style="display: none;"></div>
					</div>
					<div class="join_row join_gender">
						<div class="box">
							<h3 class="join_title"><label for="gender">성별</label><span class="red_mark">*</span></h3>
							<select id="gender" name="gender" class="sel">
								<option disabled selected>성별</option>
								<option value="남">남자</option>
								<option value="여">여자</option>
							</select>
						</div>
						<div class="error_box" id="genderMst" style="display: none;"></div>
					</div>
					<div class="join_row">
						<div class="box">
							<h3 class="join_title"><label for="email">본인 확인 이메일</label><span class="red_mark">*</span></h3>
							<button class="join_btn" type="button" id="emailNumBtn" title="인증번호 전송버튼">인증번호 전송</button>
							<input type="text" id="email" name="email" class="int" autocomplete="off">
						</div>
						<div class="box" style="display:none;" id="emailCKArea">
							<span></span>
							<button type="button" class="join_btn" id="confirmNum">확인</button>
							<input id="emailNum" class="int" type="text" placeholder="인증번호를 입력해주세요.">
						</div>
						<div class="error_box" id="emailMsg" style="display: none; color:#555;"></div>
					</div>
				</div>
			</div>
			<!-- start clause -->
			<div class="policy">
				<p>
					<input type="checkbox" class="check" id="policyY">
					<label for="policyY">
						<strong>약관 전체 동의</strong>
					</label>
				</p>
				<ul>
					<li>
						<input type="checkbox" class="check" id="agreeUseAdult" name="agreeUseAdult">
						<label for="agreeUseAdult">본인은 만 14세 이상입니다.</label>
					</li>
					<li>
						<input type="checkbox" class="check" id="agreeUse" name="agreeUse">
						<label for="agreeUse">이용약관에 동의합니다.</label>
						<article class="agreement">제1조(목적)

							ITPLANET 통합서비스이용약관은 회사와 회원 간의 권리, 의무 및 책임 사항 등을 규정함을 목적으로 합니다.
							
							
							제2조(정의)
							
							1. "회사"란 서비스를 제공하는 주체를 말합니다.
							2. "서비스"란, 회사가 제공하는 서비스를 말합니다. 서비스는 정보통신설비를 이용하여 재화 및 용역을 거래할 수 있도록 설정한 가상의 영업장을 포함합니다. 서비스는 각 서비스 내부에서 보여지는 게시물, 기능, 재화, 용역 등을 모두 포함하며, 이와 관련된 사항과 정보 또한 모두 포함합니다.
							3. "회원"이란, 회사가 제공하는 서비스에 접속하여 본 약관을 동의하고 가입한 후 서비스를 제공받는 자를 말합니다.
							4. "게시물"이란, 서비스에 게재되는 모든 문자, 사진, 영상, 정보 등을 말합니다.
							5. "커뮤니티"란, 1:1 대화를 포함하여 회사가 제공하는 서비스 내 게시물이 게재될 수 있는 모든 공간을 말합니다.
							6. "약정"이란, 구매, 판매, 공급, 지급, 제작, 중개, 중계, 당첨 등 서비스 내부에서 회사와 회원 사이에 발생한 계약, 서약, 약속 등을 말합니다.
							7. "모든 약관"이란, ITPLANET 통합서비스이용약관, ITPLANET 통합개인정보처리방침 등 회사와 회원이 계약한 모든 약관을 말합니다.
							
							제3조(약관의 게시와 개정)
							
							1. 회사는 회사의 모든 약관과 법령에 따라 명시해야 하는 정보가 있을 경우, 서비스 하단, 더보기, 마이페이지, 기타 메뉴, 팝업 등에 게시할 수 있습니다.
							2. 회사는 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.
							3. 만약 개정내용이 회원에게 불리한 경우, 적용 일자 30일 이전부터 적용 일자 전일까지 ITPLANET 웹사이트 공지사항에 공지합니다.
							4. 회사가 제2항에 따라 개정 약관을 공지한 후, 회원이 30일 이내에 명시적으로 거부 의사 표시를 하지 않은 경우 회원이 개정 약관에 동의한 것으로 간주합니다.
							5. 회원이 개정약관의 적용에 동의하지 않는 경우, 회원은 이용계약을 해지함으로써 거부 의사를 표시할 수 있습니다.
							6. 회원은 약관 일부분만을 동의 또는 거부할 수 없습니다.
							
							
							제4조(서비스 이용 계약 등)
							
							1. 회원이 되고자 하는 자는 회사가 정한 가입 양식에 따라 회원 정보를 입력하고 각 약관을 동의한 후 동의 버튼을 누르는 방법으로 회원 가입을 신청합니다.
							2. 회사는 제1항과 같이 회원으로 가입할 것을 신청한 자에게 서비스 이용을 승낙함을 원칙으로 합니다. 다만, 다음 각호에 해당하는 경우, 별도의 통보 없이 회원가입을 거부하거나 이용 계약을 해지할 수 있습니다.
							- 각 약관을 준수하지 않거나 각 약관에 의해 가입 신청자가 회원 자격을 상실한 적이 있을 경우
							- 기타 회원으로 등록하는 것이 부적절하다고 판단되는 경우
							3. 회원가입신청의 성립은 회사의 승낙이 가입 신청자에게 도달한 시점으로 합니다.
							4. 회사는 부정사용방지 및 본인확인을 위해 제휴기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
							5. 회사는 회원이 서비스를 이용하는 도중, 연속하여 1년 동안 서비스를 이용하기 위해 로그인 기록이 없는 경우 회원자격을 박탈할 수 있습니다.
							
							
							제5조(회원의 의무)
							
							1. 회원은 회원가입신청을 한 시점의 정보와 현재의 정보가 다를 경우 즉시 변경사항을 정정해야 합니다.
							2. 회사가 관계 법령 및 각 약관에 의해서 책임을 지는 경우를 제외하고, 자신의 개인정보에 관한 관리책임은 각 회원에게 있으므로, 부정 사용되지 않도록 관리해야 합니다.
							3. 회원은 아이디 및 비밀번호가 도용되거나 제3자가 사용하고 있음을 인지한 경우 이를 즉시 회사에 통지하고, 회사의 안내에 따라야 합니다.
							4. 회원은 다음 행위를 할 수 없습니다
							- 신청 또는 변경 시 허위 기재, 기재 누락, 오기, 도용 행위
							- 회사 및 제3자의 명예를 손상시키거나 업무를 방해하는 행위
							- 회사의 모든 재산에 대한 침해 행위
							- 회사의 서비스 이외의 허가하지 않은 행위
							- 회사의 직원 또는 서비스 관리자를 사칭하는 행위
							- 서비스 내 게시물 및 자료를 허가 없이 이용, 변조, 삭제 및 외부로 유출하는 행위
							- 타인의 개인정보 및 계정을 수집, 저장, 공개, 이용하거나 자신과 타인의 개인정보를 제3자에게 공개, 양도하는 행위
							- 다중 계정을 생성 및 이용하는 행위
							- 허가되지 않은 상업적 행위
							- 통합개인정보처리방침 등 회원이 동의한 모든 약관에 대해 따르지 않는 행위
							- 통합커뮤니티이용규칙에 어긋나는 행위
							- 현행법에 어긋나거나 서비스 제공에 있어 부적절하다고 판단되는 행위
							5. 회원은 서비스를 이용함에 있어 회사의 각 약관을 준수하지 않거나 의무를 다하지 않아 회사나 다른 회원이 손해를 입을 경우, 그 손해를 배상할 책임이 있습니다.
							
							제6조(회원에 대한 통지 등)
							
							1. 회사가 특정 회원에 대해 통지를 하는 경우, 회원의 개인정보와 서비스 내부 수단을 사용할 수 있습니다.
							2. 회원 전체에 대한 통지의 경우, 공지사항에 게시함으로써 제1항의 통지에 대신할 수 있습니다.
							3. 회원이 30일 이내에 의사 표시를 하지 않은 경우, 회원이 통지 내용에 대해 동의한 것으로 간주합니다.
							
							
							제7조(서비스 및 약정의 제공, 변경, 중단, 철회)
							
							1. 회사는 회사가 자체 개발하거나 다른 회사와의 협력을 통해 회원들에게 제공할 일체의 서비스를 제공합니다.
							2. 회원은 서비스에서 제공하는 기능을 이용하여 재화 및 용역을 구매하거나, 이벤트 등에 참여할 때, 회신, 서명, 버튼을 누르는 방식 등으로 동의 의사를 표현하여 약정을 체결할 수 있습니다.
							3. 서비스를 이용하거나 약정을 체결할 경우, 서비스를 이용하거나 약정을 체결하기까지 명시된 모든 내용에 동의한 것으로 봅니다.
							4. 회원은 서비스에서 재화 및 용역을 구매할 경우, 결제대금예치 등 구매 시점에 서비스에 명시되어 있는 방법을 이용하여 대금을 지급할 수 있습니다.
							5. 회사는 별도의 약정이 없을 경우, 재화 및 용역을 최대 14일 이내에 공급할 수 있습니다.
							6. 회사는 운영상, 기술상의 필요에 따라 제공하고 있는 서비스를 변경할 수 있습니다.
							7. 회사는 점검, 고장, 교체, 변경, 품절 등의 불가피한 사유가 발생한 경우, 서비스 및 약정을 일시적 및 영구적으로 보류 및 중단할 수 있으며, 약정의 내용을 대체하거나 회원의 동의에 따라 약정을 파기할 수 있습니다. 회원이 회사에 대금을 지급한 약정이 파기될 경우, 회사는 파기 시점으로부터 3영업일 이내에 지급받은 대금을 환급합니다.
							8. 회사와 재화 및 용역에 대해 구매 약정을 체결한 회원은 재화 및 용역 수령일로부터 7일 이내에 청약철회를 할 수 있습니다.
							9. 회원은 다음의 경우 반품 및 교환을 할 수 없습니다.
							- 소비자에게 책임이 있는 사유로 재화 등이 멸실되거나 훼손된 경우 (단, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외합니다. 단, 전자기기의 봉인지, 비닐 포장 등 훼손하지 않더라도 재화를 확인할 수 있는 포장을 훼손했을 경우 반품 및 교환을 할 수 없습니다.)
							- 소비자의 사용 또는 일부 소비로 재화 등의 가치가 현저히 감소한 경우
							- 시간이 지나 다시 판매하기 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우
							- 복제가 가능한 재화 등의 포장을 훼손한 경우
							10. 서비스 변경 및 중단의 경우에는 제6조에서 정한 방법을 통해 통지합니다. 다만 회사가 통제할 수 없는 사유로 서비스가 중단되어 통지가 불가능한 경우에는 통지하지 않습니다.
							
							
							제8조(회사의 의무)
							
							1. 회사는 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않습니다.
							2. 회사는 안정적, 지속적이고 편리한 서비스를 제공하기 위해 노력합니다.
							
							
							제9조(저작권의 귀속)
							
							1. 회사가 작성한 게시물에 대한 권리는 회사에게 귀속됩니다.
							2. 회사는 유용하고 편리한 서비스를 제공하기 위해, 2019년부터 서비스 및 서비스 내부의 기능의 체계와 다양한 부가기능을 직접 설계 및 운영하고 있는 데이터베이스 제작자에 해당합니다. 회사는 저작권법에 따라 데이터베이스 제작자는 복제권 및 전송권을 포함한 데이터베이스 전부에 대한 권리를 가지고 있으며, 이는 법률에 따라 보호를 받는 대상입니다. 그러므로 회원 또는 사이트 접속자는 데이터베이스 제작자인 회사의 승인 없이 데이터베이스의 전부 또는 일부를 복제·배포·방송 또는 전송할 수 없습니다.
							3. 회원이 작성한 게시물에 대한 권리는 회원에게 귀속됩니다. 단, 회사는 서비스의 운영, 확장, 홍보 등의 필요한 목적으로 회원의 저작물을 합리적이고 필요한 범위 내에서 별도의 허락 없이 수정하여 무상으로 사용하거나 제휴사에게 제공할 수 있습니다. 이 경우, 개인정보는 절대 제공하지 않습니다.
							4. 회사는 제3항 이외의 방법으로 회원의 게시물을 이용할 경우, 회원의 개인정보와 서비스 내부 수단을 이용하여 회원의 동의를 받아야 합니다.
							
							
							제10조(게시물 및 커뮤니티의 관리)
							
							1. 회원이 관련법 및 각 약관에 위배되는 내용의 커뮤니티를 개설하거나 게시물을 게시할 경우, 회사는 해당 서비스, 커뮤니티 또는 게시물을 임의로 삭제, 중단, 변경 등의 조치를 할 수 있고 회원의 자격 및 권한을 제한, 정지 및 박탈할 수 있습니다.
							2. 회원의 게시물로 인한 법률상 이익 침해를 근거로, 다른 회원 또는 제3자가 회원 또는 회사를 대상으로 하여 민형사상의 법적 조치를 취하거나 관련된 게시물의 삭제를 요청하는 경우, 회사는 관련 게시물에 대한 접근을 잠정적으로 제한할 수 있습니다.
							
							
							제11조(광고의 게재 및 발신)
							
							1. 회사가 회원에게 서비스를 제공할 수 있는 투자기반의 일부는 광고게재를 통한 수익에서 나옵니다. 회사는 회원이 등록한 게시물이나 그 내용을 활용한 광고게재 및 기타 서비스를 이용하면서 노출되는 광고를 게재할 수 있습니다.
							2. 회사는 회원이 광고성 정보 수신에 동의할 경우, 이메일, 푸시 알림, 1:1 대화, 문자 메시지 등 전자적 매체를 이용하여 광고성 정보를 발신할 수 있습니다.
							
							
							제12조(이용계약 해지)
							
							1. 회원은 언제든지 [내 정보] 메뉴를 통해 이용계약 해지 신청을 할 수 있으며, 회사는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.
							2. 회원이 이용계약을 해지할 경우, 관련법 및 통합개인정보처리방침에 따라 모든 개인정보가 처리됩니다.
							3. 회원은 커뮤니티를 생성했거나 생성한 자로부터 권한을 양도받아 관리 책임이 있을 경우, 관리 책임을 없애거나 양도하기 전까지는 이용계약을 해지할 수 없습니다.
							4. 회원이 이용계약을 해지하더라도, 서비스 이용 시 작성하거나 만들어진 모든 게시물은 삭제되지 않습니다.
							5. 회원이 이용계약을 해지한 뒤 새로 가입한 경우, 해지한 계정의 게시물 권한 등 모든 권리는 이양되지 않습니다.
							
							
							제13조(책임제한)
							
							1. 회사는 다음의 경우, 어떠한 경우라도 책임을 지거나 보상을 하지 않으며, 회원에게 귀책사유가 있을 경우, 별도의 통보 없이 자격을 제한, 정지 및 박탈할 수 있습니다.
							- 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우
							- 회사가 무료로 제공하는 서비스가 변경, 중단되거나 장애가 생길 경우
							- 회사가 고의·과실이 없음을 입증할 경우
							- 회원의 작성한 게시물에 대한 정보, 자료, 신뢰도, 정확성에 대해
							- 회원 간이나 회원과 광고주 등 제3자 상호 간에 합의한 거래 등에 대해
							- 회원이 서비스를 이용함에 있어 회사의 각 약관을 준수하지 않거나 의무를 다하지 않을 경우
							2. 회사는 제1항 외 귀책사유로 인하여 재화 및 용역을 구매한 회원에게 법률적으로 인과관계를 밝힐 수 있는 손해가 발생하는 경우에는 그 손해를 배상할 책임이 있습니다.
							
							
							제14조(분쟁해결)
							
							1. 회사는 회원이 제기하는 문의, 정당한 의견 및 불만을 반영 및 처리하고 그 피해를 보상 처리하기 위하여 피해보상처리기구를 설치 및 운영합니다.
							2. 회사와 회원 간에 발생한 전자상거래 분쟁과 관련하여 회원의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시 도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
							
							
							제15조(재판관할)
							
							1. 회사와 회원 간 제기된 소송은 대한민국법을 준거법으로 하며, 관할 법원에 제소합니다.
							2. 회사와 회원 간 발생한 분쟁에 관한 소송은 제소 당시 회원의 주소에 의하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로 합니다. 단, 제소 당시 회원의 주소 또는 거소가 명확하지 아니한 경우의 관할법원은 민사소송법에 따라 정합니다.
							3. 해외에 주소나 거소가 있는 회원의 경우, 회사와 회원간 발생한 분쟁에 관한 소송은 전항에도 불구하고 대한민국 서울중앙지방법원을 관할 법원으로 합니다.
							
							
							제16조(부칙)
							
							- 이 약관은 2019년 09월부터 적용되었고, 2019년 9월 01일에 최신화 되었습니다.
							- 이 약관은 타 약관보다 우선하며, 이 약관 제2조의 정의는 모든 약관에 적용됩니다.
							- 회사가 직접 제공하는 사이트 이외에 링크된 사이트에서는 모든 약관이 적용되지 않습니다.
							- 이 약관에 명시되어있지 않은 사항은 관련 법령을 따릅니다.
						</article>
					</li>
					<li>
						<input type="checkbox" class="check" id="agreePrivate" name="agreePrivate">
						<label for="agreePrivate">개인정보 수집/이용에 동의합니다.</label>
						<article class="agreement">ITPLANET 통합개인정보처리방침은 회사가 제공하는 다양한 서비스를 제공함에 있어, 정보를 어떻게 수집·이용·보관·파기하는지에 대한 정보를 담은 방침을 의미합니다. 
						ITPLANET 통합개인정보처리방침은 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 국내의 개인정보 보호 법령을 준수하고 있으며, 각 서비스에서 언제든지 이 방침을 확인할 수 있습니다.

							1. 항목
							
							회원은 회원가입을 하지 않더라도, 대학생 맞춤 서비스를 회원과 동일하게 이용할 수 있습니다.
							회원은 본인의 선택으로 회원가입을 한 뒤 서비스를 이용할 수 있습니다. 이 경우, 회사는 회원가입 시점부터 아래와 같은 개인정보 중 일부를 수집합니다. 단, 회원이 각 항목에 해당되지 않을 경우, 해당 항목의 개인정보는 절대 수집하지 않습니다.
							1) 회원이 회원가입 또는 본인확인을 할 경우
							- 아이디, 이메일, 성별, 나이, 이름, 닉네임
							2) 회원이 회사와 약정을 체결할 경우
							- 이름, 주소, 연락처
							※ 각 항목 또는 추가적으로 수집이 필요한 항목의 개인정보는 문의하기를 통한 회원 지원 과정 및 별도의 알림창을 통해서 서비스 이용 중 수집될 수 있습니다.
							※ 회사는 인종, 사상, 의료정보 등 회원의 민감정보를 절대로 수집하지 않습니다.
							
							
							2. 목적
							
							회사는 쾌적한 서비스를 제공하기 위해, 아래의 목적에 한해 개인정보를 이용합니다.
							1) 회원 식별, 가입의사 및 탈퇴의사 확인, 부정이용 및 중복가입 방지 등 회원관리
							2) 서비스 개발·제공·개선
							3) 인구통계학적 자료 분석을 통한 맞춤형 서비스 및 광고 제공
							4) 회원 문의/제안/제휴/협력/게시 요청 처리, 공지사항 전달
							5) 구매, 판매, 배송, 공급, 지급, 제작, 중개, 중계, 당첨 등 회사와 회원 간 체결된 약정 이행
							
							
							3. 기간
							
							최대 1년
							단, 법령에 의해 항목을 보관할 경우, 해당 법령에서 정한 최대 기간만큼 저장합니다.
							파기된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
						</article>
					</li>
				</ul>
			</div>
			<div id="btn_area">
				<button type="button" class="join_btn" id="join_btn">ITPLANET 회원가입</button>
			</div>
		</form>
	</div>
</div>
<script>
var userIdFlag = false;
var userPwdFlag = false;
var userPwdFlag2 = false;
var check = false;
$("#userId").blur(function(){
	userIdFlag = false;
	checkUserId("first");
});
$("#userPwd").blur(function(){
	checkUserPwd();
});
$("#userPwd2").blur(function(){
	checkUserPwd2();
});
$("#userName").blur(function(){
	checkUserName();
});
$("#nickName").blur(function(){
	checkNickName();
});
$("#birth_yy").blur(function(){
	checkBirth();
});
$("#birth_mm").blur(function(){
	checkBirth();
});
$("#birth_dd").blur(function(){
	checkBirth();
});
$("#gender").blur(function(){
	checkGender();
});
$("#email").blur(function(){
	checkEmail();
});
function checkUserId(event){
	/* if(userIdFlag) return true; */
	userIdFlag = false;
	
	var userId = $("#userId").val();
	var oMsg = $('#idMsg');
	
	if(userId == ""){
		showErrorMsg(oMsg, "아이디를 입력해주세요.");
	}
	
	var isUserId = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	
	if(!isUserId.test(userId)){
		showErrorMsg(oMsg, "5~20자의 영문 소문자, 숫자와 특수기호(_), (-)만 사용 가능합니다.");
	} else {
		oMsg.hide();
		var a = checkUserIdAjax();
	}
}
function checkUserIdAjax(){
	var userId = $("#userId").val();
	var oMsg = $('#idMsg');
	
	$.ajax({
		url: "checkUserId.do",
		method: "POST",
		data: {userId:userId},
		success: function(data){
			if(data == "success"){
				console.log(data);
				showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 회원의 아이디입니다.");
				userIdFlag = false;
			} else{
				/* oMsg.hide(); */
				showErrorMsg(oMsg, "사용 가능한 아이디 입니다.");
				oMsg.css('color', 'green');
				userIdFlag = true;
			}
		}
	});
}
function checkUserPwd(){
	userPwdFlag = false;
	
	var userPwd = $('#userPwd').val();
	var oMsg = $('#userPwdMsg');
	
	var isUserPwd = /^(?=.*[a-z])((?=.*\d)(?=.*\W)).{6,20}$/gi;
	
	if(!isUserPwd.test(userPwd)){
		showErrorMsg(oMsg, "8~15자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
	} else {
		oMsg.hide();
		userPwdFlag = true;
	} 
	
}
function checkUserPwd2(){
	userPwdFlag2 = false;
	
	var userPwd = $('#userPwd').val();
	var userPwd2 = $('#userPwd2').val();
	var oMsg = $('#userPwd2Msg');
	
	if(userPwd != userPwd2){
		showErrorMsg(oMsg, "비밀번호가 일치하지 않습니다.");
	} else{
		oMsg.hide();
		userPwdFlag2 = true;
	}
}
function checkUserName(){
	check = false;
	
	var userName = $('#userName').val();
	var oMsg = $('#userNameMsg');
	
	if(userName == "") {
		showErrorMsg(oMsg, "이름을 입력해주세요.");
	} else {
		oMsg.hide();
		check = true;
	}
}
function checkNickName(){
	check = false;
	
	var nickName = $('#nickName').val();
	var oMsg = $('#nickNameMsg');
	
	if(nickName == "") {
		showErrorMsg(oMsg, "닉네임을 입력해주세요.");
	} else {
		oMsg.hide();
		checkNickNameAjax();
	}
}
function checkNickNameAjax(){
	var nickName = $('#nickName').val();
	var oMsg = $('#nickNameMsg');
	
	$.ajax({
		url: "checkNickName.do",
		method: "POST",
		data: {nickName:nickName},
		success: function(data){
			if(data == "success"){
				showErrorMsg(oMsg, "이미 사용중인 닉네임입니다.");
				check = false;
			} else{
				showErrorMsg(oMsg, "사용 가능한 닉네임입니다.");
				oMsg.css('color', 'green');
				check = true;
			}
		}
	});
}
function checkBirth(){
	check = false;
	
	var birth_yy = $('#birth_yy').val();
	var birth_mm = $('#birth_mm').val();
	var birth_dd = $('#birth_dd').val();
	var oMsg = $('#birthMsg');
	
	var isBirth_yy = /^[1-2]{1}[90]{1}[0-9]{2}/;
	var isBirth_mm = /^[0-9]+$/;
	var isBirth_dd;
	
	switch(birth_mm){
	case "1": case "3": case "5": case "7": case "8": case "10": case "12":
		isBirth_dd = /^[1-9]{1}$|^[1-2]{1}[0-9]{1}$|^[3]{1}[0-1]{1}$/;
		break;
	case "4": case "6": case "9": case "11":
		isBirth_dd = /^[1-9]{1}$|^[1-2]{1}[0-9]{1}$|^[3]{1}[0]{1}$/;
		break;
	case "2": 
		isBirth_dd = /^[1-9]{1}$|^[1]{1}[0-9]{1}$|^[2]{1}[0-9]{1}$/;
		break;
	}
		
	if(birth_yy == "" || birth_dd == "" || !isBirth_mm.test(birth_mm)){
		showErrorMsg(oMsg, "생년월일을 다시 확인해주세요.");
	} else if(!isBirth_dd.test(birth_dd)){
		showErrorMsg(oMsg, "생년월일을 다시 확인해주세요.");
	} else if(!isBirth_yy.test(birth_yy)){
		showErrorMsg(oMsg, "다시 확인 해주세요.");
	} else{
		oMsg.hide();
		check = true;
	}
}
function checkGender(){
	check = false;
	
	var gender = $('#gender').val();
	var oMsg = $('#genderMsg');
	
	if(gender != "남자" || gender != "여자"){
		showErrorMsg(oMsg, "성별을 선택해주세요.");
	} else {
		oMsg.hide();
		check = true;
	}
}
function checkEmail(){
	check = false;
	
	var email = $('#email').val();
	var oMsg = $('#emailMsg');
	
	var isEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	if(!isEmail.test(email)){
		showErrorMsg(oMsg, "이메일을 다시 확인해주세요.");
	} else {
		oMsg.hide();
		check = true;
	}
}
function showErrorMsg(oMsg, msg){
	oMsg.attr('style', '');
	oMsg.text(msg);
}
$(function(){
	$('#policyY').on('click', function(){
		if($(this).is(':checked')) $('.policy input').prop('checked', true);
		else $('.policy input').prop('checked', false);
	});
	$('.policy ul .check').on('click', function(){
		if($('#agreeUseAdult').is(':checked') && $('#agreeUse').is(':checked') && $('#agreePrivate').is(':checked')){
			$('#policyY').prop('checked', true);
		} else {
			$('#policyY').prop('checked', false);
		}
	});
});
// 이메일 인증
var randomNum;
$('#emailNumBtn').on('click', function(){
	check = false;
	var oMsg = $('#emailMsg');
	var email = $('#email').val();
	$.ajax({
		url: "checkEmail.do",
		method: "post",
		data:{email:email},
		success: function(data){
			if(data == "success"){
			$('#emailNum').attr('readonly', false);
			$('#emailNum').css('background', '#f8f8f8');
			$('#emailCKArea').show();
			showErrorMsg(oMsg, "입력하신 이메일로 인증번호를 전송하였습니다. 확인 후 입력해주세요. 최대 5분이 걸릴 수 있습니다.");
				$.ajax({
					url: "sendEmail.do",
					type: "post",
					data:{email:email},
					/* async:false, */
					success:function(data){
						if(data != null && data != ""){
							randomNum = data;
						} else{
							showErrorMsg(oMsg, "인증번호 전송에 실패하였습니다. 잠시 후 다시 시도해주시기 바랍니다.");
						}
					}
				});
			} else {
				$('#emailCKArea').hide();
				showErrorMsg(oMsg, "이미 존재하거나 탈퇴한 회원의 이메일입니다.");
			}
		}
	})

});
/* function Set_Default_Return(data){
	randomNum = data;  
    alert(randomNum);
} */
$('#confirmNum').on('click', function(){
	var number1 = $('#emailNum').val();
	var number2 = randomNum;
	
	var oMsg = $('#emailMsg');
	if(number1 == number2){
		showErrorMsg(oMsg, "인증에 성공하였습니다. 회원가입을 진행해주세요.");
		$('#email').attr('readonly', true);
		$('#email').css('background', '#ddd');
		$('#emailNum').attr('readonly', true);
		$('#emailNum').css('background', '#ddd');
		check = true;
	} else {
		showErrorMsg(oMsg, "인증번호가 일치하지 않습니다. 다시 확인해 주세요.");
	}
});
$('#join_btn').on('click', function(){
	if(check && userIdFlag && userPwdFlag && userPwdFlag2){
		if($('#policyY').is(':checked')){
			$('#join_form').submit();
		} else{
			alert('모든 약관에 동의해주세요.');
		}
	} else{
		alert("모든 항목을 확인해주세요.");
	}
});
</script>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>