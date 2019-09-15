package com.project.itplanet.member.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public Member findUserId(Member m) {
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

	@Override
	public ArrayList<HashMap<String, String>> selectScrapList(HashMap<String, Object> map2) {
		return mDAO.selectScrapList(map2);
	}
	
	@Override
	public HashMap<String, Integer> countScrap(HashMap<String, String> map) {
		return mDAO.countScrap(map);
	}

	@Override
	public ArrayList<HashMap<String, String>> recentComp(HashMap<String, String> map) {
		return mDAO.recentComp(map);
	}

	@Override
	public ArrayList<HashMap<String, String>> recentHire(HashMap<String, String> map) {
		return mDAO.recentHire(map);
	}

	@Override
	public ArrayList<HashMap<String, String>> recentLcs(HashMap<String, String> map) {
		return mDAO.recentLcs(map);
	}

	@Override
	public int deleteScrap(HashMap<String, Object> map) {
		return mDAO.deleteScrap(map);
	}

	@Override
	public int checkEmail(String email) {
		return mDAO.checkEmail(email);
	}

//	@Override
//	public ArrayList recentScrap(HashMap map) {
//		return mDAO.recentScrap(map);
//	}

}
