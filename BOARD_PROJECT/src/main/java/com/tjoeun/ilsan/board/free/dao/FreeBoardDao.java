package com.tjoeun.ilsan.board.free.dao;

import java.util.List;
import java.util.Map;

public interface FreeBoardDao {

	public int write(Map map);
	
	public List<Map> select(Map map);
	
	public int delete(Map map);
}