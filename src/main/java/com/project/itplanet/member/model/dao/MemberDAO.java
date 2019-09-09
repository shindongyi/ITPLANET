package com.project.itplanet.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
		return sqlSession.update("memberMapper.updatePwd", m);
	}
	
	public Member findUserId(Member m) {
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
	
	public HashMap<String, Integer> countScrap(HashMap<String, String> map) {
		map.put("count", "comp");
		int compCount = sqlSession.selectOne("memberMapper.countScrap", map);
		map.put("count", "hire");
		int hireCount =sqlSession.selectOne("memberMapper.countScrap", map);
		map.put("count", "lcs");
		int lcsCount = sqlSession.selectOne("memberMapper.countScrap", map);
		HashMap<String, Integer> returnMap = new HashMap<String, Integer>();
		returnMap.put("compCount", compCount);
		returnMap.put("hireCount", hireCount);
		returnMap.put("lcsCount", lcsCount);
		
		return returnMap;
	}

	public ArrayList<HashMap<String, String>> selectScrapList(HashMap map2) {
		PageInfo pi = (PageInfo) map2.get("pi");
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		int type = (Integer) map2.get("type");
		String listName = null;
		if(type==1) {
			listName = "comp";
			map2.put("listName", listName);
			return (ArrayList)sqlSession.selectList("memberMapper.selectScrapList", map2, rowBounds); 
		} else if(type==2) {
			listName = "hire";
			map2.put("listName", listName);
			return (ArrayList)sqlSession.selectList("memberMapper.selectScrapList", map2, rowBounds);
		} else {
			listName = "lcs";
			map2.put("listName", listName);
			return (ArrayList)sqlSession.selectList("memberMapper.selectScrapList", map2, rowBounds);
		}
	}
	

//	public ArrayList recentScrap(String userId) {
//		ArrayList list = new ArrayList<HashMap<String, Object>>();
//		
//		ArrayList<HashMap<String, String>> recentLcs = (ArrayList)sqlSession.selectList("memberMapper.recentLcsScrap", userId);
//		ArrayList<HashMap<String, String>> recentComp = (ArrayList)sqlSession.selectList("memberMapper.recentCompScrap", userId);
//		ArrayList<HashMap<String, String>> recentHire = (ArrayList)sqlSession.selectList("memberMapper.recentHireScrap", userId);
//		list.add(recentComp);
//		list.add(recentLcs);
//		list.add(recentHire);
//		
//		return list;
//	}
	
	public ArrayList recentScrap(HashMap map) {
//		String listName = "comp";
//		map.put("listName", listName);
//		ArrayList compList = (ArrayList)sqlSession.selectList("memberMapper.recentScrap", map);
//		listName = "hire";
//		map.put("listName", listName);
//		ArrayList hireList = (ArrayList)sqlSession.selectList("memberMapper.recentScrap", map);
//		
		ArrayList compList = new ArrayList();
		ArrayList hireList = new ArrayList();
		ArrayList lcsList = new ArrayList();
		
		ArrayList recentList = new ArrayList();
		
		String[] arr = {"comp", "hire", "lcs"};
		for(int i = 0; i < arr.length; i++) {
			map.put("listName", arr[i]);
			if(i==0) {
				compList.add((ArrayList)sqlSession.selectList("memberMapper.recentScrap", map));
			} else if (i==1) {
				hireList.add((ArrayList)sqlSession.selectList("memberMapper.recentScrap", map));
			} else {
				lcsList.add((ArrayList)sqlSession.selectList("memberMapper.recentScrap", map));
			}
		}
		
		ArrayList alarmList = new ArrayList();
		String[] arr2 = {"day1", "day2"};
		for(int i = 0; i < arr2.length; i++) {
				map.put("keyword", arr2[i]);
			for(int j = 0; j < arr.length; j++) {
				map.put("listName", arr[j]);
				alarmList.add((ArrayList)sqlSession.selectList("memberMapper.recentScrap", map));
			}
		}
		
		ArrayList list = new ArrayList();
		list.add(compList);
		list.add(hireList);
		list.add(lcsList);
		list.add(alarmList);
		
		return list;
		
//		ArrayList alarmList1 = new ArrayList();
//		compList = (ArrayList)sqlSession.selectList("memberMapper.recentScrap", map);
//		map.put("listName", "hire");
//		hireList = (ArrayList)sqlSession.selectList("memberMapper.recentScrap", map);
//		lcsList = (ArrayList)sqlSession.selectList("memberMapper.recentScrap", map);
//		alarmList1.add(compList);
//		alarmList1.add(hireList);
//		alarmList1.add(lcsList);
		
//		keyword = "day2";
//		map.put("keyword", keyword);
		
//		ArrayList alarmList2 = new ArrayList();
//		compList = (ArrayList)sqlSession.selectList("memberMapper.recentScrap", map);
//		hireList = (ArrayList)sqlSession.selectList("memberMapper.recentScrap", map);
//		lcsList = (ArrayList)sqlSession.selectList("memberMapper.recentScrap", map);
//		alarmList2.add(compList);
//		alarmList2.add(hireList);
//		alarmList2.add(lcsList);
//		
//		ArrayList returnList = new ArrayList();
//		returnList.add(recentList);
//		returnList.add(alarmList1);
//		returnList.add(alarmList2);
		
//		System.out.println("returnList.size() : " + returnList.size());
//		for(int i = 0; i < returnList.size(); i++) {
//			for(int j = 0; j < ((ArrayList)returnList.get(i)).size(); j++) {
//				System.out.println(((ArrayList)returnList.get(i)).get(j));
//			}
//		}
//		
	}
	
	public ArrayList<HashMap<String, String>> recentComp(HashMap map) {
		return (ArrayList)sqlSession.selectList("memberMapper.recentCompScrap", map);
	}
	public ArrayList<HashMap<String, String>> recentHire(HashMap map) {
		return (ArrayList)sqlSession.selectList("memberMapper.recentHireScrap", map);
	}
	public ArrayList<HashMap<String, String>> recentLcs(HashMap map) {
		return (ArrayList)sqlSession.selectList("memberMapper.recentLcsScrap", map);
	}

	public int deleteScrap(HashMap map) {
		return sqlSession.delete("memberMapper.deleteScrap", map);
	}


}
