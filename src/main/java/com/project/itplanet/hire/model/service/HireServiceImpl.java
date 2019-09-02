package com.project.itplanet.hire.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.hire.model.dao.HireDAO;

@Service("hService")
public class HireServiceImpl implements HireService{
	@Autowired
	private HireDAO hDAO;
	
}
