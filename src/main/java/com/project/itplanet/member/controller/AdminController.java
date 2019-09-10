package com.project.itplanet.member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.project.itplanet.blacklist.model.vo.Black;
import com.project.itplanet.competition.model.vo.Competiton;
import com.project.itplanet.member.model.exception.AdminException;
import com.project.itplanet.member.model.service.AdminService;
import com.project.itplanet.member.model.vo.Member;

@Controller
public class AdminController {
	@Autowired
	private AdminService aService;

//	@RequestMapping(value="admin.do")
//	public String adminView() {
//		
//		return "admin/admin";
//	}

	@RequestMapping("admin.do")
	public ModelAndView memberList(ModelAndView mv) {

		ArrayList<Member> list = aService.selecMemtList();
		ArrayList<Black> blist = aService.selecBlist();
		ArrayList<Competiton> clist = aService.selectClist();
		
		
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("blist",blist);
			mv.addObject("clist",clist);
			mv.setViewName("admin/admin");
		} else {
			throw new AdminException("회원조회 실패");
		}
		return mv;
	}

	@RequestMapping("blackOff.do")
	public String blackOff(String blkTargetId) {

		int result = aService.blackOff(blkTargetId);
		if (result > 0) {
			return "redirect:admin.do";
		} else {
			throw new AdminException("블랙리스트 해제를 실패");
		}
	}
	
	@RequestMapping("black.do")
	public String black(String blkId) {
		
		int result = aService.black(blkId);
		if(result > 0) {
			return "redirect:admin.do";
		}else {
			throw new AdminException("블랙리스트 설정 실패");
		}
	}

	@RequestMapping("gongmoYes.do")
	public String gongmoYes(int gongNum) {
		
		int result = aService.gongmoYes(gongNum);
		if(result > 0) {
			return "redirect:admin.do";
		}else {
			throw new AdminException("공모전 수락 실패");
		}
	}
	
	@RequestMapping("gongmoNo.do")
	public String gongmoNo(int gongNum2) {
		
		int result = aService.gongmoNo(gongNum2);
		if(result > 0) {
			return "redirect:admin.do";
		}else {
			throw new AdminException("공모전 거절 실패 ");
		}
	}
	
	@RequestMapping("shingoYes.do")
	public String shingoYes(int singoNum) {
		
		int result = aService.shingoYes(singoNum);
		if(result > 0) {
			return "redirect:admin.do";
		}else {
			throw new AdminException("신고 수락 실패 ");
		}
	}
	
	@RequestMapping("shingoNo.do")
	public String shingoNo(int singoNum2) {
		
		int result = aService.shingoNo(singoNum2);
		if(result > 0) {
			return "redirect:admin.do";
		}else {
			throw new AdminException("신고 거절 실패 ");
		}
	}

}
