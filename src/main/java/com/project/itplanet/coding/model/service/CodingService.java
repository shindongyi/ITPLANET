package com.project.itplanet.coding.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.project.itplanet.coding.model.vo.Coding;
import com.project.itplanet.coding.model.vo.CodingPass;
import com.project.itplanet.coding.model.vo.CodingTop;

public interface CodingService {

	int insertCoding(Coding c);

	ArrayList<Coding> listCoding();

	ArrayList<CodingPass> getPassList(int qno);

	void insertQscore(Map<String, Object> map);

	Coding getCoding(int qno);
	
	 int codingCount(String userId);

	int codingTestSuccess(Map<String, Object> map);

	ArrayList<CodingPass> listCPass(String userId);

	ArrayList<CodingTop> topList();

	ArrayList<CodingTop> titleList(ArrayList<CodingTop> topList);
}
