package com.project.itplanet.competition.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.competition.model.dao.CompetitionDAO;
import com.project.itplanet.competition.model.vo.Cattachment;
import com.project.itplanet.competition.model.vo.Competition;

@Service("cService")
public class CompetitionServiceImpl implements CompetitionService{
	@Autowired
	private CompetitionDAO cDAO;

	@Override
	public int insertCompetition(Competition c) {
		return cDAO.insertCompetition(c);
	}

	@Override
	public int insertCattachment(Cattachment ca) {
		return cDAO.insertCattachment(ca);
	}
	
}
