package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.WUser;

@Repository
@Mapper
public interface CheckDao {
	public List<WUser> clogin(WUser wuser);
	public List<Map<String,Object>> seeCPaidByProid(Integer id);
	public int updCOutcome(Integer id);

}
