package com.project.itplanet.study.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.itplanet.common.model.vo.Local;
import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.study.model.vo.Study;
import com.project.itplanet.study.model.vo.StudyReply;

public interface StudyService {

	ArrayList<Local> selectLocal();

	int studyInsert(Study study);

	int getListCount();

	ArrayList<Study> selectStudy(PageInfo pi);

	Study studyDetail(int sId);

	int deleteStudy(int sId);

	void createChat(HashMap<String, String> map);

	int updateStudy(Study study);

	void addReadCount(int sId);

	String chatMember(int sId);

	int studyAdd(HashMap<String, Object> map);

	int studyCancel(HashMap<String, Object> map);

	ArrayList<StudyReply> studyRepleList(int sId);

	int addReply(StudyReply r);

	int getSearchResultListCount(HashMap<String, String> map);

	ArrayList<Study> selectSearchResultList(HashMap<String, String> map, PageInfo pi);


}
