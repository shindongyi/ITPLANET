package com.project.itplanet.member.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.member.model.dao.MemberDAO;
import com.project.itplanet.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService{

	@Autowired
	public MemberDAO mDAO;
	
	@Override
	public Member memberLoginUser(Member m) {
		return mDAO.selectMember(m);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(m);
	}

	@Override
	public int selectUserId(String userId) {
		return mDAO.selectUserID(userId);
	}

	@Override
	public int updatePwd(Member m) {
		return mDAO.updatePwd(m);
	}

	@Override
	public String findUserId(Member m) {
		return mDAO.findUserId(m);
	}

	@Override
	public int findPwd(Member m) {
		return mDAO.findUserPwd(m);
	}

	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(m);
	}

	@Override
	public int deleteMember(String userId) {
		return mDAO.deleteMember(userId);
	}

	@Override
	public int selectNickName(String nickName) {
		return mDAO.selectNickName(nickName);
	}

//	@Override
//	public int countComp(String userId) {
//		return mDAO.countComp(userId);
//	}
//
//	@Override
//	public int countHire(String userId) {
//		return mDAO.countHire(userId);
//	}
//
//	@Override
//	public int countLcs(String userId) {
//		return mDAO.countLcs(userId);
//	}

//	@Override
//	public ArrayList selectScrapList(String userId, int type) {
//		return mDAO.selectScrapList(userId, type);
//	}

	@Override
	public ArrayList<HashMap<String, String>> selectScrapList(String userId, Integer type, PageInfo pi) {
		return mDAO.selectScrapList(userId, type, pi);
	}
	
	@Override
	public HashMap<String, Integer> countScrap(String userId) {
		return mDAO.countScrap(userId);
	}

	@Override
	public ArrayList<HashMap<String, String>> recentComp(String userId) {
		return mDAO.recentComp(userId);
	}

	@Override
	public ArrayList<HashMap<String, String>> recentHire(String userId) {
		return mDAO.recentHire(userId);
	}

	@Override
	public ArrayList<HashMap<String, String>> recentLcs(String userId) {
		return mDAO.recentLcs(userId);
	}

	





}
