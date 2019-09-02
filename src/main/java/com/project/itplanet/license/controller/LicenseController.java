package com.project.itplanet.license.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.project.itplanet.license.model.service.LicenseService;

@Controller
public class LicenseController {
	@Autowired
	private LicenseService lService;
}
