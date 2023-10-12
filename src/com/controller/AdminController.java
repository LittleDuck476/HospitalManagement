package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.po.DUser;
import com.po.Medicine;
import com.po.PUser;
import com.po.Project;
import com.po.WUser;
import com.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	/**
	 * 管理员处登录页面初始化
	 */
	@RequestMapping("/a_toLogin")
	public String initLogin() {
		return "admin/login";
	}
	@RequestMapping("/a_login")
	public String login(WUser wuser, Model model) {
		if(adminService.alogin(wuser, model)) {
			return "admin/nav";
		}
		return "admin/login";
	}
	/**
	 * 病患管理
	 */
	@RequestMapping("/a_patientm")
	public String patientm(Model model) {
		model.addAttribute("patientList", adminService.selectAllP());
		return "admin/patient";
	}
	@RequestMapping("/a_toaddp")
	public String toaddp() {
		return "admin/addp";
	}
	@RequestMapping("/addpatient")
	public String addpatient(PUser puser, Model model) {
		if(adminService.booleanadd(puser, model)) {
			adminService.addPUser(puser);
			return "forward:a_patientm";
		}
		return "admin/addp";
	}
	@RequestMapping("/a_updpById")
	public String updpById(Integer id, Model model) {
		model.addAttribute("patient", adminService.selectPById(id));
		return "admin/updatep";
	}
	@RequestMapping("/a_updpatient")
	public String updpatient(PUser puser, Model model) {
		if(adminService.booleanupd(puser, model)) {
			adminService.updPUser(puser);
			return "forward:a_patientm";
		}
		return "forward:a_updpById?id="+puser.getId();
	}
	@RequestMapping("/a_delpById")
	public String delpById(Integer id) {
		adminService.delPUser(id);
		return "forward:a_patientm";
	}
	/**
	 * 医生管理
	 */
	@RequestMapping("/a_doctorm")
	public String doctorm(Model model) {
		model.addAttribute("doctorList", adminService.selectAllD());
		return "admin/doctor";
	}
	@RequestMapping("/a_toaddd")
	public String toaddd() {
		return "admin/addd";
	}
	@RequestMapping("/adddoctor")
	public String adddoctor(DUser duser,Model model) {
		if(adminService.booleanaddD(duser, model)) {
			adminService.addDUser(duser);
			return "forward:a_doctorm";
		}
		return "admin/addd";
	}
	@RequestMapping("/a_upddById")
	public String upddById(Model model,Integer id) {
		model.addAttribute("doctor", adminService.selectDById(id));
		return "admin/updated";
	}
	@RequestMapping("/a_upddoctor")
	public String upddoctor(DUser duser,Model model) {
		if(adminService.booleanupdD(duser, model)) {
			adminService.updDUser(duser);
			return "forward:a_doctorm";
		}
		return "forward:a_upddById?id="+duser.getId();
	}
	@RequestMapping("/a_deldById")
	public String deldById(Integer id) {
		adminService.delDUser(id);
		return "forward:a_doctorm";
	}
	/**
	 * 医务人员管理
	 */
	@RequestMapping("/a_other")
	public String otherm(Model model) {
		model.addAttribute("workerList", adminService.selectAllW());
		return "admin/worker";
	}
	@RequestMapping("/a_toaddw")
	public String toaddw() {
		return "admin/addw";
	}
	@RequestMapping("/addworker")
	public String addworker(WUser wuser,Model model) {
		if(adminService.booleanaddW(wuser, model)) {
			adminService.addWUser(wuser);
			return "forward:a_other";
		}
		return "admin/addw";
	}
	@RequestMapping("/a_updwById")
	public String updwById(Integer id,Model model) {
		model.addAttribute("worker", adminService.selectWById(id));
		return "admin/updatew";
	}
	@RequestMapping("/a_updworker")
	public String updworker(WUser wuser,Model model) {
		if(adminService.booleanupdW(wuser, model)) {
			adminService.updWUser(wuser);
			return "forward:a_other";
		}
		return "forward:a_updwById?id="+wuser.getId();
	}
	@RequestMapping("/a_delwById")
	public String delwById(Integer id) {
		adminService.delWUser(id);
		return "forward:a_other";
	}
	/**
	 * 项目管理
	 */
	@RequestMapping("/a_projectm")
	public String projectm(Model model) {
		model.addAttribute("projectList", adminService.selectAllPro());
		return "admin/project";
	}
	@RequestMapping("/a_toaddpro")
	public String toaddpro() {
		return "admin/addpro";
	}
	@RequestMapping("/addproject")
	public String addproject(Project project,Model model) {
		if(adminService.booleanaddPro(project, model)) {
			adminService.addPro(project);
			return "forward:a_projectm";
		}
		return "admin/addpro";
	}
	@RequestMapping("/a_updproById")
	public String updproById(Integer id,Model model) {
		model.addAttribute("project", adminService.selectProById(id));
		return "admin/updatepro";
	}
	@RequestMapping("/a_updproject")
	public String updproject(Project project,Model model) {
		if(adminService.booleanupdPro(project, model)) {
			adminService.updPro(project);
			return "forward:a_projectm";
		}
		return "redirect:a_updproById?id="+project.getId();
	}
	@RequestMapping("/a_delproById")
	public String delproById(Integer id) {
		adminService.delPro(id);
		return "forward:a_projectm";
	}
	/**
	 * 药品管理
	 */
	@RequestMapping("/a_medicinem")
	public String medicinem(Model model) {
		model.addAttribute("medicineList", adminService.selectAllM());
		return "admin/medicine";
	}
	@RequestMapping("/a_toaddm")
	public String toaddm() {
		return "admin/addm";
	}
	@RequestMapping("/addmedicine")
	public String addmedicine(Medicine medicine,Model model) {
		if(adminService.booleanaddM(medicine, model)) {
			adminService.addM(medicine);
			return "forward:a_medicinem";
		}
		return "admin/addm";
	}
	@RequestMapping("/a_updmById")
	public String updmById(Integer id,Model model) {
		model.addAttribute("medicine", adminService.selectMById(id));
		return "admin/updatem";
	}
	@RequestMapping("/a_updmedicine")
	public String updmedicine(Medicine medicine,Model model) {
		if(adminService.booleanupdM(medicine, model)) {
			adminService.updM(medicine);
			return "forward:a_medicinem";
		}
		return "forward:a_updmById?id="+medicine.getId();
	}
	@RequestMapping("/a_delmById")
	public String delmById(Integer id) {
		adminService.delM(id);
		return "forward:a_medicinem";
	}
	
	/**
	 * 根据人员类别查询
	 */
	@RequestMapping("/a_seerole")
	public String seerole(@RequestParam Integer role,Model m) {
		m.addAttribute("workerList", adminService.selectRole(role));
		return "admin/worker";
	}

}
