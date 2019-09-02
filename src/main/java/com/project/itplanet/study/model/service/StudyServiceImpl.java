package com.project.itplanet.study.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.common.model.vo.Local;
import com.project.itplanet.study.model.dao.StudyDAO;

@Service("sService")
public class StudyServiceImpl implements StudyService{
	@Autowired
	private StudyDAO sDAO;

	@Override
	public ArrayList<Local> selectLocal() {
		return sDAO.selectLocal();
	}
}
