package com.project.itplanet.competition.model.service;

import java.util.ArrayList;

import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.competition.model.vo.Cattachment;
import com.project.itplanet.competition.model.vo.Competition;

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

}
