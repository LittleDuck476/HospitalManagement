package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.DUser;

@Repository
@Mapper
public interface DUserDao {
	public List<DUser> dlogin(DUser wuser);
	public List<Map<String,Object>> selectRTableByDId(Integer did);
	public List<Map<String,Object>> seeProTypeList();
	public int addCTable(Map<String,Object> map);
	public List<Map<String,Object>> selectCTableByDid(Integer did);
	public int updCTable(Map<String,Object> map);
	public int delCTable(Integer id);
	public int addDisTable(Map<String,Object> map);
	public List<Map<String,Object>> seeMedicine();
	public int addPreTable(Map<String,Object> map);
	public List<Map<String,Object>> selectPreTableByDid(Integer did);
	public int updPreTable(Map<String,Object> map);
	public int delPreTable(Integer id);

}
