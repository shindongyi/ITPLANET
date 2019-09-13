package com.project.itplanet.competition.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.itplanet.common.Pagination;
import com.project.itplanet.common.model.vo.PageInfo;
import com.project.itplanet.competition.model.exception.CompetitionException;
import com.project.itplanet.competition.model.service.CompetitionService;
import com.project.itplanet.competition.model.vo.Cattachment;
import com.project.itplanet.competition.model.vo.Competition;
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
		
		mv.addObject("competition", competition);
		mv.addObject("cAttachment", cAttachment);
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

}
