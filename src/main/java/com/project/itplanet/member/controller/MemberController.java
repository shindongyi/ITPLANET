package com.project.itplanet.member.controller;

import java.sql.Date;
import java.util.GregorianCalendar;

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
	public String myPageView() {
		return "member/mypageMainView";
	}
	// 스크랩 페이지
	@RequestMapping("myPageScrapView.do")
	public String myPageScrapView() {
		return "member/mypageScrapView";
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
//		String[] email = {"hanmail.net", "naver.com", "hotmail.com", "yahoo.co.kr", "hanmir.com", "paran.com", 
//				"dreamwiz.com", "korea.com", "nate.com", "lycos.co.kr", "empal.com", "netian.com",
//				"freechal.com","msn.com","gmail.com","etc"};
//		request.setAttribute("email", email);
		/* mv.addObject(email); */
		return "member/forgetView";
	}
	// 회원탈퇴 페이지
	@RequestMapping("deleteMV.do")
	public String deleteMemeberView() {
		return "member/deleteMemberView";
	}
	
	// 로그인
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model) {
		
		Member loginUser = mService.memberLoginUser(m);
		if(loginUser != null) {
			System.out.println(loginUser.getUserId());
			if(bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
				model.addAttribute("loginUser", loginUser);
			} else {
				throw new MemberException("로그인에 실패하였습니다.");
			}
		} else {
			throw new MemberException("존재하지 않는 아이디입니다.");
		}
		return "member/mypageMainView";
	}

	// 아이디 체크
	@RequestMapping("checkUserId.do")
	@ResponseBody
	public String checkUserId(@RequestParam("userId") String userId) {
		System.out.println(userId);
		int result = mService.selectUserId(userId);
		System.out.println(result);
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
		int result = mService.selectUserId(nickName);
		
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
								@RequestParam("birth_dd") int birth_dd) {
		
		System.out.println(m);
		System.out.println(m.getGender());
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd);
		
		Date birthDay = new Date(new GregorianCalendar(birth_yy, birth_mm-1, birth_dd).getTimeInMillis());
		m.setBirthDay(birthDay);
		
		System.out.println(m);
		
		int result = mService.insertMember(m);
		System.out.println(result);
		
		if(result > 0) {
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
	public String comfirmUser() {
		return "redirect:updateMemberForm.do";
	}
	
}
