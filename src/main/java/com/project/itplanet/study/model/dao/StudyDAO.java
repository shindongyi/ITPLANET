package com.project.itplanet.study.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("sDAO")
public class StudyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
