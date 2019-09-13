package com.project.itplanet.competition.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.common.model.vo.PageInfo;
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

	@Override
	public ArrayList<Competition> allCompetition(PageInfo pi) {
		return cDAO.allCompetition(pi);
	}

	@Override
	public ArrayList<Cattachment> allCattachment() {
		return cDAO.allCattachment();
	}

	@Override
	public ArrayList<Competition> topCompetition() {
		return cDAO.topCompetition();
	}

	@Override
	public int getListCount() {
		return cDAO.getListCount();
	}

	@Override
	public Competition selectCompetition(Integer cId) {
		return cDAO.selectCompetition(cId);
	}

	@Override
	public Cattachment selectCattachment(Integer cId) {
		return cDAO.selectCattachment(cId);
	}

	@Override
	public void addCount(Integer cId) {
		cDAO.addCount(cId);
	}

	@Override
	public int deleteCompetition(Integer cId) {
		return cDAO.deleteCompetition(cId);
	}
	
}
