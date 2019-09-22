package com.project.itplanet.competition.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.project.itplanet.common.Pagination;
import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.competition.model.exception.CompetitionException;
import com.project.itplanet.competition.model.service.CompetitionService;
import com.project.itplanet.competition.model.vo.Cattachment;
import com.project.itplanet.competition.model.vo.Competition;
import com.project.itplanet.competition.model.vo.CompetitionReply;
import com.project.itplanet.member.model.vo.CScrap;
import com.project.itplanet.member.model.vo.Member;

@Controller
public class CompetitionController {
	@Autowired
	private CompetitionService cService;
	
	
	@RequestMapping("competitionView.do")
	public ModelAndView competitionView(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = cService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo3(currentPage, listCount);
		
		ArrayList<Competition> allCompetition = cService.allCompetition(pi);
		ArrayList<Competition> topCompetition = cService.topCompetition();
		ArrayList<Cattachment> allCattachment = cService.allCattachment();
		
		mv.addObject("competitionList", allCompetition);
		mv.addObject("topCompetition", topCompetition);
		mv.addObject("cattachmentList", allCattachment);
		mv.addObject("pi", pi);
		mv.setViewName("competition/competitionView");
		return mv;
	}
	
	@RequestMapping("competitionInsertView.do")
	public String competitionInsertView() {
		
		return "competition/competitionInsertView";
	}
	
	@RequestMapping("competitionInsert.do")
	public String competitionInsertView(@ModelAttribute Competition c, @SessionAttribute("loginUser") Member loginUser,
										@RequestParam(value="titleImg", required=false) MultipartFile titleImg, HttpServletRequest request,
										@RequestParam("startDate") Date startDate, @RequestParam("endDate") Date endDate,
										@RequestParam(value="contentImg1",required=false) MultipartFile contentImg1,
										@RequestParam(value="contentImg2",required=false) MultipartFile contentImg2,
										@RequestParam(value="contentImg3",required=false) MultipartFile contentImg3,
										@RequestParam(value="contentImg4",required=false) MultipartFile contentImg4) {
		String userId = loginUser.getUserId();
		
		System.out.println(titleImg);
		System.out.println(titleImg.getOriginalFilename());
		c.setcStartDate(startDate);
		c.setcDueDate(endDate);
		c.setcWriter(userId);
		
		int result = cService.insertCompetition(c);
		
		saveFile(titleImg, request);
		if(contentImg1 != null && !contentImg1.isEmpty()) {
			saveFile(contentImg1, request);
		}
		if(contentImg2 != null && !contentImg2.isEmpty()) {
			saveFile(contentImg2, request);
		}
		if(contentImg3 != null && !contentImg3.isEmpty()) {
			saveFile(contentImg3, request);
		}
		if(contentImg4 != null && !contentImg4.isEmpty()) {
			saveFile(contentImg4, request);
		}
		
		return "redirect:competitionView.do";
	}

	private void saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\compeloadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." 
								+ originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		String renamePath = folder + "\\" + renameFileName;
		
		Cattachment ca = new Cattachment();
		ca.setOriginName(originalFileName);
		ca.setChangeName(renameFileName);
		ca.setFilePath(savePath);
		
		int result = cService.insertCattachment(ca);
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("competitionDetail.do")
	public ModelAndView competitionDetail(ModelAndView mv, @RequestParam("cId") Integer cId) {
		System.out.println(cId);
		
		cService.addCount(cId);
		
		Competition competition = cService.selectCompetition(cId);
		Cattachment cAttachment = cService.selectCattachment(cId);
		ArrayList<CScrap> csList = cService.selectScrapAll(cId);
		
		
		mv.addObject("competition", competition);
		mv.addObject("cAttachment", cAttachment);
		mv.addObject("csList", csList);
		mv.setViewName("competition/competitionDetailView");
		
		return mv;
	}
	
