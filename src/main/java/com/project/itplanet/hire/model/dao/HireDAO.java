package com.project.itplanet.hire.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("hDAO")
public class HireDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
