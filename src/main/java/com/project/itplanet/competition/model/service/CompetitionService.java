package com.project.itplanet.competition.model.service;

import java.util.ArrayList;

import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.competition.model.vo.Cattachment;
import com.project.itplanet.competition.model.vo.Competition;
import com.project.itplanet.competition.model.vo.CompetitionReply;

public interface CompetitionService {

	int insertCompetition(Competition c);

	int insertCattachment(Cattachment ca);

	ArrayList<Competition> allCompetition(PageInfo pi);

	ArrayList<Cattachment> allCattachment();

	ArrayList<Competition> topCompetition();

	int getListCount();

	Competition selectCompetition(Integer cId);

	Cattachment selectCattachment(Integer cId);

	void addCount(Integer cId);

	int deleteCompetition(Integer cId);

	int getCpId(int i);

	void updateFile(Cattachment ca);

	int updateCompetition(Competition c);

	ArrayList<CompetitionReply> competitionReplyList(int cId);

	int addCompetitionReply(CompetitionReply r);

}
