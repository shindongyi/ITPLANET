package com.project.itplanet.study.model.service;

import java.util.ArrayList;

import com.project.itplanet.common.model.vo.Local;
import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.study.model.vo.Study;

public interface StudyService {

	ArrayList<Local> selectLocal();

	int studyInsert(Study study);

	int getListCount();

	ArrayList<Study> selectStudy(PageInfo pi);

	Study studyDetail(int sId);

}
