package com.util;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import com.po.PUser;
import com.po.DUser;

public class MyUtil {
	/**
	 * 获得时间字符串
	 */
	public static String getStringID(){
		String id=null;
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS"); 
		id=sdf.format(date);
		return id;
	}
	/**
	 * 获得医生用户ID
	 */
	public static Integer getDUserId(HttpSession session) {
		DUser dsuer = (DUser)session.getAttribute("duser");
		return dsuer.getId();
	}
	public static Integer getPUserId(HttpSession session) {
		PUser psuer = (PUser)session.getAttribute("puser");
		return psuer.getId();
	}
}
