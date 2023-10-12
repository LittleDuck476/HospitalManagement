package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.po.DUser;
import com.po.Medicine;
import com.po.PUser;
import com.po.Project;
import com.po.WUser;

public interface AdminService {
	boolean alogin(WUser wuser,Model model);
	List<Map<String,Object>> selectAllP();
	boolean booleanadd(PUser puser,Model model);
	PUser selectPById(Integer id);
	int addPUser(PUser puser);
	boolean booleanupd(PUser puser,Model model);
	int updPUser(PUser puser);
	int delPUser(Integer id);
	
	List<Map<String,Object>> selectAllD();
	boolean booleanaddD(DUser duser,Model model);
	int addDUser(DUser duser);
	DUser selectDById(Integer id);
	boolean booleanupdD(DUser duser,Model model);
	int updDUser(DUser duser);
	int delDUser(Integer id);
	
	List<Map<String,Object>> selectAllW();
	boolean booleanaddW(WUser wuser,Model model);
	int addWUser(WUser wuser);
	WUser selectWById(Integer id);
	boolean booleanupdW(WUser wuser,Model model);
	int updWUser(WUser wuser);
	int delWUser(Integer id);
	
	List<Map<String,Object>> selectAllPro();
	boolean booleanaddPro(Project project,Model model);
	int addPro(Project project);
	Project selectProById(Integer id);
	boolean booleanupdPro(Project project,Model model);
	int updPro(Project project);
	int delPro(Integer id);
	
	List<Map<String,Object>> selectAllM();
	boolean booleanaddM(Medicine medicine,Model model);
	int addM(Medicine medicine);
	Medicine selectMById(Integer id);
	boolean booleanupdM(Medicine medicine,Model model);
	int updM(Medicine medicine);
	int delM(Integer id);
	
	List<Map<String,Object>> selectRole(Integer role);

}
