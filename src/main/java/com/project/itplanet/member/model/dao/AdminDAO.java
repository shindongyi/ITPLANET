package com.project.itplanet.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.itplanet.blacklist.model.vo.Black;
import com.project.itplanet.competition.model.vo.Competition;
import com.project.itplanet.member.model.vo.Member;

@Repository("aDAO")
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectList() {
		return (ArrayList)sqlSession.selectList("memberMapper.selectList");
		 
	}

//	public ArrayList<Member> selecBlist() {
//		return (ArrayList)sqlSession.selectList("memberMapper.selecBlist");
//	}

	public int blackOff(String blkTargetId) {
		return sqlSession.update("memberMapper.blackOff",blkTargetId);
	}

	public int black(String blkId) {
		return sqlSession.update("memberMapper.black",blkId);
	}

	public ArrayList<Competition> alist() {
		return (ArrayList)sqlSession.selectList("memberMapper.alist");
	}

	public ArrayList<Black> blist() {
		return(ArrayList)sqlSession.selectList("memberMapper.blist");
	}

	public int gongmoYes(int gongNum) {
		return sqlSession.update("memberMapper.gongmoYes",gongNum);
	}

	public ArrayList<Competition> selectClist() {
		return (ArrayList)sqlSession.selectList("memberMapper.clist");
	}

	public int gongmoNo(int gongNum2) {
		return sqlSession.update("memberMapper.gongmoNo",gongNum2);
	}

	public int shingoYes(int singoNum) {
		return sqlSession.update("memberMapper.shingoYes",singoNum);
	}

	public int shingoNo(int singoNum2) {
		return sqlSession.update("memberMapper.shingoNo",singoNum2);
	}

	
}
