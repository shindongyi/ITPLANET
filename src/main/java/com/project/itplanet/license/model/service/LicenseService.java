package com.project.itplanet.license.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.license.model.vo.License;
import com.project.itplanet.member.model.vo.LScrap;




public interface LicenseService {

	int getListCount(HashMap map);

	ArrayList<License> selectList(HashMap map);

	int insertScrapLcs(HashMap map);

	int confirmScrap(HashMap map);

	ArrayList userScrap(String userId);

}
