package com.tjoeun.ilsan.board.free.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeun.ilsan.board.free.service.FreeBoardService;
import com.tjoeun.ilsan.common.file.service.CommonFileService;

@Controller
public class FreeBoardController {
	// 서비스 인터페이스로 다형성 불러오기
	@Autowired
	FreeBoardService freeBoardService;
	@Autowired
	CommonFileService commonFileService;

	// 게시글 리스트 이동
	@RequestMapping(value = "/board/free/listView", method = { RequestMethod.GET, RequestMethod.POST })
	public String listView(Model model, @RequestParam Map map) throws Exception {

		model.addAttribute("list", freeBoardService.list(map));

		model.addAttribute("totalpage", freeBoardService.getTotalpage(map));

		model.addAttribute("rp", map);

		return "/board/free/listView";
	}

	// 게시글 상세정보 이동
	@RequestMapping(value = "/board/free/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam Map map) throws Exception {
		
		Map fMap = new HashMap();
		fMap.put("f_seq", map.get("seq"));

		model.addAttribute("free", freeBoardService.list(map).get(0));

		if (commonFileService.getFileList(fMap).size() != 0) {
			model.addAttribute("file", commonFileService.getFileList(fMap).get(0));
		}

		return "/board/free/detail";
	}

	// 게시글 작성화면 이동
	@RequestMapping(value = "/board/free/writeView", method = RequestMethod.GET)
	public String writeView() {

		return "board/free/writeView";
	}

	// SQL작성시 TX를 이용하기 위한 이동
	@RequestMapping(value = "/board/free/write", method = RequestMethod.POST)
	public String write(@RequestParam Map map, @RequestParam(value = "file") MultipartFile mFile) throws Exception {

		freeBoardService.write(map, mFile);
		// TX후 리다이렉트
		return "redirect:/";
	}

	@RequestMapping(value = "/board/free/delete", method = RequestMethod.POST)
	public String delete(@RequestParam Map map) throws Exception {

		freeBoardService.delete(map);
		// TX후 리다이렉트
		return "redirect:/board/free/listView";
	}

	@RequestMapping(value = "/board/free/update", method = RequestMethod.POST)
	public String update(@RequestParam Map map) throws Exception {

		freeBoardService.update(map);
		// TX후 리다이렉트
		return "redirect:/board/free/listView";
	}

	@RequestMapping(value = "/board/free/updateRec", method = RequestMethod.POST)
	@ResponseBody
	public Map updateRec(@RequestParam Map map) {

		Map resultMap = new HashMap();

		try {
			freeBoardService.updateRec(map);
			resultMap.put("result", "success");
			resultMap.put("data", freeBoardService.list(map).get(0));

		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("result", "fail");
		}

		return resultMap;
	}

	@RequestMapping(value = "/board/free/updateView", method = RequestMethod.GET)
	public String updateView(Model model, @RequestParam Map map) throws Exception {

		model.addAttribute("free", freeBoardService.list(map).get(0));

		return "/board/free/updateView";
	}

}
