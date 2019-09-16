package com.project.itplanet.license.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.license.model.vo.License;

@Repository("lDAO")
public class LicenseDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount(HashMap<String, Object> map) {
		return sqlSession.selectOne("licenseMapper.getListCount", map);
	}

	public ArrayList<License> selectList(HashMap<String, Object> map) {
		if(map.get("pi") != null) {
			PageInfo pi = (PageInfo)map.get("pi");
			int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			return (ArrayList)sqlSession.selectList("licenseMapper.selectList", map, rowBounds);
		} else {
			return (ArrayList)sqlSession.selectList("licenseMapper.selectList", map);
		}
	}

	public int insertScrapLcs(HashMap<String, Object> map) {
		return sqlSession.insert("licenseMapper.insertScrapLcs", map);
	}

	public int confirmScrap(HashMap<String, Object> map) {
		return sqlSession.selectOne("licenseMapper.confirmScrap",map);
	}

	public ArrayList<?> userScrap(String userId) {
		return (ArrayList)sqlSession.selectList("licenseMapper.userScrap",userId);
	}

	public int deleteLcs(int eventId) {
		return sqlSession.update("licenseMapper.deleteLcs",eventId);
	}

	public int updateLcs(HashMap<String, Object> map) {
		return sqlSession.update("licenseMapper.updateLcs", map);
	}

	public int insertLcs(HashMap<String, Object> map) {
		return sqlSession.insert("licenseMapper.insertLcs", map);
	}

	public ArrayList<License> mainLicense() {
		return (ArrayList)sqlSession.selectList("licenseMapper.mainLicense");
	}
	

}
