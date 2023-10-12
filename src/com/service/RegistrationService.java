package com.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.ui.Model;

import com.po.DUser;
import com.po.PUser;
import com.po.WUser;

public interface RegistrationService {
	boolean rlogin(WUser wuser,Model model,HttpSession session);
	List<PUser> seeAllPatient();
	List<DUser> seeAllDoctor();
	List<DUser> seeTypeDoctor(@Param("type")int type);
	List<DUser> search(String mykey);
	int insertRTable(Map<String,Object> map,Model model);
	List<Map<String,Object>> selectRTable(); 
	List<Map<String,Object>> seeAllCTable();
	int updCFee(Integer id,Model model);
	List<Map<String,Object>> seeAllPreTable();
	int updPreFee(Integer id,Model model);

}
