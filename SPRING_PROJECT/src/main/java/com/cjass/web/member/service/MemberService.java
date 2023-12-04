package com.cjass.web.member.service;

import java.util.List;
import java.util.Map;

public interface MemberService {
	public List getAllMember(Map map);

	public int insertMember(Map map) throws Exception;

	public int updateMember(Map map) throws Exception;

	public int deleteMember(Map map) throws Exception;
}
