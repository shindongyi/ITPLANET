package com.project.itplanet.coding.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("coDAO")
public class CodingDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
