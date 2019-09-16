package com.project.itplanet.license.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.itplanet.license.model.vo.License;

public interface LicenseService {

	int getListCount(HashMap<String, Object> map);

	ArrayList<License> selectList(HashMap<String, Object> map);

	int insertScrapLcs(HashMap<String, Object> map);

	int confirmScrap(HashMap<String, Object> map);

	ArrayList<?> userScrap(String userId);

	int deleteLcs(int eventId);

	int updateLcs(HashMap<String, Object> map);

	int insertLcs(HashMap<String, Object> map);

	ArrayList<License> mainLicense();

}
