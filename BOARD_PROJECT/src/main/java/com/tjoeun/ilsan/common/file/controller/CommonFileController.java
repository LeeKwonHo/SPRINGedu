package com.tjoeun.ilsan.common.file.controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjoeun.ilsan.common.file.service.CommonFileService;

@Controller
public class CommonFileController {

	@Autowired
	CommonFileService commonFileService;

	@RequestMapping(value = "/common/file/download", method = RequestMethod.GET)
	@ResponseBody
	public void download(@RequestParam Map map, HttpServletResponse res) throws Exception {
		commonFileService.download(map, res);
	}

}
