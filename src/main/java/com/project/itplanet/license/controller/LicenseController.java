package com.project.itplanet.license.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.project.itplanet.common.Pagination;
import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.license.model.exception.LicenseException;
import com.project.itplanet.license.model.service.LicenseService;
import com.project.itplanet.license.model.vo.License;
import com.project.itplanet.member.model.service.MemberService;
import com.project.itplanet.member.model.vo.LScrap;
import com.project.itplanet.member.model.vo.Member;

@Controller
public class LicenseController {
	@Autowired
	private LicenseService lService;
	
	@Autowired
	private MemberService mService;
	
	// 자격증 페이지 메인 뷰
	@RequestMapping("lcsView.do")
	public ModelAndView lcsView(ModelAndView mv,
								@RequestParam(value="page", required=false) Integer page,
								@RequestParam(value="keyword", required=false) String keyword,
								@RequestParam(value="sort", required=false) String sort,
								@RequestParam(value="more", required=false) String more,
								HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if(m != null) {
			String userId = m.getUserId();
			ArrayList userScrap = lService.userScrap(userId);
			mv.addObject("userScrap", userScrap);
			System.out.println("userScrap : " + userScrap.size());
			System.out.println(userScrap);
		}
		
		
		HashMap map = new HashMap();
		map.put("sort", sort);
		map.put("page", page);
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = lService.getListCount(map);
		
		PageInfo pi = Pagination.getPageInfo2(currentPage, listCount);
		
		map.put("pi", pi);
		map.put("choice", "first");
		ArrayList<License> firstList = lService.selectList(map);
		map.put("choice", "second");
		ArrayList<License> secondList = lService.selectList(map);
		map.put("keyword", keyword);
		
		map.remove("choice");
		
		if(more != null) {
			map.put("choice",more);
		}
		ArrayList<License> allList 	= lService.selectList(map);
		
		
		if(firstList != null && secondList != null) {
			mv.addObject("allList", allList);
			mv.addObject("firstList", firstList);
			mv.addObject("secondList", secondList);
			mv.addObject("pi", pi);
			mv.addObject("keyword", keyword);
			mv.setViewName("license/licenseMainView");
			System.out.println("list size : " + allList.size());
		} else {
			throw new LicenseException("게시판 조회에 실패했습니다.");
		}
		return mv;
	}
	
	// ajax로 페이지 더 불러올때
	@RequestMapping("getListMore.do")
	public void getListMore(HttpServletResponse response, 
							HttpServletRequest request,
							@RequestParam(value="page", required=false) Integer page,
							@RequestParam(value="keyword", required=false) String keyword,
							@RequestParam(value="sort", required=false) String sort) throws IOException{
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		HashMap map = new HashMap();
		map.put("page", page);
		map.put("keyword", keyword);
		map.put("sort", sort);
		
		int listCount = lService.getListCount(map);
		
		PageInfo pi = Pagination.getPageInfo2(currentPage, listCount);
		
		map.put("pi", pi);
		
		ArrayList<License> list = lService.selectList(map);
		
		for(License l : list) {
			l.setL_name(URLEncoder.encode(l.getL_name(), "utf-8"));
		}
		request.setAttribute("pi", pi);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list, response.getWriter());
	}
	
	// 스크랩하기
	@RequestMapping("scrapLcs.do")
	@ResponseBody
	public String insertScrapLcs(HttpSession session, @RequestParam("lId") int lId) {
		
		Member m = (Member)session.getAttribute("loginUser");
		String userId = m.getUserId();
		HashMap map = new HashMap(); 
		map.put("userId", userId);
		map.put("lId", lId);
		
		int confirmResult = lService.confirmScrap(map);
		if(confirmResult > 0) {
			return "already";
		} else {
			int result = lService.insertScrapLcs(map);
			
			if(result > 0) {
				HashMap<String, String>scrapCountMap = new HashMap<String, String>();
				scrapCountMap.put("userId", userId);

				HashMap<String,Integer> scrapCount = mService.countScrap(scrapCountMap);
				session.setAttribute("scrapCount", scrapCount);
				
				return "success";
			} else {
				return "fail";
			}
		}
	}

}
