package com.project.itplanet.coding.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.coding.model.dao.CodingDAO;

@Service("coService")
public class CodingServiceImpl implements CodingService{
	@Autowired
	private CodingDAO coDAO;
}
