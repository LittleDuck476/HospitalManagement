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
	 * 患者登录页面初始化
	 */
	@RequestMapping("/p_toLogin")
	public String initLogin() {
		
		return "patient/login";
		
	}
	
	/**
	 * 处理登录功能
	 */
	@RequestMapping("/p_login")
	public String login(PUser puser, Model model,HttpSession session) {
		if(puserService.login(puser, model, session)) {
			return "patient/nav";
		}
		return "patient/login";
	}
	
	/**
	 * 患者注册页面初始化
	 */
	@RequestMapping("/p_toRegister")
	public String initRegister() {
		return "patient/register";
	}
	
	/**
	 * 处理患者注册功能
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
	 * 查看挂号单
	 */
	@RequestMapping("/p_reg")
	public String seereg(Model model,HttpSession session) {
		model.addAttribute("myRList", puserService.selectregByid(session));
		return "patient/reg";
	}
	/**
	 * 查看检查化验打印结果
	 */
	@RequestMapping("/p_check")
	public String seecheck(Model model,HttpSession session) {
		model.addAttribute("doneproList", puserService.selectcheckByid(session));
		return "patient/check";
	}
	/**
	 * 查看诊断结果
	 */
	@RequestMapping("/p_disease")
	public String seeoutcome(Model model,HttpSession session) {
		model.addAttribute("diseaseList", puserService.selectdisByPid(session));
		return "patient/outcome";
	}
}
