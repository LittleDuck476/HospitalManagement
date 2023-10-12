package com.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.po.WUser;

public interface MedicineService {
	boolean mlogin(WUser wuser,Model model);
	List<Map<String,Object>> seePrePaid();
	int updPreOutcome(Integer id);
	int updMedstore(Integer medid,int amount);

}
