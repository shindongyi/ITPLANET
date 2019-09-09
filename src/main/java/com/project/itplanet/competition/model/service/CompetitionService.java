package com.project.itplanet.competition.model.service;

import com.project.itplanet.competition.model.vo.Cattachment;
import com.project.itplanet.competition.model.vo.Competition;

public interface CompetitionService {

	int insertCompetition(Competition c);

	int insertCattachment(Cattachment ca);

}
