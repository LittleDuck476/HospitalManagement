package com.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.PUserService;

import com.po.PUser;

@Controller
public class PatientController {
	@Autowired
	private PUserService puserService;
	/**
	 * ���ߵ�¼ҳ���ʼ��
	 */
	@RequestMapping("/p_toLogin")
	public String initLogin() {
		
		return "patient/login";
		
	}
	
	/**
	 * �����¼����
	 */
	@RequestMapping("/p_login")
	public String login(PUser puser, Model model,HttpSession session) {
		if(puserService.login(puser, model, session)) {
			return "patient/nav";
		}
		return "patient/login";
	}
	
	/**
	 * ����ע��ҳ���ʼ��
	 */
	@RequestMapping("/p_toRegister")
	public String initRegister() {
		return "patient/register";
	}
	
	/**
	 * ������ע�Ṧ��
	 */
	@RequestMapping("/p_register")
	public String register(PUser puser, Model model,HttpSession session) {
		if(puserService.register(puser, model, session)) {
			puserService.insertp(puser,model);
			return "patient/login";
		}
		return "patient/register";
	}
	/**
	 * �鿴�Һŵ�
	 */
	@RequestMapping("/p_reg")
	public String seereg(Model model,HttpSession session) {
		model.addAttribute("myRList", puserService.selectregByid(session));
		return "patient/reg";
	}
	/**
	 * �鿴��黯���ӡ���
	 */
	@RequestMapping("/p_check")
	public String seecheck(Model model,HttpSession session) {
		model.addAttribute("doneproList", puserService.selectcheckByid(session));
		return "patient/check";
	}
	/**
	 * �鿴��Ͻ��
	 */
	@RequestMapping("/p_disease")
	public String seeoutcome(Model model,HttpSession session) {
		model.addAttribute("diseaseList", puserService.selectdisByPid(session));
		return "patient/outcome";
	}
}
