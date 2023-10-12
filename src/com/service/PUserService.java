package com.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.po.PUser;

public interface PUserService {
	boolean register(PUser puser,Model model,HttpSession session);
	public int insertp(PUser puser,Model model);
	boolean login(PUser puser,Model model,HttpSession session);
	List<Map<String,Object>> selectdisByPid(HttpSession session);
	List<Map<String,Object>> selectregByid(HttpSession session);
	List<Map<String,Object>> selectcheckByid(HttpSession session);

}
