package com.tjoeun.ilsan.board.free.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface FreeBoardService {
	
	public long getTotalpage(Map map);

	public void write(Map map, MultipartFile mFile) throws Exception;

	public List<Map> list(Map map);

	public void delete(Map map) throws Exception;

	public void update(Map map) throws Exception;
		
	public void updateRec(Map map) throws Exception;

}
