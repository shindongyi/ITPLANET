package com.project.itplanet.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.itplanet.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member selectMember(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int selectUserID(String userId) {
		return sqlSession.selectOne("memberMapper.selectUserId", userId);
	}

	public int updatePwd(Member m) {
		return sqlSession.update("memberMapper.upatePwd", m);
	}
	
	public String findUserId(Member m) {
		return sqlSession.selectOne("memberMapper.findUserId",m);
	}

	public int findUserPwd(Member m) {
		return sqlSession.selectOne("memberMapper.findUserPwd", m);
	}
}
