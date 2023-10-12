package com.service;


import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.po.WUser;

public interface CheckService {
	boolean clogin(WUser wuser,Model model);
	List<Map<String,Object>> seeCPaidByProid(Integer id);
	int updCOutcome(Integer id);

}