	@RequestMapping("delectCompetition.do")
	public String deleteCompetition(@RequestParam("cId") Integer cId) {
		int result = cService.deleteCompetition(cId);
		
		if(result > 0) {
			return "redirect:competitionView.do";
		}else {
			throw new CompetitionException("게시글 삭제에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("updateCompetitionView.do")
	public ModelAndView updateCompetitionView(@RequestParam("cId") Integer cId, ModelAndView mv) {
		Competition competition = cService.selectCompetition(cId);
		Cattachment cAttachment = cService.selectCattachment(cId);
		
		mv.addObject("competition", competition);
		mv.addObject("cAttachment", cAttachment);
		mv.setViewName("competition/competitionUpdateView");
		
		return mv;
	}
	
	@RequestMapping("competitionUpdate.do")
	public String competitionUpdate(@ModelAttribute Competition c,@RequestParam(value="titleImg", required=false) MultipartFile titleImg, 
			HttpServletRequest request, @RequestParam("startDate") Date startDate, @RequestParam("endDate") Date endDate) {
		c.setcStartDate(startDate);
		c.setcDueDate(endDate);
		
		updateSaveFile(titleImg, request, c.getcId());
		
		int result = cService.updateCompetition(c);
		if(result > 0) {
			return "redirect:competitionView.do";
		}else {
			throw new CompetitionException("공모전 수정에 실패하였습니다.");
		}
	}
	
	private void updateSaveFile(MultipartFile file, HttpServletRequest request, int i) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\compeloadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originalFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." 
								+ originalFileName.substring(originalFileName.lastIndexOf(".")+1);
		String renamePath = folder + "\\" + renameFileName;
		
		int cpId = cService.getCpId(i);
		
		Cattachment ca = new Cattachment();
		ca.setCpId(cpId);
		ca.setOriginName(originalFileName);
		ca.setChangeName(renameFileName);
		ca.setFilePath(savePath);
		ca.setcId(i);
		
		cService.updateFile(ca);
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("competitionReplyList.do")
	public void competitionReplyList(HttpServletResponse response, @RequestParam("cId") int cId) throws JsonIOException, IOException {
		ArrayList<CompetitionReply> replyList = cService.competitionReplyList(cId);
		
		for(CompetitionReply cr : replyList) {
			cr.setCrContent(URLEncoder.encode(cr.getCrContent(), "utf-8"));
			cr.setUserId(URLEncoder.encode(cr.getUserId(), "utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(replyList, response.getWriter());
	}
	
	@RequestMapping("addCompetitionReple.do")
	@ResponseBody
	public String addCompetitionReply(CompetitionReply r, @SessionAttribute("loginUser") Member loginUser, HttpServletResponse response) {
		String rWriter = loginUser.getUserId();
		r.setUserId(rWriter);
		
		int result = cService.addCompetitionReply(r);
		
		if(result > 0) {
			return "success";
		}else {
			throw new CompetitionException("댓글 작성에 실패하였습니다.");
		}
	}
	
	@RequestMapping("mainCompNow.do")
	public void mainCompNow(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Competition> list = cService.mainCompNow();
		ArrayList<Cattachment> cList = cService.allCattachment();
		ArrayList<Competition> topComp = cService.topComp();
		
		for(Competition c : list) {
			c.setcTitle(URLEncoder.encode(c.getcTitle(), "utf-8"));
			c.setcAddress(URLEncoder.encode(c.getcAddress(), "utf-8"));
		}
		
		for(Competition c : topComp) {
			c.setcTitle(URLEncoder.encode(c.getcTitle(), "utf-8"));
			c.setcAddress(URLEncoder.encode(c.getcAddress(), "utf-8"));
		}
		
		Map<String, ArrayList> map = new HashMap<String, ArrayList>();
		map.put("competition", list);
		map.put("cattachment", cList);
		map.put("topComp", topComp);
		
		Gson gson = new GsonBuilder().setDateFormat("MM-dd").create();
		gson.toJson(map, response.getWriter());
	}
	
	@RequestMapping("insertCscap.do")
	public String insertCscrap(@SessionAttribute("loginUser") Member m, @RequestParam("cId") int cId) {
		String userId = m.getUserId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("cId", cId);
		
		int result = cService.insertCscrap(map);
		
		if(result > 0) {
			String page = "competitionDetail.do?cId=" + cId;
			return "redirect:"+ page;
		}else {
			throw new CompetitionException("공모전 스크랩에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("deleteCscap.do")
	public String deleteCscrap(@SessionAttribute("loginUser") Member m, @RequestParam("cId") int cId) {
		String userId = m.getUserId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("cId", cId);
		
		int result = cService.deleteCscrap(map);
		
		if(result > 0) {
			String page = "competitionDetail.do?cId=" + cId;
			return "redirect:"+ page;
		}else {
			throw new CompetitionException("공모전 스크랩취소에 실패하였습니다.");
		}
	}

}
