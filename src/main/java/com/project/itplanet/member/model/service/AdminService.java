package com.project.itplanet.member.model.service;

import java.util.ArrayList;

import com.project.itplanet.blacklist.model.vo.Black;
import com.project.itplanet.competition.model.vo.Competiton;
import com.project.itplanet.member.model.vo.Member;

public interface AdminService {

	ArrayList<Member> selecMemtList();

//	ArrayList<Member> selecBlist();

	int blackOff(String blkTargetId);

	int black(String blkId);

	ArrayList<Competiton> alist();

	ArrayList<Black> selecBlist();

	int gongmoYes(int gongNum);

	ArrayList<Competiton> selectClist();

	int gongmoNo(int gongNum2);

	int shingoYes(int singoNum);

	int shingoNo(int singoNum2);

	

}
