package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.AdminDao;
import com.po.DUser;
import com.po.Medicine;
import com.po.PUser;
import com.po.Project;
import com.po.WUser;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;

	@Override
	public boolean alogin(WUser wuser, Model model) {
		List<WUser> list = adminDao.alogin(wuser);
		if(list.size() > 0 && list.get(0) != null) {
			return true;
		}else {
			model.addAttribute("msg", "用户名或密码错误！");
			return false;
		}
	}

	@Override
	public List<Map<String, Object>> selectAllP() {
		return adminDao.selectAllP();
	}

	@Override
	public boolean booleanadd(PUser puser,Model model) {
		List<PUser> list = adminDao.booleanadd(puser);
		if(list.size() == 0) {
			model.addAttribute("msg", "添加成功");
			return true;
		}else {
			model.addAttribute("msg", "此电话已注册！");
			return false;
		}
	}

	@Override
	public int addPUser(PUser puser) {
		return adminDao.addPUser(puser);
	}

	@Override
	public int updPUser(PUser puser) {
		return adminDao.updPUser(puser);
	}

	@Override
	public int delPUser(Integer id) {
		return adminDao.delPUser(id);
	}

	@Override
	public PUser selectPById(Integer id) {
		return adminDao.selectPById(id);
	}

	@Override
	public boolean booleanupd(PUser puser, Model model) {
		List<PUser> list = adminDao.booleanupd(puser);
		if(list.size() == 0) {
			model.addAttribute("msg", "修改成功");
			return true;
		}else {
			model.addAttribute("msg", "此电话已被使用！");
			return false;
		}
	}

	@Override
	public List<Map<String, Object>> selectAllD() {
		return adminDao.selectAllD();
	}

	@Override
	public boolean booleanaddD(DUser duser, Model model) {
		List<DUser> list = adminDao.booleanaddD(duser);
		if(list.size() == 0) {
			model.addAttribute("msg", "添加成功");
			return true;
		}else {
			model.addAttribute("msg", "此员工号已被使用！");
			return false;
		}
	}

	@Override
	public int addDUser(DUser duser) {
		return adminDao.addDUser(duser);
	}

	@Override
	public DUser selectDById(Integer id) {
		return adminDao.selectDById(id);
	}

	@Override
	public boolean booleanupdD(DUser duser, Model model) {
		List<DUser> list = adminDao.booleanupdD(duser);
		if(list.size() == 0) {
			model.addAttribute("msg", "修改成功");
			return true;
		}else {
			model.addAttribute("msg", "此员工代号已被使用！");
			return false;
		}
	}

	@Override
	public int updDUser(DUser duser) {
		return adminDao.updDUser(duser);
	}

	@Override
	public int delDUser(Integer id) {
		return adminDao.delDUser(id);
	}

	@Override
	public List<Map<String, Object>> selectAllW() {
		return adminDao.selectAllW();
	}

	@Override
	public boolean booleanaddW(WUser wuser, Model model) {
		List<WUser> list = adminDao.booleanaddW(wuser);
		if(list.size() == 0) {
			model.addAttribute("msg", "添加成功");
			return true;
		}else {
			model.addAttribute("msg", "此员工代号已被使用！");
			return false;
		}
	}

	@Override
	public int addWUser(WUser wuser) {
		return adminDao.addWUser(wuser);
	}

	@Override
	public WUser selectWById(Integer id) {
		return adminDao.selectWById(id);
	}

	@Override
	public boolean booleanupdW(WUser wuser, Model model) {
		List<WUser> list = adminDao.booleanupdW(wuser);
		if(list.size() == 0) {
			model.addAttribute("msg", "修改成功");
			return true;
		}else {
			model.addAttribute("msg", "此员工代号已被使用！");
			return false;
		}
	}

	@Override
	public int updWUser(WUser wuser) {
		return adminDao.updWUser(wuser);
	}

	@Override
	public int delWUser(Integer id) {
		return adminDao.delWUser(id);
	}

	@Override
	public List<Map<String, Object>> selectAllPro() {
		return adminDao.selectAllPro();
	}

	@Override
	public boolean booleanaddPro(Project project, Model model) {
		List<Project> list = adminDao.booleanaddPro(project);
		if(list.size() == 0) {
			model.addAttribute("msg", "添加成功");
			return true;
		}else {
			model.addAttribute("msg", "此项目已存在！");
			return false;
		}
	}

	@Override
	public int addPro(Project project) {
		return adminDao.addPro(project);
	}

	@Override
	public Project selectProById(Integer id) {
		return adminDao.selectProById(id);
	}

	@Override
	public boolean booleanupdPro(Project project, Model model) {
		List<Project> list = adminDao.booleanupdPro(project);
		if(list.size() == 0) {
			model.addAttribute("msg", "修改成功");
			return true;
		}else {
			model.addAttribute("msg", "此项目已存在！");
			return false;
		}
	}

	@Override
	public int updPro(Project project) {
		return adminDao.updPro(project);
	}

	@Override
	public int delPro(Integer id) {
		return adminDao.delPro(id);
	}

	@Override
	public List<Map<String, Object>> selectAllM() {
		return adminDao.selectAllM();
	}

	@Override
	public boolean booleanaddM(Medicine medicine, Model model) {
		List<Medicine> list = adminDao.booleanaddM(medicine);
		if(list.size() == 0) {
			model.addAttribute("msg", "添加成功");
			return true;
		}else {
			model.addAttribute("msg", "此药品已存在！");
			return false;
		}
	}

	@Override
	public int addM(Medicine medicine) {
		return adminDao.addM(medicine);
	}

	@Override
	public Medicine selectMById(Integer id) {
		return adminDao.selectMById(id);
	}

	@Override
	public boolean booleanupdM(Medicine medicine, Model model) {
		List<Medicine> list = adminDao.booleanupdM(medicine);
		if(list.size() == 0) {
			model.addAttribute("msg", "修改成功");
			return true;
		}else {
			model.addAttribute("msg", "此药品已存在！");
			return false;
		}
	}

	@Override
	public int updM(Medicine medicine) {
		return adminDao.updM(medicine);
	}

	@Override
	public int delM(Integer id) {
		return adminDao.delM(id);
	}

	@Override
	public List<Map<String, Object>> selectRole(Integer role) {
		if(role==0) {
			return adminDao.selectAllW();
		}else {
			return adminDao.selectRole(role);
		}
	}

}
