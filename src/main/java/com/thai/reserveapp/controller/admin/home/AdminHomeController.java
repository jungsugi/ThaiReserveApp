package com.thai.reserveapp.controller.admin.home;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("AdminHomeController")
@RequestMapping("/admin/home/")
public class AdminHomeController {
	
	@RequestMapping("list")
	@ResponseBody
	public String getlist() {
		
		return "getlist() ȣ��";
	}
	
	
	@RequestMapping("signupen")
	public String signupEnterprise() {
		
		
		return "admin.home.signupen";
	}
	
	
}
