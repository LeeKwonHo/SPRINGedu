package com.tjoeun.ilsan.board.free.sql;

import java.util.List;
import java.util.Map;

public interface FreeBoardMapper {

	public int write(Map map);
	
	public List<Map> select(Map map);
	
	public int delete(Map map);

}
