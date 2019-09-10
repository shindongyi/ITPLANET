package com.project.itplanet.member.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.blacklist.model.vo.Black;
import com.project.itplanet.competition.model.vo.Competition;
import com.project.itplanet.member.model.dao.AdminDAO;
import com.project.itplanet.member.model.vo.Member;

@Service("aService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	public AdminDAO aDAO;

	@Override
	public ArrayList<Member> selecMemtList() {
		return aDAO.selectList();
	}

//	@Override
//	public ArrayList<Member> selecBlist() {
//		return aDAO.selecBlist();
//	}

	@Override
	public int blackOff(String blkTargetId) {
		return aDAO.blackOff(blkTargetId);

	}
	
	@Override
	public int black(String blkId) {
		return aDAO.black(blkId);
	}
	
	@Override
	public ArrayList<Competition> alist() {
		return aDAO.alist();
	}
	
	@Override
	public ArrayList<Black> selecBlist() {
		return aDAO.blist();
	}
	
	@Override
	public int gongmoYes(int gongNum) {
		return aDAO.gongmoYes(gongNum);
	}
	
	@Override
	public ArrayList<Competition> selectClist() {
		return aDAO.selectClist();
	}
	
	@Override
	public int gongmoNo(int gongNum2) {
		return aDAO.gongmoNo(gongNum2);
	}
	
	@Override
	public int shingoYes(int singoNum) {
		return aDAO.shingoYes(singoNum);
	}
	
	@Override
	public int shingoNo(int singoNum2) {
		return aDAO.shingoNo(singoNum2);
	}
}
