package com.project.itplanet.blacklist.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("bDAO")
public class BlackListDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
