package com.tjoeun.ilsan.board.free.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tjoeun.ilsan.board.free.dao.FreeBoardDao;

@Service
@EnableTransactionManagement
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired
	FreeBoardDao freeBoardDao;

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = { Exception.class })
	public void write(Map map) throws Exception {
		map.put("writer", "hongkd");
		int result = freeBoardDao.write(map);
		if (1 != result) {
			throw new Exception();
		}
	}

	@Override
	public List<Map> list(Map map) {
		return freeBoardDao.select(map);
	}

}
