package com.project.itplanet.coding.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.project.itplanet.coding.model.exception.CodingException;
import com.project.itplanet.coding.model.service.CodingService;
import com.project.itplanet.coding.model.vo.Coding;
import com.project.itplanet.coding.model.vo.CodingPass;
import com.project.itplanet.member.model.vo.Member;

@Controller
public class CodingController {
	@Autowired
	private CodingService coService;
	
	@RequestMapping("insertCT.do")
	public String cdTest() {
		return "coding/codingTestInsert";
	}
	
	@RequestMapping("codingTestListView.do")
	public ModelAndView codingTestListView(ModelAndView mv) {
		//return "coding/codingTestList"; 
		ArrayList<Coding> ctList = coService.listCoding();
		
		mv.addObject("ctList", ctList);
		mv.setViewName("coding/codingTestList");
		return mv;
	}
	
	@RequestMapping("codingTestView.do")
	public ModelAndView codingTestView(@RequestParam("Qno") int qno, @SessionAttribute("loginUser") Member m, ModelAndView mv) {
		ArrayList<CodingPass> passList = coService.getPassList(qno);
		
		String userId = m.getUserId();
		Map<String, Object> map = new HashMap<String, Object>();
		if(passList == null) {
			map.put("qno", qno);
			map.put("userId", userId);
			coService.insertQscore(map);
		}else {
			boolean check = false;
			for(CodingPass c : passList) {
				if(c.getqNum() == qno && c.getUserId().equals(userId)) {
					check = true;
				}
			}
			
			if(!check) { // 시험을 처음 봤을때
				map.put("qno", qno);
				map.put("userId", userId);
				coService.insertQscore(map);
			}
		}
		
		Coding co = coService.getCoding(qno);
		
		if(co != null) {
			mv.addObject("co", co);
			mv.setViewName("coding/codingTestView");
			return mv;
		}else {
			throw new CodingException("코딩문제 조회에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("codingInsert.do")
	public String codingInsert(@RequestParam("qTitle") String qTitle, @RequestParam("qContent") String qContent, @RequestParam("limitList") String[] limitList,
							@RequestParam("exData") String[] exData, @RequestParam("exResult") String[] exResult,
							@SessionAttribute("loginUser") Member loginUser) {
		Coding c = new Coding();
		c.setqTitle(qTitle);
		c.setqContent(qContent);
		
		switch(limitList.length) {
		case 5:
			c.setqLimitationFive(limitList[4]);
			c.setqLimitationFour(limitList[3]);
			c.setqLimitationThree(limitList[2]);
			c.setqLimitationTwo(limitList[1]);
			c.setqLimitation(limitList[0]);
			break;
		case 4:
			c.setqLimitationFour(limitList[3]);
			c.setqLimitationThree(limitList[2]);
			c.setqLimitationTwo(limitList[1]);
			c.setqLimitation(limitList[0]);
			break;
		case 3:
			c.setqLimitationThree(limitList[2]);
			c.setqLimitationTwo(limitList[1]);
			c.setqLimitation(limitList[0]);
			break;
		case 2:
			c.setqLimitationTwo(limitList[1]);
			c.setqLimitation(limitList[0]);
			break;
		case 1:
			c.setqLimitation(limitList[0]);
			break;
		}
		
		switch(exData.length) {
		case 1:
			c.setqExData(exData[0]);
			c.setqExResult(exResult[0]);
			break;
		case 2:
			c.setqExData(exData[0]);
			c.setqExResult(exResult[0]);
			c.setqExDataTwo(exData[1]);
			c.setqExResultTwo(exResult[1]);
			break;
		case 3:
			c.setqExData(exData[0]);
			c.setqExResult(exResult[0]);
			c.setqExDataTwo(exData[1]);
			c.setqExResultTwo(exResult[1]);
			c.setqExDataThree(exData[2]);
			c.setqExResultThree(exResult[2]);
			break;
		}
		
		c.setUserId(loginUser.getUserId());
		
		int result = coService.insertCoding(c); 
		
		if(result > 0) {
			// 경로 수정하기
			return "redirect:codingTestListView.do";
		}else {
			throw new CodingException("코딩테스트 글 작성에 실패하였습니다.");
		}
	}
}
