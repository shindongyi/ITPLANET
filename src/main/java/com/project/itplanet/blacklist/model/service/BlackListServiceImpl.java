package com.project.itplanet.blacklist.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.blacklist.model.dao.BlackListDAO;

@Service("bService")
public class BlackListServiceImpl implements BlackListService{
	@Autowired
	private BlackListDAO bDAO;
}
