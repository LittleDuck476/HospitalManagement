package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.PUser;

@Repository
@Mapper
public interface PUserDao {
	public List<PUser> register(PUser puser);
	public int insertp(PUser puser);
	public List<PUser> login(PUser puser);
	public List<Map<String,Object>> selectdisByPid(Integer pid); 
	public List<Map<String,Object>> selectregByid(Integer pid);
	public List<Map<String,Object>> selectcheckByid(Integer pid);

}
