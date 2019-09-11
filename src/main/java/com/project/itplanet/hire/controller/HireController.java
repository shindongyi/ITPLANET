package com.project.itplanet.hire.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.project.itplanet.hire.model.service.HireService;

@Controller
public class HireController {
	@Autowired
	private HireService hService;
	
	@RequestMapping(value="hList.do")
	public String hireListView() {
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
	            sb.append(new String(URLDecoder.decode(jsonData, "UTF-8")));
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

	
	public ArrayList<HashMap<String, String>> method(String data){
		
		HashMap<String, String> map = null;
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();

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
				map = new HashMap<String, String>();
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
				
				 
				
				map.put("title", (String)position.get("title"));
				map.put("industry", (String)industry.get("name"));
				map.put("location", (String)location.get("name"));
				map.put("name", (String)detail.get("name"));
				map.put("href", (String)detail.get("href"));
				map.put("job-type", (String)job_type.get("name"));
				map.put("job_category", (String)job_category.get("name"));
				map.put("required", (String)required.get("name") );
				map.put("experience", (String)experience.get("name"));
				map.put("salary", (String)salary.get("name"));
				map.put("expiration_date", (String)jsonObject1.get("expiration-timestamp"));
				
				list.add(map);
			}
			

		} catch (Exception e) {

	}

	return list;

	}
	
	@RequestMapping(value="hJsonList.do")
	public void outputJsonList(ModelAndView modelAndView , HttpServletResponse response, @RequestParam("resultURL") String resultURL) throws JsonIOException, IOException {
		
		String url = "https://oapi.saramin.co.kr/job-search?access-key=XezjUx3DKk1B2Sf6Rqs3H0ReMjILTLin4778M8jV4CieFkbVa&ind_cd=3&start=1&count=50";
		// http://oapi.saramin.co.kr/job-search?access-key=XezjUx3DKk1B2Sf6Rqs3H0ReMjILTLin4778M8jV4CieFkbVa&keyword=%EA%B0%9C%EB%B0%9C%EC%9E%90&start=1&count=50
		
		String result = httpConnection(resultURL);
		ArrayList<HashMap<String, String>> json = method(result);
		System.out.println(json);
		
		for(HashMap<String, String> map : json) {
			map.put("jobType", URLEncoder.encode(map.get("job-type"),"UTF-8"));
			map.put("name",URLEncoder.encode(map.get("name"),"UTF-8"));
			map.put("industry", URLEncoder.encode(map.get("industry"),"UTF-8"));
			map.put("location", URLEncoder.encode(map.get("location"),"UTF-8"));
			map.put("href", URLEncoder.encode(map.get("href"),"UTF-8"));
			map.put("title", URLEncoder.encode(map.get("title"),"UTF-8"));
			map.put("experience", URLEncoder.encode(map.get("experience"),"UTF-8"));
			if(map.get("salary") != null) {
				map.put("salary", URLEncoder.encode(map.get("salary"),"UTF-8"));
			}
			map.put("job_category", URLEncoder.encode(map.get("job_category"),"UTF-8"));
			map.put("required", URLEncoder.encode(map.get("required"),"UTF-8"));
			if(map.get("expiation_date") != null) {
			map.put("expiration_date", URLEncoder.encode(map.get("expiration_date"),"UTF-8"));
			}
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(json,response.getWriter());
		
		
		
		
	}



	
}


