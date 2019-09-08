package com.project.itplanet.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member selectMember(Member m) {
		return (Member)sqlSession.selectOne("memberMapper.selectOne", m);
	}

	public int insertMember(Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int selectUserID(String userId) {
		return sqlSession.selectOne("memberMapper.selectUserId", userId);
	}

	public int updatePwd(Member m) {
		return sqlSession.update("memberMapper.upatePwd", m);
	}
	
	public String findUserId(Member m) {
		return sqlSession.selectOne("memberMapper.findUserId",m);
	}

	public int findUserPwd(Member m) {
		return sqlSession.selectOne("memberMapper.findUserPwd", m);
	}

	public int updateMember(Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int deleteMember(String userId) {
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	public int selectNickName(String nickName) {
		return sqlSession.selectOne("memberMapper.selectNickName", nickName);
	}
//
//	public int countComp(String userId) {
//		return sqlSession.selectOne("memberMapper.countComp", userId);
//	}
//
//	public int countHire(String userId) {
//		return sqlSession.selectOne("memberMapper.countHire", userId);
//	}
//
//	public int countLcs(String userId) {
//		return sqlSession.selectOne("memberMapper.countLcs", userId);
//	}
	
	public HashMap<String, Integer> countScrap(String userId) {
		int compCount = sqlSession.selectOne("memberMapper.countComp", userId);
		int hireCount =sqlSession.selectOne("memberMapper.countHire", userId);
		int lcsCount = sqlSession.selectOne("memberMapper.countLcs", userId);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("compCount", compCount);
		map.put("hireCount", hireCount);
		map.put("lcsCount", lcsCount);
		
		return map;
	}

//	public ArrayList selectScrapList(String userId, int type) {
//		if(type==1) {
//			return (ArrayList)sqlSession.selectList("memberMapper.selectCompScrapList", userId); 
//		} else if(type==2) {
//			return (ArrayList)sqlSession.selectList("memberMapper.selectHireScrapList", userId);
//		} else {
//			return (ArrayList)sqlSession.selectList("memberMapper.selectLcsScrapList", userId);
//		}
//	}

	public ArrayList<HashMap<String, String>> selectScrapList(String userId, Integer type, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		if(type==1) {
			return (ArrayList)sqlSession.selectList("memberMapper.selectCompScrapList", userId, rowBounds); 
		} else if(type==2) {
			return (ArrayList)sqlSession.selectList("memberMapper.selectHireScrapList", userId, rowBounds);
		} else {
			return (ArrayList)sqlSession.selectList("memberMapper.selectLcsScrapList", userId, rowBounds);
		}
	}
	

	public ArrayList recentScrap(String userId) {
		ArrayList list = new ArrayList<HashMap<String, Object>>();
//		Map<String, Object> recentComp = sqlSession.selectMap("memberMapper.recentCompScrap", userId, "recentComp");
//		Map<String, Object> recentLcs = sqlSession.selectMap("memberMapper.recentLcsScrap", userId, "recentLcs");
//		Map<String, Object> recentHire = sqlSession.selectMap("memberMapper.recentHireScrap", userId, "recentHire");
//		list.add(recentComp);
		
		ArrayList<HashMap<String, String>> recentLcs = (ArrayList)sqlSession.selectList("memberMapper.recentLcsScrap", userId);
		ArrayList<HashMap<String, String>> recentComp = (ArrayList)sqlSession.selectList("memberMapper.recentCompScrap", userId);
		ArrayList<HashMap<String, String>> recentHire = (ArrayList)sqlSession.selectList("memberMapper.recentHireScrap", userId);
		list.add(recentComp);
		list.add(recentLcs);
		list.add(recentHire);
		
		return list;
	}

	public ArrayList<HashMap<String, String>> recentComp(String userId) {
		String keyword = "day1";
		return (ArrayList)sqlSession.selectList("memberMapper.recentCompScrap", userId);
	}
	public ArrayList<HashMap<String, String>> recentHire(String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.recentHireScrap", userId);
	}
	public ArrayList<HashMap<String, String>> recentLcs(String userId) {
		return (ArrayList)sqlSession.selectList("memberMapper.recentLcsScrap", userId);
	}



//	public Map<String, Integer> scrapCount(String userId) {
//		Map<String, String> compMap = new HashMap<String, String>();
//		compMap.put("scrap", "c_scrap");
//		compMap.put("userId",userId);
//		Map<String, String> lcsMap = new HashMap<String, String>();
//		lcsMap.put("scrap", "l_scrap");
//		lcsMap.put("userId",userId);
//		Map<String, String> hireMap = new HashMap<String, String>();
//		hireMap.put("scrap", "h_scrap");
//		hireMap.put("userId",userId);
//		
//		Map<String,Integer> scrapCount = new HashMap<String,Integer>();
//		int compCount = sqlSession.selectOne("memberMapper.scrapCount", compMap);
//		scrapCount.put("compCount", compCount);
//		int hireCount = sqlSession.selectOne("memberMapper.scrapCount", hireMap);
//		scrapCount.put("hireCount", hireCount);
//		int lcsCount = sqlSession.selectOne("memberMapper.scrapCount", lcsMap);
//		scrapCount.put("lcsCount", lcsCount);
//		
//		return scrapCount;
//	}

}
