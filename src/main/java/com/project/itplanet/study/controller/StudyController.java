package com.project.itplanet.study.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.itplanet.common.model.vo.Local;
import com.project.itplanet.study.model.service.StudyService;


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
	
	@RequestMapping("studyDetailView.do")
	public String studyDetailView() {
		return "study/studyDetailView";
	}
	
	@RequestMapping("studyListView.do")
	public String studyListView() {
		return "study/studyListView";
	}
	
	@RequestMapping("studyUpdateView.do")
	public String studyUpdateView() {
		return "study/studyUpdateView";
	}
}
