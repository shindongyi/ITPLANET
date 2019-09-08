package com.project.itplanet.coding.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.itplanet.coding.model.service.CodingService;

@Controller
public class CodingController {
	@Autowired
	private CodingService coService;
	
	@RequestMapping("insertCT.do")
	public String cdTest() {
		return "coding/codingTestInsert";
	}
	
	@RequestMapping("codingTestView.do")
	public String codingTestView() {
		return "coding/codingTestView";
	}
}
