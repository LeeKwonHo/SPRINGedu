package com.tjoeun.ilsan.board.free.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeun.ilsan.board.free.sql.FreeBoardMapper;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao {

	@Autowired
	SqlSession sqlSession;

	@Override
	public int write(Map map) {
		FreeBoardMapper mapper = sqlSession.getMapper(FreeBoardMapper.class);
		return mapper.write(map);
	}

	@Override
	public List<Map> select(Map map) {
		FreeBoardMapper mapper = sqlSession.getMapper(FreeBoardMapper.class);
		return mapper.select(map);
	}

}
