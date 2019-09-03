package com.project.itplanet.study.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project.itplanet.common.Pagination;
import com.project.itplanet.common.model.vo.Local;
import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.member.model.vo.Member;
import com.project.itplanet.study.model.exception.StudyException;
import com.project.itplanet.study.model.service.StudyService;
import com.project.itplanet.study.model.vo.Study;


@Controller
public class StudyController {
	@Autowired
	private StudyService sService;
	
	@RequestMapping("studyInsertView.do")
	public ModelAndView studyInsertView(ModelAndView mv) {
		ArrayList<Local> list = sService.selectLocal();
		mv.addObject("list", list);
		mv.setViewName("study/studyInsertView");
		
		return mv;
	}
	
	@RequestMapping("studyListView.do")
	public ModelAndView studyListView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = sService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Study> list = sService.selectStudy(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("study/studyListView");
		}else {
			throw new StudyException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	@RequestMapping("studyUpdateView.do")
	public String studyUpdateView() {
		return "study/studyUpdateView";
	}
	
	@RequestMapping("studyInsert.do")
	public String studyInsert(@SessionAttribute("loginUser") Member loginUser,
							@ModelAttribute Study study) {
		String id = loginUser.getUserId();
		study.setsWriter(id);
		
		int result = sService.studyInsert(study);
		
		if(result > 0) {
			return "redirect:studyListView.do";
		}else {
			throw new StudyException("스터디 모집글 작성에 실패하였습니다.");
		}
	}
	
	@RequestMapping("studyDetail.do")
	public ModelAndView studyDetail(@RequestParam("sId") int sId, ModelAndView mv) {
		Study study = sService.studyDetail(sId);
		
		mv.addObject("study", study);
		mv.setViewName("study/studyDetailView");
		
		return mv;
	}
}
