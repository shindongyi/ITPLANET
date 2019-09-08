package com.project.itplanet.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.member.model.vo.Member;

public interface MemberService {
	Member memberLoginUser(Member m);

	int insertMember(Member m);

	int selectUserId(String userId);

	int updatePwd(Member m);

	String findUserId(Member m);

	int findPwd(Member m);

	int updateMember(Member m);

	int deleteMember(String userId);

	int selectNickName(String nickName);

//	int countComp(String userId);
//
//	int countHire(String userId);
//
//	int countLcs(String userId);

//	ArrayList selectScrapList(String userId, int type, PageInfo pi);

	HashMap<String, Integer> countScrap(String userId);

	ArrayList<HashMap<String, String>> selectScrapList(String userId, Integer type, PageInfo pi);

//	ArrayList recentScrap(String userId);

	ArrayList<HashMap<String, String>> recentComp(String userId);
	ArrayList<HashMap<String, String>> recentHire(String userId);
	ArrayList<HashMap<String, String>> recentLcs(String userId);

//	Map<String, Integer> scrapCount(String userId);

}
