package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.po.WUser;
import com.service.MedicineService;

@Controller
public class MedicineController {
	@Autowired
	private MedicineService medicineService;
	/**
	 * ҩ������¼ҳ���ʼ��
	 */
	@RequestMapping("/m_toLogin")
	public String initLogin() {
		return "medicine/login";
	}
	/**
	 * ����ҩ������¼
	 */
	@RequestMapping("/m_login")
	public String login(WUser wuser, Model model) {
		if(medicineService.mlogin(wuser, model)) {
			model.addAttribute("paidpreList", medicineService.seePrePaid());
			return "medicine/index";
		}
		return "medicine/login";
	}
	/**
	 * ����ҵ��
	 */
	@RequestMapping("/m_display")
	public String printList(Model model) {
		model.addAttribute("paidpreList", medicineService.seePrePaid());
		return "medicine/index";
	}
	@RequestMapping("/m_giveout")
	public String giveout(Model model,@RequestParam(required=false,defaultValue="0")Integer id,@RequestParam(required=false,defaultValue="0")Integer medid,@RequestParam(required=false,defaultValue="0")int amount) {
		medicineService.updPreOutcome(id);
		medicineService.updMedstore(medid, amount);
		return "redirect:m_display";
	}

}
