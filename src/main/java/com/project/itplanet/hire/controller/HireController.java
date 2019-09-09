package com.project.itplanet.hire.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.itplanet.hire.model.service.HireService;

@Controller
public class HireController {
	@Autowired
	private HireService hService;
	
	@RequestMapping(value="hList.do")
	public String hireListView() {
		
		String url = "https://oapi.saramin.co.kr/job-search?access-key=XezjUx3DKk1B2Sf6Rqs3H0ReMjILTLin4778M8jV4CieFkbVa&ind_cd=3&start=1&count=50";
		// http://oapi.saramin.co.kr/job-search?access-key=XezjUx3DKk1B2Sf6Rqs3H0ReMjILTLin4778M8jV4CieFkbVa&keyword=%EA%B0%9C%EB%B0%9C%EC%9E%90&start=1&count=50
		String result = httpConnection(url);
		String result2 = method(result);
		System.out.print("getUrl : ");
		System.out.println(result);
		System.out.println(result2);
		
		
		return "hire/hireList";
	}
	
	@RequestMapping(value="hDetail.do")
	public String hireDetailView() {
		
		return "hire/hireDetail";
	}
	
	public String httpConnection(String targetUrl) {
	    URL url = null;
	    HttpURLConnection conn = null;
	    String jsonData = "";
	    BufferedReader br = null;
	    StringBuffer sb = null;
	    String returnText = "";
	 
	    try {
	        url = new URL(targetUrl);
	 
	        conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestProperty("Accept", "application/json");
	        conn.setRequestMethod("GET");
	        conn.connect();
	 
	        br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	 
	        sb = new StringBuffer();
	 
	        while ((jsonData = br.readLine()) != null) {
	            sb.append(jsonData);
	        }
	 
	        returnText = sb.toString();
	 
	    } catch (IOException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (br != null) br.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	 
	    return returnText;
	}

	
	public String method(String data){
		
		String result = "";

		JSONObject jsonObject =  null;
		JSONObject jobs = null;
		JSONArray jsonArray = null;
		
		try {

			JSONParser jsonParser = new JSONParser();

			jsonObject = (JSONObject) jsonParser.parse(data);
			
			jobs = (JSONObject) jsonObject.get("jobs");
			System.out.println("count :" + jobs.get("count").toString());
			System.out.println("total :" + jobs.get("total").toString());
			System.out.println("start :" + jobs.get("start").toString());
			jsonArray = (JSONArray) jobs.get("job");
			
			for(int i = 0; i < jsonArray.size(); i++ ){
				JSONObject jsonObject1 = (JSONObject) jsonArray.get(i);

				
				JSONObject position = (JSONObject)jsonObject1.get("position");
				JSONObject industry = (JSONObject)position.get("industry");
				JSONObject location = (JSONObject)position.get("location");
				JSONObject job_type = (JSONObject)position.get("job-type");
				JSONObject job_category = (JSONObject)position.get("job-category");
				JSONObject required = (JSONObject)position.get("required-education-level");
				JSONObject experience = (JSONObject)position.get("experience-level");
				JSONObject salary = (JSONObject)jsonObject1.get("salary");
				JSONObject company = (JSONObject)jsonObject1.get("company");
				JSONObject detail = (JSONObject)company.get("detail");
				 
				
				System.out.println("title : " + position.get("title"));
				System.out.println("industry : " + industry.get("name"));
				System.out.println("location : " + location.get("name"));
				System.out.println("name : " + detail.get("name"));
				System.out.println("href : " + detail.get("href"));
				System.out.println("job-type : " + job_type.get("name"));
				System.out.println("job_category : " + job_category.get("name"));
				System.out.println("required : " + required.get("name"));
				System.out.println("experience : " + experience.get("name"));
				System.out.println("salary : " + salary.get("name"));
			}
			
			result = "ok";

		} catch (Exception e) {

			result = "fail";
	}

	return result;

	}



	
}


