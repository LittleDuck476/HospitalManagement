package com.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.po.DUser;
import com.po.Medicine;
import com.po.PUser;
import com.po.Project;
import com.po.WUser;

@Repository
@Mapper
public interface AdminDao {
	public List<WUser> alogin(WUser wuser);
	public List<Map<String,Object>> selectAllP();
	public List<PUser> booleanadd(PUser puser);
	public PUser selectPById(Integer id);
	public int addPUser(PUser puser);
	public List<PUser> booleanupd(PUser puser);
	public int updPUser(PUser puser);
	public int delPUser(Integer id);
	
	public List<Map<String,Object>> selectAllD();
	public List<DUser> booleanaddD(DUser duser);
	public int addDUser(DUser duser);
	public DUser selectDById(Integer id);
	public List<DUser> booleanupdD(DUser duser);
	public int updDUser(DUser duser);
	public int delDUser(Integer id);
	
	public List<Map<String,Object>> selectAllW();
	public List<WUser> booleanaddW(WUser wuser);
	public int addWUser(WUser wuser);
	public WUser selectWById(Integer id);
	public List<WUser> booleanupdW(WUser wuser);
	public int updWUser(WUser wuser);
	public int delWUser(Integer id);
	
	public List<Map<String,Object>> selectAllPro();
	public List<Project> booleanaddPro(Project project);
	public int addPro(Project project);
	public Project selectProById(Integer id);
	public List<Project> booleanupdPro(Project project);
	public int updPro(Project project);
	public int delPro(Integer id);
	
	public List<Map<String,Object>> selectAllM();
	public List<Medicine> booleanaddM(Medicine medicine);
	public int addM(Medicine medicine);
	public Medicine selectMById(Integer id);
	public List<Medicine> booleanupdM(Medicine medicine);
	public int updM(Medicine medicine);
	public int delM(Integer id);
	
	public List<Map<String,Object>> selectRole(Integer role);

}
