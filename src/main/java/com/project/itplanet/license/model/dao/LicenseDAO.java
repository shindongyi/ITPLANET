package com.project.itplanet.license.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("lDAO")
public class LicenseDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
