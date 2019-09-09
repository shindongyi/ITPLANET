package com.project.itplanet.competition.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.itplanet.competition.model.service.CompetitionService;

@Controller
public class CompetitionController {
	@Autowired
	private CompetitionService cService;

}
