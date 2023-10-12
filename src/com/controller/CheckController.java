package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.po.WUser;
import com.service.CheckService;
import com.service.DUserService;

@Controller
public class CheckController {
	int pro;
	@Autowired
	private CheckService checkService;
	@Autowired
	private DUserService duserService;
	/**
	 * 检查化验处登录页面初始化
	 */
	@RequestMapping("/c_toLogin")
	public String initLogin() {
		return "check/login";
	}
	/**
	 * 处理检查化验处登录
	 */
	@RequestMapping("/c_login")
	public String login(WUser wuser, Model model) {
		if(checkService.clogin(wuser, model)) {
			model.addAttribute("projecttypeList", duserService.seeProTypeList());
			return "check/check";
		}
		return "check/login";
	}
	/**
	 * 检查化验处功能处理
	 */
	@RequestMapping("/c_checkpro")
	public String checkpro(@RequestParam(required=false,defaultValue="0")int project,Model m) {
		pro=project;
		m.addAttribute("projecttypeList", duserService.seeProTypeList());
		m.addAttribute("paidproList", checkService.seeCPaidByProid(project));
		return "check/check";
	}
	@RequestMapping("/c_printoutcome")
	public String printoutcome(Integer id,Model m) {
		checkService.updCOutcome(id);
		m.addAttribute("paidproList", checkService.seeCPaidByProid(pro));
		m.addAttribute("projecttypeList", duserService.seeProTypeList());
		return "check/check";
	}

}
