package com.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.po.DUser;

public interface DUserService {
	boolean dlogin(DUser duser,Model model,HttpSession session);
	List<Map<String,Object>> selectRTableByDId(HttpSession session);
	List<Map<String,Object>> seeProTypeList();
	int addCTable(HttpSession session,Integer pid,Integer project,Model model);
	List<Map<String,Object>> selectCTableByDid(HttpSession session);
	int updCTable(Integer id,Integer project,Model model);
	int delCTable(Integer id);
	int addDisTable(HttpSession session,Integer pid,String disease,String advice,Model model);
	List<Map<String,Object>> seeMedicine();
	int addPreTable(HttpSession session,Integer pid,int medicine,int amount,Model model);
	List<Map<String,Object>> selectPreTableByDid(HttpSession session);
	int updPreTable(Integer id,int medicine,int amount,Model model);
	int delPreTable(Integer id);

}
