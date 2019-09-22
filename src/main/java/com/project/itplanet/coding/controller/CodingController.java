package com.project.itplanet.coding.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.project.itplanet.coding.model.exception.CodingException;
import com.project.itplanet.coding.model.service.CodingService;
import com.project.itplanet.coding.model.vo.Coding;
import com.project.itplanet.coding.model.vo.CodingPass;
import com.project.itplanet.coding.model.vo.CodingTop;
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
	public ModelAndView codingTestListView(ModelAndView mv, @SessionAttribute(value="loginUser", required=false) Member m) {
		//return "coding/codingTestList"; 
		ArrayList<Coding> ctList = coService.listCoding();
//		ArrayList<CodingTop> topList = coService.topList();
//		ArrayList<CodingTop> titleList = coService.titleList(topList);
		
//		System.out.println(topList);
		
		if(m != null) {
			String userId = m.getUserId();
			ArrayList<CodingPass> cpList = coService.listCPass(userId);
			mv.addObject("cpList", cpList);
		}
		
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
							@RequestParam("exData") ArrayList<String> exData, @RequestParam("exResult") ArrayList<String> exResult,
							@SessionAttribute("loginUser") Member loginUser) {
		Coding c = new Coding();
		c.setqTitle(qTitle);
		c.setqContent(qContent);
		
//		int startIndex = -1;
//		int endIndex = -1;
//		String array = "";
		
//		HashMap<Integer, String> map = new HashMap<Integer, String>();
		
//		int count = 0;
//		for(int i =0 ; i< exData.size(); i++) {
//			if(exData.get(i).charAt(0) == '[') startIndex = i;
//			if(exData.get(i).charAt(exData.get(i).length()-1) == ']') endIndex = i;
//			
//			if(startIndex != -1 && endIndex != -1) {
//				map.put(count, startIndex +"-" + endIndex);
//				startIndex = -1;
//				endIndex = -1;
//				count++;
//			}
//			System.out.println(exData.get(i));
//		}
//		for(int i =0 ; i< exResult.size(); i++) {

//			System.out.println(exResult.get(i));
//		}
//		System.out.println("map???");
//		System.out.println(map);
//		
//		for(int i = startIndex; i <= endIndex; i++) {
//			if(i == endIndex) array +=  exData.get(i);
//			else array += exData.get(i) + ", ";
//		}
//		System.out.println(array);
		System.out.println(exData);
		System.out.println(exResult);
		
		for(int i=0; i< exData.size(); i++) {
			System.out.println(i + " : " + exData.get(i));
		}
		
		
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
		
		switch(exData.size()) {
		case 2:
			c.setqExData(exData.get(1));
			c.setqExResult(exResult.get(1));
			break;
		case 4:
			c.setqExData(exData.get(1));
			c.setqExResult(exResult.get(1));
			c.setqExDataTwo(exData.get(3));
			c.setqExResultTwo(exResult.get(3));
			break;
		case 6:
			c.setqExData(exData.get(1));
			c.setqExResult(exResult.get(1));
			c.setqExDataTwo(exData.get(3));
			c.setqExResultTwo(exResult.get(3));
			c.setqExDataThree(exData.get(5));
			c.setqExResultThree(exResult.get(5));
			break;
		}
		
		c.setUserId(loginUser.getUserId());
		
		System.out.println(c);
		int result = coService.insertCoding(c); 
		
		if(result > 0) {
			// 경로 수정하기
			return "redirect:codingTestListView.do";
		}else {
			throw new CodingException("코딩테스트 글 작성에 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("compileCode.do")
	public void compileCode(HttpServletResponse response, String code, HttpServletRequest request) throws JsonIOException, IOException {
		saveFile(request, code);
		
//		String command = inputCommand("ipconfig");
//		String result = execCommand(command);
//		
//		String resultSet = URLEncoder.encode(result, "utf-8");
//		
//		Gson gson = new GsonBuilder().setDateFormat("yy-MM-dd").create();
//		gson.toJson(resultSet, response.getWriter());
		
		String command = inputCommand(request,"javac -encoding utf-8 Solution.java");
		String result = execCommand(request, command);
		String commandResult = inputCommand(request, "java Solution");
		String execResult = execCommand(request, commandResult);
		System.out.println(execResult);
		
		String resultSet = null;
		Gson gson = new GsonBuilder().setDateFormat("yy-MM-dd").create();
		
		if(execResult.equals("")) {
			resultSet = URLEncoder.encode("컴파일 도중 에러 발생", "utf-8");
		}else {
			resultSet = URLEncoder.encode(execResult, "utf-8");
		}
		gson.toJson(resultSet, response.getWriter());
	}
	
	private void saveFile(HttpServletRequest request, String file) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\codingFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		String fileName = "Solution.java";
		
		String finalFileName = folder + "\\" + fileName;
		
		OutputStreamWriter outputStreamWriter= null;
		try {
			BufferedOutputStream output = new BufferedOutputStream(new FileOutputStream(finalFileName));
			
			outputStreamWriter =new OutputStreamWriter(output, "utf-8");
			
			outputStreamWriter.write(file.toCharArray());
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				outputStreamWriter.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public String inputCommand(HttpServletRequest request, String cmd) {
		StringBuffer buffer = new StringBuffer();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\codingFiles";
		
		buffer.append("cmd.exe ");
		buffer.append("/c C: & ");
		buffer.append("cd " + savePath + " & ");
		buffer.append(cmd);
		
		System.out.println(buffer.toString());
		
		return buffer.toString();
	}
	
	public String execCommand(HttpServletRequest request, String cmd) {
		StringBuffer readBuffer = null;
		try {
			Process process = Runtime.getRuntime().exec(cmd);
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream(), "EUC-KR"));
			
			String line = null;
			readBuffer = new StringBuffer();
			
			while((line = bufferedReader.readLine()) != null) {
				readBuffer.append(line);
				readBuffer.append("\n");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return readBuffer.toString();
	}
	
	@RequestMapping("codingTestSuccess.do")
	public String codingTestSuccess(@RequestParam("qNum") int qNum, @SessionAttribute("loginUser") Member m) {
		String userId = m.getUserId();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qNum", qNum);
		map.put("userId", userId);
		
		int result = coService.codingTestSuccess(map);
		
		if(result > 0) {
			return "redirect:codingTestListView.do";
		}else {
			throw new CodingException("코딩테스트 성공에 실패하였습니다.");
		}
		
	}
	
//	public String inputCommand(String cmd) {
//		StringBuffer buffer = new StringBuffer();
//		
//		buffer.append("cmd.exe ");
//		buffer.append("/c ");
//		buffer.append(cmd);
//		
//		return buffer.toString();
//	}
//	
//	public String execCommand(String cmd) {
//		StringBuffer readBuffer = null;
//		try {
//			Process process = Runtime.getRuntime().exec(cmd);
//			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream(),"EUC-KR"));
//			
//			String line = null;
//			readBuffer = new StringBuffer();
//			
//			while((line = bufferedReader.readLine()) != null) {
//				System.out.println(line);
//				readBuffer.append(line);
//				readBuffer.append("\n");
//			}
//			
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return readBuffer.toString();
//	}
	
	@RequestMapping("mainCoding.do")
	public void mainCoding(HttpServletResponse response) throws JsonIOException, IOException {
		ArrayList<Coding> list = coService.mainCoding();
		
		for(Coding c : list) {
			c.setqTitle(URLEncoder.encode(c.getqTitle(), "utf-8"));
			c.setqContent(URLEncoder.encode(c.getqContent(), "utf-8"));
		}
		
		Gson gson = new GsonBuilder().setDateFormat("MM-dd").create();
		gson.toJson(list, response.getWriter());
	}
}
