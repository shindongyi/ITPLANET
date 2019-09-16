package com.project.itplanet.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

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
		map.put("count", "lcs");
		int lcsCount = sqlSession.selectOne("memberMapper.countScrap", map);
		HashMap<String, Integer> returnMap = new HashMap<String, Integer>();
		returnMap.put("compCount", compCount);
		returnMap.put("lcsCount", lcsCount);
		
		return returnMap;
	}

	public ArrayList<HashMap<String, String>> selectScrapList(HashMap<String, Object> map2) {
		PageInfo pi = (PageInfo) map2.get("pi");
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		int type = (Integer) map2.get("type");
		String listName = null;
		if(type==1) {
			listName = "comp";
			map2.put("listName", listName);
			return (ArrayList)sqlSession.selectList("memberMapper.selectScrapList", map2, rowBounds); 
		} else {
			listName = "lcs";
			map2.put("listName", listName);
			return (ArrayList)sqlSession.selectList("memberMapper.selectScrapList", map2, rowBounds);
		}
	}
	
	public ArrayList<HashMap<String, String>> recentComp(HashMap map) {
		return (ArrayList)sqlSession.selectList("memberMapper.recentCompScrap", map);
	}

	public ArrayList<HashMap<String, String>> recentLcs(HashMap map) {
		return (ArrayList)sqlSession.selectList("memberMapper.recentLcsScrap", map);
	}

	public int deleteScrap(HashMap<String, Object> map) {
		return sqlSession.delete("memberMapper.deleteScrap", map);
	}

	public int checkEmail(String email) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}


}
