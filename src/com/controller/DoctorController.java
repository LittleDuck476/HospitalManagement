package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.po.DUser;
import com.service.DUserService;

@Controller
public class DoctorController {
	@Autowired
	private DUserService duserService;
	
	/**
	 * ҽ����¼ҳ���ʼ��
	 */
	@RequestMapping("/d_toLogin")
	public String initLogin() {
		return "doctor/login";
	}
	/**
	 * ����ҽ����¼
	 */
	@RequestMapping("/d_login")
	public String login(DUser duser, Model model,HttpSession session) {
		if(duserService.dlogin(duser, model, session)) {
			return "doctor/nav";
		}
		return "doctor/login";
	}
	/**
	 * ����鵥
	 */
	@RequestMapping("/d_checklist")
	public String checklist(HttpSession session,Model model) {
		model.addAttribute("registrationList", duserService.selectRTableByDId(session));
		model.addAttribute("projecttypeList", duserService.seeProTypeList());
		return "doctor/checklist";
	}
	@RequestMapping("/d_insertchtable")
	public String insertchecktable(HttpSession session,Model model,@RequestParam(required=false) Integer pid,@RequestParam(required=false) Integer project) {
		duserService.addCTable(session, pid, project,model);
		return "forward:d_checklist";
	}
	/**
	 * �����鵥
	 */
	@RequestMapping("/d_checklistm")
	public String checktablem(HttpSession session,Model model) {
		model.addAttribute("unpaidproList", duserService.selectCTableByDid(session));
		model.addAttribute("projecttypeList", duserService.seeProTypeList());
		return "doctor/checktablem";
		
	}
	@RequestMapping("/d_updcheck")
	public String updchecktable(@RequestParam(required=false) Integer id,@RequestParam(required=false) Integer project,Model model) {
		duserService.updCTable(id, project,model);
		return "forward:d_checklistm";
	}
	@RequestMapping("/d_delcheck")
	public String delcheck(@RequestParam(required=false) Integer id) {
		duserService.delCTable(id);
		return "forward:d_checklistm";
	}
	/**
	 * ���������/ҽ��
	 */
	@RequestMapping("/d_disease")
	public String disease(HttpSession session,Model model) {
		model.addAttribute("registrationList", duserService.selectRTableByDId(session));
		return "doctor/disease";
	}
	@RequestMapping("/d_insertdistable")
	public String insertdistable(HttpSession session,Model model,@RequestParam(required=false) Integer pid,@RequestParam(required=false) String disease,@RequestParam(required=false) String advice) {
		duserService.addDisTable(session, pid, disease, advice,model);
		return "forward:d_disease";
	}
	/**
	 * ������
	 */
	@RequestMapping("/d_prescription")
	public String prescription(HttpSession session,Model model) {
		model.addAttribute("registrationList", duserService.selectRTableByDId(session));
		model.addAttribute("medicineList", duserService.seeMedicine());
		return "doctor/prescription";
	}
	@RequestMapping("/d_insertpretable")
	public String insertpretable(HttpSession session,Model model,@RequestParam(required=false) Integer pid,@RequestParam(required=false) int medicine,@RequestParam(required=false) int amount) {
		duserService.addPreTable(session, pid, medicine, amount,model);
		return "forward:d_prescription";
	}
	/**
	 * ��������
	 */
	@RequestMapping("/d_prescriptionm")
	public String prescriptionm(Model model,HttpSession session) {
		model.addAttribute("unpaidpreList", duserService.selectPreTableByDid(session));
		model.addAttribute("medicineList", duserService.seeMedicine());
		return "doctor/pretablem";
	}
	@RequestMapping("/d_updpre")
	public String updpretable(@RequestParam(required=false) Integer id,@RequestParam(required=false) int medicine,@RequestParam(required=false) int amount) {
		return "forward:d_prescriptionm";
	}
	@RequestMapping("/d_delpre")
	public String delpretable(@RequestParam(required=false) Integer id) {
		duserService.delPreTable(id);
		return "forward:d_prescriptionm";
	}

}
