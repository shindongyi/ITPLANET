package com.project.itplanet.coding.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.coding.model.dao.CodingDAO;
import com.project.itplanet.coding.model.vo.Coding;

@Service("coService")
public class CodingServiceImpl implements CodingService{
	@Autowired
	private CodingDAO coDAO;

	@Override
	public int insertCoding(Coding c) {
		return coDAO.insertCoding(c);
	}
}
