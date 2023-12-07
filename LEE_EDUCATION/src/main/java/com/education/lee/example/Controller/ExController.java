package com.education.lee.example.Controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.education.lee.example.Service.ExService;

@Controller
public class ExController {

	private static final Logger logger = LoggerFactory.getLogger(ExController.class);

	@Autowired
	ExService exservice;

	@RequestMapping(value = "/Ex", method = RequestMethod.GET)
	public String ExList(@RequestParam("ExID") String Exid, Model model, HttpServletRequest req) {

		logger.debug("##**" + Exid + "**##");

		exservice.getExService();// 서비스 통신 확인

		model.addAttribute("Exid", Exid);// 모델에 get받기

		return "ExViews/ExList";// 이동할 JSP의 이름

	}

}
