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

		// 아직 회원정보가 없기때문에 리터럴로 Request map에 넣기
		map.put("writer", "hongkd");
		int result = freeBoardDao.write(map);

		if (1 != result) {
			throw new Exception();
		}
	}

	@Override
	public List<Map> list(Map map) {

		Object page = map.get("page");

		if (page == null || "".equals(page)) {
			map.put("page", 1);
			map.put("limit", 10);
			map.put("offset", 0);

		} else {

			int ipage = Integer.parseInt((String) page);

			map.put("limit", 10);
			map.put("offset", 10 * (ipage - 1));

		}

		return freeBoardDao.select(map);
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = { Exception.class })
	public void delete(Map map) throws Exception {

		int result = freeBoardDao.delete(map);

		if (1 != result) {
			throw new Exception();
		}
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = { Exception.class })
	public void update(Map map) throws Exception {

		int result = freeBoardDao.update(map);

		if (1 != result) {
			throw new Exception();
		}
	}

	@Override
	@Transactional(readOnly = false, propagation = Propagation.REQUIRES_NEW, rollbackFor = { Exception.class })
	public void updateRec(Map map) throws Exception {

		int result = freeBoardDao.updateRec(map);

		if (1 != result) {
			throw new Exception();
		}
	}

	@Override
	public long getTotalpage(Map map) {

		Long totalCnt = (Long) freeBoardDao.selectTotalCnt(map).get("totalCnt");

		long page = totalCnt / 10;

		if (totalCnt % 10 > 0) {
			page++;
		}

		return page;
	}
}
