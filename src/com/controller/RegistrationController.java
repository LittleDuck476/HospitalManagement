package com.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.po.WUser;
import com.service.RegistrationService;

@Controller
public class RegistrationController {
	Map<String,Object> map = new HashMap<String,Object>();
	@Autowired
	private RegistrationService registrationService;
	/**
	 * 挂号处页面初始化
	 */
	@RequestMapping("/r_toLogin")
	public String initLogin() {
		return "registration/login";
	}
	
	/**
	 * 处理挂号处登录
	 */
	@RequestMapping("/r_login")
	public String login(WUser wuser, Model model,HttpSession session) {
		if(registrationService.rlogin(wuser, model, session)) {
			model.addAttribute("patientList", registrationService.seeAllPatient());
			session.setAttribute("wuser", wuser);
			return "registration/registration";
		}
		return "registration/login";
	}
	/**
	 * 处理挂号
	 */
	@RequestMapping("/r_operate")
	public String initRegister(Model model) {
		model.addAttribute("patientList", registrationService.seeAllPatient());
		return "registration/registration";
	}
	@RequestMapping("/checkpatient")
	public String checkpatient(Integer id, Model model) {
		map.put("p_id", id);
		model.addAttribute("doctorList", registrationService.seeAllDoctor());
		return "registration/docheck";
	}
	@RequestMapping("/showtype")
	public String showtype(@RequestParam(required=false,defaultValue="0")int type,Model m) {
		m.addAttribute("doctorList", registrationService.seeTypeDoctor(type));
		return "registration/docheck";
	}
	@RequestMapping("/search")
	public String search(Model m, String mykey) {
		m.addAttribute("doctorList", registrationService.search(mykey));
		return "registration/docheck";
	}
	@RequestMapping("/checkdoctor")
	public String checkdoctor(Integer id,Model model) {
		map.put("d_id", id);
		registrationService.insertRTable(map,model);
		return "forward:r_operate";
	}
	/**
	 * 查询挂号单
	 */
	@RequestMapping("/r_tablecheck")
	public String tablecheck(Model m) {
		m.addAttribute("RTableList", registrationService.selectRTable());
		return "registration/seeAllRTable";
		
	}
	/**
	 * 检查化验收费
	 */
	@RequestMapping("/r_ccashier")
	public String ccashier(Model m) {
		m.addAttribute("CTableList", registrationService.seeAllCTable());
		return "registration/seeAllCTable";
	}
	@RequestMapping("/updCTableById")
	public String updCTableById(Integer id,Model model) {
		registrationService.updCFee(id,model);
		return "forward:r_ccashier";
	}
	/**
	 * 处方药收费
	 */
	@RequestMapping("/r_mcashier")
	public String precashier(Model m) {
		m.addAttribute("PreTableList", registrationService.seeAllPreTable());
		return "registration/seeAllPreTable";
	}
	@RequestMapping("/updPreTableById")
	public String updPreTableById(Integer id,Model model) {
		registrationService.updPreFee(id,model);
		return "forward:r_mcashier";
	}

}
