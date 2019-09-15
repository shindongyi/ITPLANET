package com.project.itplanet.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.itplanet.member.model.vo.Member;

public interface MemberService {
	Member memberLoginUser(Member m);

	int insertMember(Member m);

	int selectUserId(String userId);

	int updatePwd(Member m);

	Member findUserId(Member m);

	int findPwd(Member m);

	int updateMember(Member m);

	int deleteMember(String userId);

	int selectNickName(String nickName);

	HashMap<String, Integer> countScrap(HashMap<String, String> map);

	ArrayList<HashMap<String, String>> selectScrapList(HashMap<String, Object> map2);

	ArrayList<HashMap<String, String>> recentComp(HashMap<String, String> map);
	ArrayList<HashMap<String, String>> recentHire(HashMap<String, String> map);
	ArrayList<HashMap<String, String>> recentLcs(HashMap<String, String> map);

	int deleteScrap(HashMap<String, Object> map);

	int checkEmail(String email);

//	ArrayList recentScrap(HashMap map);

}
