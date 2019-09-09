package com.project.itplanet.hire.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.itplanet.hire.model.service.HireService;

@Controller
public class HireController {
	@Autowired
	private HireService hService;
	
	@RequestMapping(value="hList.do")
	public String hireListView() {
		
		return "hire/hireList";
	}
	
	@RequestMapping(value="hDetail.do")
	public String hireDetailView() {
		
		return "hire/hireDetail";
	}
}
