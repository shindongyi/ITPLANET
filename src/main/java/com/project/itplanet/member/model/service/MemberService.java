package com.project.itplanet.member.model.service;

import com.project.itplanet.member.model.vo.Member;

public interface MemberService {
	Member memberLoginUser(Member m);

	int insertMember(Member m);

	int selectUserId(String userId);

	int updatePwd(Member m);

	String findUserId(Member m);

	int findPwd(Member m);
}
