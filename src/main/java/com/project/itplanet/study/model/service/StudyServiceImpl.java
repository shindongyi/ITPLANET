package com.project.itplanet.study.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.common.model.vo.Local;
import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.study.model.dao.StudyDAO;
import com.project.itplanet.study.model.vo.Study;

@Service("sService")
public class StudyServiceImpl implements StudyService{
	@Autowired
	private StudyDAO sDAO;

	@Override
	public ArrayList<Local> selectLocal() {
		return sDAO.selectLocal();
	}

	@Override
	public int studyInsert(Study study) {
		return sDAO.studyInsert(study);
	}

	@Override
	public int getListCount() {
		return sDAO.getListCount();
	}

	@Override
	public ArrayList<Study> selectStudy(PageInfo pi) {
		return sDAO.selectStudy(pi);
	}

	@Override
	public Study studyDetail(int sId) {
		return sDAO.studyDetail(sId);
	}

	@Override
	public int deleteStudy(int sId) {
		return sDAO.deleteStudy(sId);
	}


	@Override
	public void createChat(HashMap<String, String> map) {
		sDAO.createChat(map);
		
	}
}
