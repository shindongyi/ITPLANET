package com.project.itplanet.member.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.project.itplanet.common.Pagination;
import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.member.model.exception.MemberException;
import com.project.itplanet.member.model.service.MemberService;
import com.project.itplanet.member.model.vo.MailUtils;
import com.project.itplanet.member.model.vo.Member;
import com.project.itplanet.member.model.vo.TempKey;



@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSender mailSender;

	// 회원가입 페이지
	@RequestMapping("joinView.do")
	public ModelAndView joinView(HttpServletRequest request, ModelAndView mv) {
		String referer = request.getHeader("Referer");

		mv.addObject("url", referer);
		mv.setViewName("member/joinView");
		return mv;
	}
	// 로그인 페이지
	@RequestMapping("loginView.do")
	public ModelAndView loginView(HttpServletRequest request, ModelAndView mv) {
		String referer = request.getHeader("Referer");

		System.out.println("1234 : " + referer);
		mv.addObject("url", referer);
		mv.setViewName("member/loginView");
		return mv;
	}
	// 마이페이지
	@RequestMapping("mypage.do")
	public ModelAndView myPageView(ModelAndView mv, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);

		ArrayList<HashMap<String, String>> recentComp = mService.recentComp(map);
		ArrayList<HashMap<String, String>> recentHire = mService.recentHire(map);
		ArrayList<HashMap<String, String>> recentLcs = mService.recentLcs(map);

		String keyword = "day1";
		map.put("keyword", keyword);

		ArrayList<HashMap<String, String>> day1Lcs = mService.recentLcs(map);
		ArrayList<HashMap<String, String>> day1Hire = mService.recentHire(map);
		ArrayList<HashMap<String, String>> day1Comp = mService.recentComp(map);

		ArrayList day1List = new ArrayList();
		day1List.addAll(day1Lcs);
		day1List.addAll(day1Comp);
		day1List.addAll(day1Hire);

		keyword = "day2";
		map.put("keyword", keyword);

		ArrayList<HashMap<String, String>> day2Lcs = mService.recentLcs(map);
		ArrayList<HashMap<String, String>> day2Hire = mService.recentHire(map);
		ArrayList<HashMap<String, String>> day2Comp = mService.recentComp(map);

		ArrayList day2List = new ArrayList();
		day2List.addAll(day2Lcs);
		day2List.addAll(day2Comp);
		day2List.addAll(day2Hire);

		mv.addObject("day1List", day1List);
		mv.addObject("day2List", day2List);

		mv.addObject("recentComp", recentComp);
		mv.addObject("recentHire", recentHire);
		mv.addObject("recentLcs", recentLcs);
		mv.setViewName("member/mypageMainView");

		return mv;
	}
	// 스크랩 페이지
	@RequestMapping("myPageScrapView.do")
	public ModelAndView myPageScrapView(@RequestParam(value="page", required=false) Integer page,
									@RequestParam("type") Integer type,
									@RequestParam(value="keyword", required=false) String keyword,
									ModelAndView mv,
									HttpSession session) {
		System.out.println(type);
		Member m = (Member)session.getAttribute("loginUser");
		String userId = m.getUserId();

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}

		HashMap<String, String> map = new HashMap();
		map.put("userId", userId);
		if(keyword != null) {
			map.put("keyword", keyword);
		}

		HashMap<String,Integer> scrapCount = mService.countScrap(map);
		String str = null;
		int listCount = 0;
		System.out.println("type : " + type);
		if(type == 1) {
			str = "공모전";
			listCount = scrapCount.get("compCount");
		} else if(type == 2) {
			str = "채용공고";
			listCount = scrapCount.get("hireCount");
		} else if(type == 3) {
			str = "자격증";
			listCount = scrapCount.get("lcsCount");
		}
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<HashMap<String, String>> list = new ArrayList();
		HashMap map2 = new HashMap();
		map2.put("userId", userId);
		map2.put("type", type);
		map2.put("pi", pi);
		map2.put("keyword", keyword);
		list = mService.selectScrapList(map2);
		
		mv.addObject("pi", pi);
		mv.addObject("type", str);
		mv.addObject("typeNum", type);
		mv.addObject("list", list);
		mv.addObject("keyword", keyword);
		mv.setViewName("member/mypageScrapView");
		return mv;
	}
	// 비밀번호 수정 페이지
	@RequestMapping("updatePwdForm.do")
	public String updatePwdForm() {
		return "member/updatePwdForm";
	}
	// 정보 수정 전 회원 확인 페이지
	@RequestMapping("confirmUser.do")
	public String confirmUser() {
		return "member/confirmUserForm";
	}
	// 개인정보 수정 페이지
	@RequestMapping("updateMemberForm.do")
	public String updateMemberForm() {
		return "member/updateMemberForm";
	}
	// 아이디 비밀번호 찾기 페이지
	@RequestMapping("forgetView.do")
	public String forgetView() {
		return "member/forgetView";
	}
	// 회원탈퇴 페이지
	@RequestMapping("deleteMV.do")
	public String deleteMemeberView() {
		return "member/deleteMemberView";
	}
	@RequestMapping("newFile.do")
	public String newFile() {
		return "member/NewFile";
	}

	// 로그인
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	@ResponseBody
	public String memberLogin(Member m, Model model, HttpSession session, HttpServletRequest request,
								@RequestParam(value="url", required = false) String url) {

		Member loginUser = mService.memberLoginUser(m);
		if(loginUser != null) {
			if(bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
				System.out.println(url);
				model.addAttribute("loginUser", loginUser);

				HashMap<String, String>map = new HashMap<String, String>();
				map.put("userId", loginUser.getUserId());

				HashMap<String,Integer> scrapCount = mService.countScrap(map);
				session.setAttribute("scrapCount", scrapCount);
				session.setMaxInactiveInterval(600);

				String referer = request.getHeader("Referer");

				if(url != null) {
					return url;
				} else {
					return referer;
				}

			} else {
				return "fail";
			}
		} else {
			return "fail";
		}
	}

	// 아이디 체크
	@RequestMapping("checkUserId.do")
	@ResponseBody
	public String checkUserId(@RequestParam("userId") String userId) {
		int result = mService.selectUserId(userId);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 닉네임 체크
	@RequestMapping("checkNickName.do")
	@ResponseBody
	public String checkNickName(@RequestParam("nickName") String nickName) {
		int result = mService.selectNickName(nickName);

		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 회원가입
	@RequestMapping(value="minsert.do", method=RequestMethod.POST)
	public String memeberInsert(@ModelAttribute Member m,
								@RequestParam("birth_yy") int birth_yy,
								@RequestParam("birth_mm") int birth_mm,
								@RequestParam("birth_dd") int birth_dd,
								@RequestParam(value="url", required = false) String url,
								Model model) {

		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);

		Date birthDay = new Date(new GregorianCalendar(birth_yy, birth_mm-1, birth_dd).getTimeInMillis());
		m.setBirthDay(birthDay);

		int result = mService.insertMember(m);

		if(result > 0) {
			Member loginUser = mService.memberLoginUser(m);
			model.addAttribute("loginUser", loginUser);
			if(url != null) {
				return "redirect:"+ url;
			} else {
				return "redirect:/";
			}
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	
	// 이메일 전송
	@RequestMapping("sendEmail.do")
	@ResponseBody
	public String sendEmail(HttpServletRequest request,
							@RequestParam("email") String email) throws Exception {
		
		System.out.println("controller : " + email);
		// 임의의 키 생성
		String authkey = new TempKey().getKey(50, false);
		
		// mail 작성 관련 
				MailUtils sendMail = new MailUtils(mailSender);

				sendMail.setSubject("[ITPLANET] 회원가입 이메일 인증");
				sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
						.append("<h3>아래 문자를 회원가입 페이지에 입력하시면 이메일 인증이 완료됩니다.</h3>")
						.append("<h2>")
						.append(authkey)
						.append("</h2>")
						.toString());
				sendMail.setFrom("gunteakim@gmail.com", "ITPLANET");
				sendMail.setTo(email);
				sendMail.send();

		System.out.println("authkey : " + authkey);
		
		return authkey;
	}
	

	// 비밀번호 변경
	@RequestMapping("updatePwd.do")
	@ResponseBody
	public String updatePwd(HttpSession session, @RequestParam("newPwd") String newPwd,
							@RequestParam(value="userId", required=false) String id) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = null;
		if(loginUser != null) {
			userId = loginUser.getUserId();
		} else {
			userId = id;
		}

		String encPwd = bcryptPasswordEncoder.encode(newPwd);

		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(encPwd);

		int result = mService.updatePwd(m);

		if(result > 0) {
			return "success";
		} else {
			throw new MemberException("비밀번호 변경에 실패하였습니다.");
		}
	}
	
	@RequestMapping("checkUserPwd.do")
	@ResponseBody
	public String checkUserPwd(HttpSession session, @RequestParam("userPwd") String userPwd) {
		Member m = (Member)session.getAttribute("loginUser");
		if(bcryptPasswordEncoder.matches(userPwd, m.getUserPwd())) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 아이디 찾기
	@RequestMapping("findId.do")
	@ResponseBody
	public Member findId(@ModelAttribute Member m) {
		Member member =  (Member)mService.findUserId(m);
		System.out.println(member);
		if(member == null) {
			return null;
		} else {
			return member;
		}
	}

	// 비밀번호 찾기
	@RequestMapping("findPwd.do")
	@ResponseBody
	public String findPwd(@ModelAttribute Member m) {
		int result = mService.findPwd(m);

		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 비밀번호 확인
	@RequestMapping("comfirmUser.do")
	@ResponseBody
	public String comfirmUser(HttpSession session, @RequestParam("userPwd") String userPwd) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(bcryptPasswordEncoder.matches(userPwd, loginUser.getUserPwd())) {
			return "success";
		} else {
			return "fail";
		}
	}

//	// 개인정보 수정
//	@RequestMapping("updateM.do")
//	public String updateMember(@ModelAttribute Member m,
//								@RequestParam("birth_yy") int birth_yy,
//								@RequestParam("birth_mm") int birth_mm,
//								@RequestParam("birth_dd") int birth_dd,
//								Model model,
//								HttpSession session) {
//		Date birthDay = new Date(new GregorianCalendar(birth_yy, birth_mm-1, birth_dd).getTimeInMillis());
//		m.setBirthDay(birthDay);
//		Member loginUser = (Member)session.getAttribute("loginUser");
//		m.setUserId(loginUser.getUserId());
//		m.setUserPwd(loginUser.getUserPwd());
//		int result = mService.updateMember(m);
//		if(result>0) {
//			model.addAttribute("loginUser", m);
//			return "redirect:mypage.do";
//		} else {
//			throw new MemberException("개인정보 수정에 실패하였습니다.");
//		}
//	}
	
	// 개인정보 수정
		@RequestMapping("updateM.do")
		@ResponseBody
		public String updateMember(@ModelAttribute Member m,
									@RequestParam("birth_yy") int birth_yy,
									@RequestParam("birth_mm") int birth_mm,
									@RequestParam("birth_dd") int birth_dd,
									Model model,
									HttpSession session) {
			Date birthDay = new Date(new GregorianCalendar(birth_yy, birth_mm-1, birth_dd).getTimeInMillis());
			m.setBirthDay(birthDay);
			Member loginUser = (Member)session.getAttribute("loginUser");
			m.setUserId(loginUser.getUserId());
			m.setUserPwd(loginUser.getUserPwd());
			int result = mService.updateMember(m);
			if(result>0) {
				model.addAttribute("loginUser", m);
				return "success";
			} else {
				return "개인정보 수정에 실패하였습니다.";
			}
		}

	// 회원 탈퇴전 이메일 체크
	@RequestMapping("emailCheck.do")
	@ResponseBody
	public String emailCheck(HttpSession session, @RequestParam("email") String email) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser.getEmail().equals(email)){
			return "success";
		} else {
			return "fail";
		}
	}

	// 회원 탈퇴
	@RequestMapping("deleteM.do")
	public String deleteMember(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		int result = mService.deleteMember(userId);
		if(result>0) {
			return "redirect:logout.do";
		} else{
			throw new MemberException("회원 탈퇴에 실패하였습니다.");
		}
	}

	// 로그아웃
	@RequestMapping("logout.do")
	public String logout(SessionStatus status, HttpSession session) {
		session.invalidate();
		status.setComplete();
		return "redirect:/";
	}
	// 스크랩 삭제
	@RequestMapping("deleteScrap.do")
	public ModelAndView  deleteScrap(@RequestParam("type") String type,
								@RequestParam(value="keyword", required=false) String keyword,
								@RequestParam("list") String list,
								@RequestParam("page") Integer page,
								HttpSession session,
								ModelAndView mv) {
		Member m = (Member)session.getAttribute("loginUser");
		String userId= m.getUserId();

		String[] dList = list.split("/");
		List<Integer> aList = new ArrayList();
		for(int i = 0; i < dList.length; i++) {
			aList.add(Integer.parseInt(dList[i]));
		}

		HashMap map = new HashMap();
		map.put("userId", userId);
		map.put("aList", aList);
		map.put("type", type);

		String from = null;
		int typeNum = 0;

		if(type.equals("공모전")) {
			from = "c_scrap";
			map.put("from", from);
			typeNum = 1;
		} else if(type.equals("채용공고")) {
			from = "h_scrap";
			map.put("from", from);
			typeNum = 2;
		} else {
			from = "l_scrap";
			map.put("from", from);
			typeNum = 3;
		}

		int result = mService.deleteScrap(map);

		if(result > 0) {
			HashMap<String, String>scrapCountMap = new HashMap<String, String>();
			scrapCountMap.put("userId", userId);

			HashMap<String,Integer> scrapCount = mService.countScrap(scrapCountMap);
			session.setAttribute("scrapCount", scrapCount);
			
			mv.addObject("type", typeNum);
			mv.addObject("page", page);
			mv.addObject("keyword", keyword);
			mv.setViewName("redirect:myPageScrapView.do");
			return mv;
		} else {
			throw new MemberException("스크랩 삭제에 실패했습니다.");
		}
	}

}