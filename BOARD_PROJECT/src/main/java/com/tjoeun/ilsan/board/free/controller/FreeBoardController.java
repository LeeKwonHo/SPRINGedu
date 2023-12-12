package com.tjoeun.ilsan.board.free.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tjoeun.ilsan.board.free.service.FreeBoardService;

@Controller
public class FreeBoardController {

	@Autowired
	FreeBoardService freeBoardService;

	@RequestMapping(value = "/board/free/writeView", method = RequestMethod.GET)
	public String writeView() {

		return "board/free/writeView";
	}

	@RequestMapping(value = "/board/free/write", method = RequestMethod.GET)
	public String write(@RequestParam Map map) throws Exception {

		freeBoardService.write(map);

		return "board/free/writeView";
	}

}
