package com.project.itplanet.coding.model.service;

import java.util.ArrayList;

import com.project.itplanet.coding.model.vo.Coding;

public interface CodingService {

	int insertCoding(Coding c);

	ArrayList<Coding> listCoding();

}
