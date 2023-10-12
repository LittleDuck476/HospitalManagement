package com.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.dao.PUserDao;
import com.po.PUser;
import com.util.MyUtil;
@Service
@Transactional
public class PUserServiceImpl implements PUserService{
	@Autowired
	private PUserDao puserDao;
	@Override
	public boolean register(PUser puser, Model model, HttpSession session) {
		List<PUser> list = puserDao.register(puser);
		if(list.size() == 0) {
			return true;
		}else {
			model.addAttribute("msg", "�˵绰��ע�ᣡ");
			return false;
		}
	}
	@Override
	public int insertp(@ModelAttribute PUser puser,Model model) {
		model.addAttribute("msg", "ע��ɹ�");
		return puserDao.insertp(puser);
	}
	@Override
	public boolean login(PUser puser, Model model, HttpSession session) {
		List<PUser> list = puserDao.login(puser);
		if(list.size() > 0) {
			session.setAttribute("puser", list.get(0));
			return true;
		}else {
			model.addAttribute("msg", "�û������������������Ϣ��������ϵ������Ա����");
			return false;
		}
	}
	@Override
	public List<Map<String, Object>> selectdisByPid(HttpSession session) {
		return puserDao.selectdisByPid(MyUtil.getPUserId(session));
	}
	@Override
	public List<Map<String, Object>> selectregByid(HttpSession session) {
		return puserDao.selectregByid(MyUtil.getPUserId(session));
	}
	@Override
	public List<Map<String, Object>> selectcheckByid(HttpSession session) {
		return puserDao.selectcheckByid(MyUtil.getPUserId(session));
	}

}
