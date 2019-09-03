package com.project.itplanet.study.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.itplanet.common.model.vo.Local;
import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.study.model.vo.Study;

@Repository("sDAO")
public class StudyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Local> selectLocal() {
		return (ArrayList)sqlSession.selectList("studyMapper.selectLocal");
	}

	public int studyInsert(Study study) {
		return sqlSession.insert("studyMapper.insertStudy", study);
	}

	public int getListCount() {
		return sqlSession.selectOne("studyMapper.getListCount");
	}

	public ArrayList<Study> selectStudy(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("studyMapper.selectStudy", null, rowBounds);
	}

	public Study studyDetail(int sId) {
		return sqlSession.selectOne("studyMapper.studyDetail", sId);
	}

	public int deleteStudy(int sId) {
		return sqlSession.update("studyMapper.deleteStudy", sId);
	}

	public void createChat(HashMap<String, String> map) {
		sqlSession.insert("studyMapper.createChat", map);
	}

}
