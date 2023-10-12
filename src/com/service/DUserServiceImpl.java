package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.DUserDao;
import com.po.DUser;
import com.util.MyUtil;

@Service
@Transactional
public class DUserServiceImpl implements DUserService{
	@Autowired
	private DUserDao duserDao;

	@Override
	public boolean dlogin(DUser duser, Model model, HttpSession session) {
		List<DUser> list = duserDao.dlogin(duser);
		if(list.size() > 0 && list.get(0) != null) {
			session.setAttribute("duser", list.get(0));
			return true;
		}else {
			model.addAttribute("msg", "用户名或密码错误！");
			return false;
		}
	}

	@Override
	public List<Map<String, Object>> selectRTableByDId(HttpSession session) {
		return duserDao.selectRTableByDId(MyUtil.getDUserId(session));
	}

	@Override
	public List<Map<String, Object>> seeProTypeList() {
		return duserDao.seeProTypeList();
	}

	@Override
	public int addCTable(HttpSession session, Integer pid, Integer project,Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pid", pid);
		map.put("did", MyUtil.getDUserId(session));
		map.put("proid", project);
		model.addAttribute("msg", "检查化验单开具成功");
		return duserDao.addCTable(map);
	}

	@Override
	public List<Map<String, Object>> selectCTableByDid(HttpSession session) {
		return duserDao.selectCTableByDid(MyUtil.getDUserId(session));
	}

	@Override
	public int updCTable(Integer id, Integer project,Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("proid", project);
		model.addAttribute("msg", "修改检查化验单成功");
		return duserDao.updCTable(map);
	}

	@Override
	public int delCTable(Integer id) {
		return duserDao.delCTable(id);
	}

	@Override
	public int addDisTable(HttpSession session, Integer pid, String disease, String advice,Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pid", pid);
		map.put("did", MyUtil.getDUserId(session));
		map.put("disease", disease);
		map.put("advice", advice);
		model.addAttribute("msg", "诊断结果开具成功");
		return duserDao.addDisTable(map);
	}

	@Override
	public List<Map<String, Object>> seeMedicine() {
		return duserDao.seeMedicine();
	}

	@Override
	public int addPreTable(HttpSession session, Integer pid, int medicine, int amount,Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("pid", pid);
		map.put("did", MyUtil.getDUserId(session));
		map.put("medid", medicine);
		map.put("amount", amount);
		model.addAttribute("msg", "处方开具成功");
		return duserDao.addPreTable(map);
	}

	@Override
	public List<Map<String, Object>> selectPreTableByDid(HttpSession session) {
		return duserDao.selectPreTableByDid(MyUtil.getDUserId(session));
	}

	@Override
	public int updPreTable(Integer id, int medicine, int amount,Model model) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("medid", medicine);
		map.put("amount", amount);
		map.put("id", id);
		model.addAttribute("msg", "修改处方成功");
		return duserDao.updPreTable(map);
	}

	@Override
	public int delPreTable(Integer id) {
		return duserDao.delPreTable(id);
	}

}
