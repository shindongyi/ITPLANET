package com.project.itplanet.study.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.itplanet.common.model.vo.Local;

@Repository("sDAO")
public class StudyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Local> selectLocal() {
		return (ArrayList)sqlSession.selectList("studyMapper.selectLocal");
	}

}
