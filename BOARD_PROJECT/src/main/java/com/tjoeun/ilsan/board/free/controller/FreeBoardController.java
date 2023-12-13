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
	//서비스 인터페이스로 다형성 불러오기
	@Autowired
	FreeBoardService freeBoardService;

	//게시글 리스트 이동
	@RequestMapping(value = "/board/free/listView", method = RequestMethod.GET)
	public String listView(Model model, @RequestParam Map map) throws Exception {

		model.addAttribute("list", freeBoardService.list(map));

		return "/board/free/listView";
	}

	//게시글 상세정보 이동
	@RequestMapping(value = "/board/free/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam Map map) throws Exception {

		model.addAttribute("free", freeBoardService.list(map).get(0));

		return "/board/free/detail";
	}
	
	//게시글 작성화면 이동
	@RequestMapping(value = "/board/free/writeView", method = RequestMethod.GET)
	public String writeView() {

		return "board/free/writeView";
	}
	
	//SQL작성시 TX를 이용하기 위한 이동
	@RequestMapping(value = "/board/free/write", method = RequestMethod.POST)
	public String write(@RequestParam Map map) throws Exception {

		freeBoardService.write(map);
		//TX후 리다이렉트
		return "redirect:/";
	}

}
