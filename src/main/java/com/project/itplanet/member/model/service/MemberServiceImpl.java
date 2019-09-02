package com.project.itplanet.member.model.service;


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
	public String findUserId(Member m) {
		return mDAO.findUserId(m);
	}

	@Override
	public int findPwd(Member m) {
		return mDAO.findUserPwd(m);
	}
}
