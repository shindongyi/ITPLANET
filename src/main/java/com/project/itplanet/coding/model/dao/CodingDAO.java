package com.project.itplanet.coding.model.dao;


import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.itplanet.coding.model.vo.Coding;
import com.project.itplanet.coding.model.vo.CodingPass;

@Repository("coDAO")
public class CodingDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertCoding(Coding c) {
		return sqlSession.insert("codingMapper.insertCoding", c);
	}

	public ArrayList<Coding> listCoding() {
		return (ArrayList)sqlSession.selectList("codingMapper.listCoding");
	}

	public ArrayList<CodingPass> getPassList(int qno) {
		return (ArrayList)sqlSession.selectList("codingMapper.getPassList", qno);
	}

	public void insertQscore(Map<String, Object> map) {
		sqlSession.insert("codingMapper.insertQscore", map);
	}

	public Coding getCoding(int qno) {
		return sqlSession.selectOne("codingMapper.getCoding", qno);
	}
}
