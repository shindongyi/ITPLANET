package com.project.itplanet.competition.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("cDAO")
public class CompetitionDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
