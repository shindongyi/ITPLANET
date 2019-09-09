package com.project.itplanet.license.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.license.model.vo.License;
import com.project.itplanet.member.model.vo.LScrap;

@Repository("lDAO")
public class LicenseDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount(HashMap map) {
		return sqlSession.selectOne("licenseMapper.getListCount", map);
	}

	public ArrayList<License> selectList(HashMap map) {
		PageInfo pi = (PageInfo)map.get("pi");
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("licenseMapper.selectList", map, rowBounds);
	}

	public int insertScrapLcs(HashMap map) {
		return sqlSession.insert("licenseMapper.insertScrapLcs", map);
	}

	public int confirmScrap(HashMap map) {
		return sqlSession.selectOne("licenseMapper.confirmScrap",map);
	}

	public ArrayList userScrap(String userId) {
		return (ArrayList)sqlSession.selectList("licenseMapper.userScrap",userId);
	}
	

}
