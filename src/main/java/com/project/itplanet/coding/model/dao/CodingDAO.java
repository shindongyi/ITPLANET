package com.project.itplanet.coding.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.itplanet.coding.model.vo.Coding;

@Repository("coDAO")
public class CodingDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertCoding(Coding c) {
		return sqlSession.insert("codingMapper.insertCoding", c);
	}
}
