package com.project.itplanet.license.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.license.model.dao.LicenseDAO;
import com.project.itplanet.license.model.vo.License;
import com.project.itplanet.member.model.vo.LScrap;

@Service("lService")
public class LicenseServiceImpl implements LicenseService{
	@Autowired
	private LicenseDAO lDAO;
	
	@Override
	public int getListCount(HashMap map) {
		return lDAO.getListCount(map);
	}

	@Override
	public ArrayList<License> selectList(HashMap map) {
		return lDAO.selectList(map);
	}

	@Override
	public int insertScrapLcs(HashMap map) {
		return lDAO.insertScrapLcs(map);
	}

	@Override
	public int confirmScrap(HashMap map) {
		return lDAO.confirmScrap(map);
	}

	@Override
	public ArrayList userScrap(String userId) {
		return lDAO.userScrap(userId);
	}

	@Override
	public int deleteLcs(int eventId) {
		return lDAO.deleteLcs(eventId);
	}

}
