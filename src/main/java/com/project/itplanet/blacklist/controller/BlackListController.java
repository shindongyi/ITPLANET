package com.project.itplanet.blacklist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.itplanet.blacklist.model.service.BlackListService;

@Controller
public class BlackListController {
	@Autowired
	private BlackListService bService;

}
