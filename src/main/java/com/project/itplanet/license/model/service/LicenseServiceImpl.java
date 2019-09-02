package com.project.itplanet.license.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.itplanet.license.model.dao.LicenseDAO;

@Service("lService")
public class LicenseServiceImpl implements LicenseService{
	@Autowired
	private LicenseDAO lDAO;
}
