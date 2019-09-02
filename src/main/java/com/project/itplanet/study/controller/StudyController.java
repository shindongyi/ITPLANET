package com.project.itplanet.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.itplanet.study.model.service.StudyService;


@Controller
public class StudyController {
	@Autowired
	private StudyService sService;
	
	@RequestMapping("studyInsertView.do")
	public String studyInsertView() {
		return "study/studyInsertView";
	}
	
	@RequestMapping("studyDetailView.do")
	public String studyDetailView() {
		return "study/studyDetailView";
	}
	
	@RequestMapping("studyListView.do")
	public String studyListView() {
		return "study/studyListView";
	}
}
