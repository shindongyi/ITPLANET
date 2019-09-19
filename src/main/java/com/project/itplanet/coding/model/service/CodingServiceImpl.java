package com.project.itplanet.coding.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.coding.model.dao.CodingDAO;
import com.project.itplanet.coding.model.vo.Coding;
import com.project.itplanet.coding.model.vo.CodingPass;

@Service("coService")
public class CodingServiceImpl implements CodingService{
	@Autowired
	private CodingDAO coDAO;

	@Override
	public int insertCoding(Coding c) {
		return coDAO.insertCoding(c);
	}

	@Override
	public ArrayList<Coding> listCoding() {
		return coDAO.listCoding();
	}

	@Override
	public ArrayList<CodingPass> getPassList(int qno) {
		return coDAO.getPassList(qno);
	}

	@Override
	public void insertQscore(Map<String, Object> map) {
		coDAO.insertQscore(map);
	}

	@Override
	public Coding getCoding(int qno) {
		return coDAO.getCoding(qno);
	}
	
	@Override
	   public int codingCount(String userId) {
	      return coDAO.countCoding(userId);
	  }
}
