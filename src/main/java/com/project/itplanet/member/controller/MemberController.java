package com.project.itplanet.member.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.project.itplanet.member.model.vo.Member;



@SessionAttributes("loginUser")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 회원가입 페이지
	@RequestMapping("joinView.do")
	public String joinView() {
		return "member/joinView";
	}
	// 로그인 페이지
	@RequestMapping("loginView.do")
	public String loginView() {
		return "member/loginView";
	}
	// 마이페이지
	@RequestMapping("mypage.do")
	public ModelAndView myPageView(ModelAndView mv, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		String userId = m.getUserId();
//		ArrayList list = mService.recentScrap(userId);
//		mv.addObject("list", list);
		
		ArrayList<HashMap<String, String>> recentComp = mService.recentComp(userId);
		ArrayList<HashMap<String, String>> recentHire = mService.recentHire(userId);
		ArrayList<HashMap<String, String>> recentLcs = mService.recentLcs(userId);
		
		
//		ArrayList<HashMap<String, String>> alarmComp = mService.recentComp(userId);
//		ArrayList<HashMap<String, String>> alarmHire = mService.recentHire(userId);
//		ArrayList<HashMap<String, String>> alarmLcs = mService.recentLcs(userId);
		
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
									ModelAndView mv,
									HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String userId = m.getUserId();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		HashMap<String,Integer> scrapCount = mService.countScrap(userId);
		String str = null;
		int listCount = 0;
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
		list = mService.selectScrapList(userId, type, pi);
		
		mv.addObject("pi", pi);
		mv.addObject("type", str);
		mv.addObject("typeNum", type);
		mv.addObject("list", list);
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
	public String memberLogin(Member m, Model model, HttpSession session) {
		
		Member loginUser = mService.memberLoginUser(m);
		if(loginUser != null) {
			if(bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
				model.addAttribute("loginUser", loginUser);
				
				HashMap<String,Integer> scrapCount = mService.countScrap(loginUser.getUserId());
				session.setAttribute("scrapCount", scrapCount);
				
//				int compCount = mService.countComp(loginUser.getUserId());
//				int hireCount = mService.countHire(loginUser.getUserId());
//				int lcsCount = mService.countLcs(loginUser.getUserId());
				
//				Map<String, Integer> scrapCount = new HashMap<String,Integer>();
//				scrapCount.put("compCount", compCount);
//				scrapCount.put("hireCount", hireCount);
//				scrapCount.put("lcsCount", lcsCount);
//				Map<String, Integer> scrapCount = mService.scrapCount(loginUser.getUserId());
				
			} else {
				throw new MemberException("로그인에 실패하였습니다.");
			}
		} else {
			throw new MemberException("존재하지 않는 아이디입니다.");
		}
		return "redirect:mypage.do";
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
								Model model) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		Date birthDay = new Date(new GregorianCalendar(birth_yy, birth_mm-1, birth_dd).getTimeInMillis());
		m.setBirthDay(birthDay);
		
		int result = mService.insertMember(m);
		
		if(result > 0) {
			Member loginUser = mService.memberLoginUser(m);
			model.addAttribute("loginUser", loginUser);
			return "member/mypageMainView";
		} else {
			throw new MemberException("회원가입에 실패하였습니다.");
		}
	}
	
	// 비밀번호 변경
	@RequestMapping("updatePwd.do")
	public String updatePwd(HttpSession session, @RequestParam("newPwd") String newPwd) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		String encPwd = bcryptPasswordEncoder.encode(newPwd);
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(encPwd);
		
		int result = mService.updatePwd(m);
		
		if(result > 0) {
			return "member/myPageMainView";
		} else {
			throw new MemberException("비밀번호 변경에 실패하였습니다.");
		}
	}
	
	// 아이디 찾기
	@RequestMapping("findId.do")
	@ResponseBody
	public String findId(@ModelAttribute Member m) {
		String userId =  mService.findUserId(m);
		return userId;
	}
	
	// 비밀번호 찾기
	@RequestMapping("findPwd.do")
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
	
	// 개인정보 수정
	@RequestMapping("updateM.do")
	public String updateMember(@ModelAttribute Member m,
								@RequestParam("birth_yy") int birth_yy,
								@RequestParam("birth_mm") int birth_mm,
								@RequestParam("birth_dd") int birth_dd,
								Model model) {
		Date birthDay = new Date(new GregorianCalendar(birth_yy, birth_mm-1, birth_dd).getTimeInMillis());
		m.setBirthDay(birthDay);
		int result = mService.updateMember(m);
		if(result>0) {
			model.addAttribute("loginUser", m);
			return "redirect:mypage.do";
		} else {
			throw new MemberException("개인정보 수정에 실패하였습니다.");
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
		status.setComplete();
		return "redirect:mypage.do";
	}
	
}
