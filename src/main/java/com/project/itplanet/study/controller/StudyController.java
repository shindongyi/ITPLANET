package com.project.itplanet.study.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.project.itplanet.common.Pagination;
import com.project.itplanet.common.model.vo.Local;
import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.member.model.vo.Member;
import com.project.itplanet.study.model.exception.StudyException;
import com.project.itplanet.study.model.service.StudyService;
import com.project.itplanet.study.model.vo.Study;
import com.project.itplanet.study.model.vo.StudyReply;


@Controller
public class StudyController {
	@Autowired
	private StudyService sService;
	
	@RequestMapping("studyInsertView.do")
	public ModelAndView studyInsertView(ModelAndView mv) {
		ArrayList<Local> list = sService.selectLocal();
		mv.addObject("list", list);
		mv.setViewName("study/studyInsertView");
		
		return mv;
	}
	
	@RequestMapping("studyListView.do")
	public ModelAndView studyListView(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = sService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Study> list = sService.selectStudy(pi);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("study/studyListView");
		}else {
			throw new StudyException("게시글 전체 조회에 실패하였습니다.");
		}
		
		return mv;
		
	}
	
	@RequestMapping("studyUpdateView.do")
	public ModelAndView studyUpdateView(ModelAndView mv, @ModelAttribute Study study) {
		ArrayList<Local> list = sService.selectLocal();
		mv.addObject("study", study);
		mv.addObject("list", list);
		mv.setViewName("study/studyUpdateView");
		return mv;
	}
	
	@RequestMapping("studyInsert.do")
	public String studyInsert(@SessionAttribute("loginUser") Member loginUser,
							@ModelAttribute Study study, @RequestParam("cname") String cname) {
		String id = loginUser.getUserId();
		study.setsWriter(id);
		
		int result = sService.studyInsert(study);
		
		String nickName = loginUser.getNickName();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("cname", cname);
		map.put("nickName", nickName);
		sService.createChat(map);
		
		if(result > 0) {
			return "redirect:studyListView.do";
		}else {
			throw new StudyException("스터디 모집글 작성에 실패하였습니다.");
		}
	}
	
	@RequestMapping("studyDetail.do")
	public ModelAndView studyDetail(@RequestParam("sId") int sId, ModelAndView mv) {
		sService.addReadCount(sId);
		Study study = sService.studyDetail(sId);
		String chatMember = sService.chatMember(sId);
		
		mv.addObject("study", study);
		mv.addObject("chatMember", chatMember);
		mv.setViewName("study/studyDetailView");
		
		return mv;
	}
	
	@RequestMapping("deleteStudy.do")
	public String deleteStudy(@RequestParam("sId") int sId) {
		int result = sService.deleteStudy(sId);
		
		if(result > 0) {
			return "redirect:studyListView.do";
		}else {
			throw new StudyException("게시글 삭제에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("updateStudy.do")
	public ModelAndView updateStudy(@ModelAttribute Study study, ModelAndView mv) {
		int result = sService.updateStudy(study);
		int sId = study.getsId();
		if(result >0) {
			mv.addObject("sId", sId);
			mv.setViewName("redirect:studyDetail.do");
		}else {
			throw new StudyException("게시글 수정에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("studyCancel.do")
	public ModelAndView studyCancel(@RequestParam("sId") int sId,ModelAndView mv,@SessionAttribute("loginUser") Member loginUser) {
		String nickName = loginUser.getNickName();
		String chatMember = sService.chatMember(sId);
		String[] chatMem = chatMember.split(",");
		
		String newChatMember = null;
		
		for(int i=0; i< chatMem.length; i++) {
			if(chatMem[i].equals(nickName)) {
				continue;
			}else {
				if(newChatMember == null) {
					newChatMember = chatMem[i];
				}else {
					newChatMember += "," + chatMem[i];
				}
			}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sId", sId);
		map.put("chatMember", newChatMember);
		int result = sService.studyCancel(map);
		if(result > 0) {
			mv.addObject("sId", sId);
			mv.setViewName("redirect:studyDetail.do");
		}else {
			throw new StudyException("스터디 취소에 실패하였습니다.");
		}
		return mv;
	}
	
	@RequestMapping("studyAdd.do")
	public ModelAndView studyAdd(@RequestParam("sId") int sId, @SessionAttribute("loginUser") Member loginUser, ModelAndView mv) {
		String nickname = loginUser.getNickName();
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("sId", sId);
		map.put("nickname", nickname);
		
		int result = sService.studyAdd(map);
		if(result > 0) {
			mv.addObject("sId", sId);
			mv.setViewName("redirect:studyDetail.do");
		}else {
			throw new StudyException("스터디 멤버신청을 실패하였습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("studyRepleList.do")
	public void studyRepleList(HttpServletResponse response, @RequestParam("sId") int sId) throws IOException {
		System.out.println(sId);
		ArrayList<StudyReply> repleList = sService.studyRepleList(sId);
		
		for(StudyReply sr : repleList) {
			sr.setSrContent(URLEncoder.encode(sr.getSrContent(), "utf-8"));
			sr.setSrWriter(URLEncoder.encode(sr.getSrWriter(), "utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(repleList, response.getWriter());
		
	}
	
	@RequestMapping("addStudyReple.do")
	@ResponseBody
	public String addReply(StudyReply r, @SessionAttribute("loginUser") Member loginUser, ModelAndView mv, HttpServletResponse response) {
		String rWriter = loginUser.getUserId();
		r.setSrWriter(rWriter);
		int result = sService.addReply(r);
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("success", "success");
//		map.put("sId", r.getsId());
		
		if(result > 0) {
//			mv.addAllObjects(map);
//			
//			mv.setViewName("jsonView");
//			response.setContentType("application/json; charset=utf-8");
			return "success";
		}else {
			throw new StudyException("댓글 작성에 실패하였습니다.");
		}
		
	}
}
