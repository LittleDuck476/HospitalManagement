package com.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.RegistrationDao;
import com.po.DUser;
import com.po.PUser;
import com.po.WUser;

@Service
@Transactional
public class RegistrationServiceImpl implements RegistrationService {
	@Autowired
	private RegistrationDao registrationDao;

	@Override
	public boolean rlogin(WUser wuser, Model model, HttpSession session) {
		List<WUser> list = registrationDao.rlogin(wuser);
		if(list.size() > 0 && list.get(0) != null) {
			session.setAttribute("wuser", wuser);
			return true;
		}else {
			model.addAttribute("msg", "用户名或密码错误！");
			return false;
		}
	}

	@Override
	public List<PUser> seeAllPatient() {
		return registrationDao.seeAllPatient();
	}

	@Override
	public List<DUser> seeAllDoctor() {
		return registrationDao.seeAllDoctor();
	}

	@Override
	public List<DUser> seeTypeDoctor(int type) {
		return registrationDao.seeTypeDoctor(type);
	}

	@Override
	public List<DUser> search(String mykey) {
		return registrationDao.search(mykey);
	}

	@Override
	public int insertRTable(Map<String, Object> map,Model model) {
		model.addAttribute("msg", "挂号成功");
		return registrationDao.insertRTable(map);
	}

	@Override
	public List<Map<String, Object>> selectRTable() {
		return registrationDao.selectRTable();
	}

	@Override
	public List<Map<String, Object>> seeAllCTable() {
		return registrationDao.seeAllCTable();
	}

	@Override
	public int updCFee(Integer id,Model model) {
		model.addAttribute("msg", "缴费成功");
		return registrationDao.updCFee(id);
	}

	@Override
	public List<Map<String, Object>> seeAllPreTable() {
		return registrationDao.seeAllPreTable();
	}

	@Override
	public int updPreFee(Integer id,Model model) {
		model.addAttribute("msg", "缴费成功");
		return registrationDao.updPreFee(id);
	}

}
