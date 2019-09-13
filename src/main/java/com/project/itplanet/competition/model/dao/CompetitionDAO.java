package com.project.itplanet.competition.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.itplanet.common.model.vo.PageInfo;
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

	public ArrayList<Competition> allCompetition(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("competitionMapper.allCompetition", null, rowBounds);
	}

	public ArrayList<Cattachment> allCattachment() {
		return (ArrayList)sqlSession.selectList("competitionMapper.allCattachment");
	}

	public ArrayList<Competition> topCompetition() {
		return (ArrayList)sqlSession.selectList("competitionMapper.topCompetition");
	}

	public int getListCount() {
		return sqlSession.selectOne("competitionMapper.getListCount");
	}

	public Competition selectCompetition(Integer cId) {
		return sqlSession.selectOne("competitionMapper.selectCompetition", cId);
	}

	public Cattachment selectCattachment(Integer cId) {
		return sqlSession.selectOne("competitionMapper.selectCattachment", cId);
	}

	public void addCount(Integer cId) {
		sqlSession.update("competitionMapper.addCount", cId);
	}

	public int deleteCompetition(Integer cId) {
		return sqlSession.update("competitionMapper.deleteCompetition", cId);
	}
}
