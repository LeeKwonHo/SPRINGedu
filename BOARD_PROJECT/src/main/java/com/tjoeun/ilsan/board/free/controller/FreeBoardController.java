package com.tjoeun.ilsan.board.free.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tjoeun.ilsan.board.free.service.FreeBoardService;

@Controller
public class FreeBoardController {

	@Autowired
	FreeBoardService freeBoardService;

	@RequestMapping(value = "/board/free/listView", method = RequestMethod.GET)
	public String listView(Model model, @RequestParam Map map) throws Exception {

		model.addAttribute("list", freeBoardService.list(map));

		return "/board/free/listView";
	}
	
	@RequestMapping(value = "/board/free/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam Map map) throws Exception {
		
		model.addAttribute("free", freeBoardService.list(map).get(0));
		
		return "/board/free/detail";
	}

	@RequestMapping(value = "/board/free/writeView", method = RequestMethod.GET)
	public String writeView() {

		return "board/free/writeView";
	}

	@RequestMapping(value = "/board/free/write", method = RequestMethod.POST)
	public String write(@RequestParam Map map) throws Exception {

		freeBoardService.write(map);

		return "redirect:/";
	}

}
