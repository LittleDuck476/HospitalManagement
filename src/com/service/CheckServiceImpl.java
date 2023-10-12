package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.CheckDao;
import com.po.WUser;

@Service
@Transactional
public class CheckServiceImpl implements CheckService {
	@Autowired
	private CheckDao checkDao;

	@Override
	public boolean clogin(WUser wuser, Model model) {
		List<WUser> list = checkDao.clogin(wuser);
		if(list.size() > 0 && list.get(0) != null) {
			return true;
		}else {
			model.addAttribute("msg", "�û������������");
			return false;
		}
	}

	@Override
	public List<Map<String, Object>> seeCPaidByProid(Integer id) {
		return checkDao.seeCPaidByProid(id);
	}

	@Override
	public int updCOutcome(Integer id) {
		return checkDao.updCOutcome(id);
	}

}
