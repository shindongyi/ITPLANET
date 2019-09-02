package com.project.itplanet.competition.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.competition.model.dao.CompetitionDAO;

@Service("cService")
public class CompetitionServiceImpl implements CompetitionService{
	@Autowired
	private CompetitionDAO cDAO;
	
}
