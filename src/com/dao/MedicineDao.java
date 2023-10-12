package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.WUser;

@Repository
@Mapper
public interface MedicineDao {
	public List<WUser> mlogin(WUser wuser);
	public List<Map<String,Object>> seePrePaid();
	public int updPreOutcome(Integer id);
	public int updMedstore(Map<String,Object> map);

}
