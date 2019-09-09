package com.project.itplanet.competition.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.itplanet.competition.model.vo.Cattachment;
import com.project.itplanet.competition.model.vo.Competition;

@Repository("cDAO")
public class CompetitionDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertCompetition(Competition c) {
		return sqlSession.insert("competitionMapper.insertCompetition", c);
	}

	public int insertCattachment(Cattachment ca) {
		return sqlSession.insert("competitionMapper.insertCattachment", ca);
	}
}
