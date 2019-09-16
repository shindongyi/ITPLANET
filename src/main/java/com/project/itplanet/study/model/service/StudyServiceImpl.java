package com.project.itplanet.study.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.common.model.vo.Local;
import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.study.model.dao.StudyDAO;
import com.project.itplanet.study.model.vo.Study;
import com.project.itplanet.study.model.vo.StudyChat;
import com.project.itplanet.study.model.vo.StudyReply;

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

	@Override
	public int updateStudy(Study study) {
		return sDAO.updateStudy(study);
	}

	@Override
	public void addReadCount(int sId) {
		sDAO.addReadCount(sId);
	}

	@Override
	public String chatMember(int sId) {
		return sDAO.chatMember(sId);
	}

	@Override
	public int studyAdd(HashMap<String, Object> map) {
		return sDAO.studyAdd(map);
	}

	@Override
	public int studyCancel(HashMap<String, Object> map) {
		return sDAO.studyCancel(map);
	}

	@Override
	public ArrayList<StudyReply> studyRepleList(int sId) {
		return sDAO.studyRepleList(sId);
	}

	@Override
	public int addReply(StudyReply r) {
		return sDAO.addReply(r);
	}

	@Override
	public int getSearchResultListCount(HashMap<String, String> map) {
		return sDAO.getSearchResultListCount(map);
	}

	@Override
	public ArrayList<Study> selectSearchResultList(HashMap<String, String> map, PageInfo pi) {
		return sDAO.selectSearchResultList(map, pi);
	}


	@Override
	public int getChatListCount(String nickName) {
		return sDAO.getChatListCount(nickName);
	}

	@Override
	public ArrayList<StudyChat> getChatList(String nickName, PageInfo pi) {
		return sDAO.getChatList(nickName, pi);
	}

	@Override
	public ArrayList<String> selectLicense() {
		return sDAO.selectLicense();
	}

	@Override
	public ArrayList<String> selectComp() {
		return sDAO.selectComp();
	}

	@Override
	public ArrayList<Study> mainStudy() {
		return sDAO.mainStudy();
	}


}
