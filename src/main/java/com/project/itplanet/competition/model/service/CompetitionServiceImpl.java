package com.project.itplanet.competition.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.competition.model.dao.CompetitionDAO;
import com.project.itplanet.competition.model.vo.Cattachment;
import com.project.itplanet.competition.model.vo.Competition;
import com.project.itplanet.competition.model.vo.CompetitionReply;

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

	@Override
	public int getCpId(int i) {
		return cDAO.getCpId(i);
	}

	@Override
	public void updateFile(Cattachment ca) {
		cDAO.updateFile(ca);
	}

	@Override
	public int updateCompetition(Competition c) {
		return cDAO.updateCompetition(c);
	}

	@Override
	public ArrayList<CompetitionReply> competitionReplyList(int cId) {
		return cDAO.competitionReplyList(cId);
	}

	@Override
	public int addCompetitionReply(CompetitionReply r) {
		return cDAO.addCompetitionReply(r);
	}

	@Override
	public ArrayList<Competition> mainComp() {
		return cDAO.mainComp();
	}

	@Override
	public ArrayList<Competition> mainCompNow() {
		return cDAO.mainCompNow();
	}

	@Override
	public ArrayList<Competition> topComp() {
		return cDAO.topComp();
	}
	
}
