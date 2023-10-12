package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.MedicineDao;
import com.po.WUser;

@Service
@Transactional
public class MedicineServiceImpl implements MedicineService {
	@Autowired
	private MedicineDao medicineDao;

	@Override
	public boolean mlogin(WUser wuser, Model model) {
		List<WUser> list = medicineDao.mlogin(wuser);
		if(list.size() > 0 && list.get(0) != null) {
			return true;
		}else {
			model.addAttribute("msg", "用户名或密码错误！");
			return false;
		}
	}

	@Override
	public List<Map<String, Object>> seePrePaid() {
		return medicineDao.seePrePaid();
	}

	@Override
	public int updPreOutcome(Integer id) {
		return medicineDao.updPreOutcome(id);
	}

	@Override
	public int updMedstore(Integer medid, int amount) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("id", medid);
		map.put("amount", amount);
		return medicineDao.updMedstore(map);
	}

}
