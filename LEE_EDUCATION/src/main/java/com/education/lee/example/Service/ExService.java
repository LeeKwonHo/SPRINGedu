package com.education.lee.example.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.education.lee.example.Controller.ExController;

@Service
public class ExService {

	private static final Logger logger = LoggerFactory.getLogger(ExController.class);

	public void getExService() {

		logger.debug("Service Debug");

	}

}
