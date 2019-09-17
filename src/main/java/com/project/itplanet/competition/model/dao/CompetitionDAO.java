package com.project.itplanet.competition.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.competition.model.vo.Cattachment;
import com.project.itplanet.competition.model.vo.Competition;
import com.project.itplanet.competition.model.vo.CompetitionReply;
import com.project.itplanet.member.model.vo.CScrap;

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

	public int getCpId(int i) {
		return sqlSession.selectOne("competitionMapper.getCpId", i);
	}

	public void updateFile(Cattachment ca) {
		sqlSession.update("competitionMapper.updateFile", ca);
	}

	public int updateCompetition(Competition c) {
		return sqlSession.update("competitionMapper.updateCompetition", c);
	}

	public ArrayList<CompetitionReply> competitionReplyList(int cId) {
		return (ArrayList)sqlSession.selectList("competitionMapper.competitionReplyList", cId);
	}

	public int addCompetitionReply(CompetitionReply r) {
		return sqlSession.insert("competitionMapper.addCompetitionReply", r);
	}

	public ArrayList<Competition> mainComp() {
		return (ArrayList)sqlSession.selectList("competitionMapper.mainComp");
	}

	public ArrayList<Competition> mainCompNow() {
		return (ArrayList)sqlSession.selectList("competitionMapper.mainCompNow");
	}

	public ArrayList<Competition> topComp() {
		return (ArrayList)sqlSession.selectList("competitionMapper.topComp");
	}

	public int insertCscrap(Map<String, Object> map) {
		return sqlSession.insert("competitionMapper.insertCscrap", map);
	}

	public ArrayList<CScrap> selectScrapAll(Integer cId) {
		return (ArrayList)sqlSession.selectList("competitionMapper.scrapAll", cId);
	}

	public int deleteCscrap(Map<String, Object> map) {
		return sqlSession.delete("competitionMapper.deleteCscrap", map);
	}
}
