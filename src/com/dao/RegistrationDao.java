package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.po.DUser;
import com.po.PUser;
import com.po.WUser;

@Repository
@Mapper
public interface RegistrationDao {
	public List<WUser> rlogin(WUser wuser);
	public List<PUser> seeAllPatient();
	public List<DUser> seeAllDoctor();
	public List<DUser> seeTypeDoctor(@Param("type")int type);
	public List<DUser> search(@Param("mykey")String mykey);
	public int insertRTable(Map<String,Object> map);
	public List<Map<String,Object>> selectRTable(); 
	public List<Map<String,Object>> seeAllCTable();
	public int updCFee(Integer id);
	public List<Map<String,Object>> seeAllPreTable();
	public int updPreFee(Integer id);

}
