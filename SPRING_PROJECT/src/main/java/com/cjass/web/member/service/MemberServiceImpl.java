package com.cjass.web.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cjass.web.member.dao.MemberDao;
import com.cjass.web.util.SHA256;

@Service
@Transactional(readOnly = true)
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;

	int result = 0;

	public List getAllMember(Map map) {
		return memberDao.getAllMember(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int updateMember(Map map) throws Exception {
		map.put("password", SHA256.encryptSHA256((String) map.get("pw")));
		return memberDao.updateMember(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int deleteMember(Map map) throws Exception {
		return memberDao.deleteMember(map);
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
	public int insertMember(Map map) throws Exception {
		result = memberDao.insertMember(map);
		System.out.println("LAST_INSERT_ID SEQ:" + map.get("seq"));
		if (0 == result) {
			throw new Exception();
		}
		return result;
	}

}
